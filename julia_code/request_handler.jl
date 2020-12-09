using Sockets
using Base.Threads
using Printf

const SEND_PORT = 8080
const RECEIVE_PORT = 8081

struct response
    req_num
    hardware
    wall_time
    cpu_time
    exit_code
    output_len
    output
end

@enum machine_type begin
    CL
    LOC
end

machine = LOC

@enum method_type begin
    CUTOFF
    CUTOFF_ANY
    CUTOFF_IDEAL
    LEVELS
end

method = LEVELS

@enum stdin_use begin
    YES
    NO
end

stdin = NO

const REQ_START = "^"
const REQ_END = "\$"
const DELIM = ','
const BAD_RESPONSE = response(0, :none, 0, 0, 1, 0, :none)

request_lock = ReentrantLock()
server = connect(SEND_PORT)
function close_sender()
    close(server)
end
atexit(close_sender)

const CPU_BINARY = "/opt/haws/bin/matmul_cpu"
const GPU_BINARY = "/opt/haws/bin/matmul_gpu"

const TILE_DIM = 32

GPU_ONLY = "gpu-only"
GPU_PREF = "gpu-please"
ANY = "any"
CPU_PREF = "cpu-please"
CPU_ONLY = "cpu-only"

request_num = Atomic{Int}(1)
responses = Dict([]) # request_num -> response
RESPONSE_LEN = 9
notifiers = Dict([]) # request_num -> notifier

function get_gpu_threads(N, M)
    blocks_row = div(N + TILE_DIM - 1, TILE_DIM)
    blocks_col = div(M + TILE_DIM - 1, TILE_DIM)
    return blocks_row * blocks_col
end

function get_mat_strings(a, b)
    a_low = round.(a, digits=10)
    b_low = round.(b, digits=10)
    matstrings = string(a_low, b_low)
    return length(matstrings), matstrings
end

function get_cmd_args(N, R, M)
    return string(N, " ", R, " ", M) #, " norand")
end

function get_target_pref(N, R, M)
    if machine == CL
        if method == LEVELS
            if N*M >= 1024*256
                return GPU_ONLY
            elseif N*M >= 1024*16
                return GPU_PREF
            elseif N*M <= 32*64
                return CPU_PREF
            elseif N*M <= 10*10
                return CPU_ONLY
            else
                return ANY
            end
        elseif method == CUTOFF_ANY
            if N*M >= 1024
                return GPU_ONLY
            elseif N*M <= 100
                return CPU_ONLY
            else
                return ANY
            end
        elseif method == CUTOFF_IDEAL
            if N*M >= 100
                return GPU_ONLY
            else
                return CPU_ONLY
            end
        else # CUTOFF
            if N*M >= 1024
                return GPU_ONLY
            else
                return CPU_ONLY
            end
        end
    else
        if method == LEVELS
            if N*M >= 1024*256
                return GPU_ONLY
            elseif N*M >= 1024*32
                return GPU_PREF
            elseif N*M <= 64*128
                return CPU_PREF
            elseif N*M <= 64*10
                return CPU_ONLY
            else
                return ANY
            end
        elseif method == CUTOFF_ANY
            if N*M >= 1024*32
                return GPU_ONLY
            elseif N*M <= 64*10
                return CPU_ONLY
            else
                return ANY
            end
        elseif method == CUTOFF_IDEAL
            if N*M >= 64*64
                return GPU_ONLY
            else
                return CPU_ONLY
            end
        else # CUTOFF
            if N*M >= 1024*32
                return GPU_ONLY
            else
                return CPU_ONLY
            end
        end
    end
end

function get_cpu_ram(N, R, M)
    return 2*(64*N*R + 64*R*M + 64*N*M)
end

function get_gpu_ram(N, R, M)
    return 2*(64*N*R + 64*R*M + 64*N*M)
end

function get_gpu_mem(N, R, M)
    return 64*N*R + 64*R*M + 64*N*M
end

function get_gpu_shared_mem(N, R, M)
    return 64*N*R + 64*R*M
end

function get_job_id(N, R, M)
    return string("matmul_", N, "_", R, "_", M)
end

function make_request_string(req_num, cmd_args, target_pref, cpu_thread, gpu_cpu_thread, gpu_thread, cpu_ram, gpu_ram, gpu_mem, gpu_shared_mem, job_id, stdin_len, stdin_input)
    req_string = string(REQ_START, req_num, DELIM,
                        CPU_BINARY, DELIM,
                        GPU_BINARY, DELIM,
                        cmd_args, DELIM,
                        target_pref, DELIM,
                        cpu_thread, DELIM,
                        gpu_cpu_thread, DELIM,
                        gpu_thread, DELIM,
                        cpu_ram, DELIM,
                        gpu_ram, DELIM,
                        gpu_mem, DELIM,
                        gpu_shared_mem, DELIM,
                        job_id, DELIM,
                        stdin_len, DELIM,
                        stdin_input, REQ_END)
    return req_string
end

function parse_matrix_output(matrix_string)
    lines = split(matrix_string, (';', '[', ']'), keepempty=false)
    out = zeros(Float64, size(lines, 1), size(split(lines[1], " ", keepempty=false), 1))
    for (row, line) in enumerate(lines)
        elems = split(line, " ", keepempty=false)
        for (col, elem) in enumerate(elems)
            out[row, col] = parse(Float64, elem)
        end
    end
    return out
end

function parse_response_string(response_str)
    req_arr = split(response_str, (DELIM, '\n'), keepempty=false)
    if size(req_arr, 1) != RESPONSE_LEN # checks splits on DELIM
        println("size mismatch!")
        return BAD_RESPONSE
    elseif req_arr[1] != REQ_START # checks right start
        println("error parsing bad start!")
        return BAD_RESPONSE
    elseif req_arr[end] != REQ_END # checks right end
        println("error parsing bad end!")
        return BAD_RESPONSE
    else # good response
        # good headers, parse
        req_num = parse(Int, req_arr[2])
        matrix_string = req_arr[end-1]
        output = parse_matrix_output(matrix_string)
        resp = response(req_num, req_arr[3:end-2]..., output)
        responses[req_num] = resp
        # notify waiting thread that we have the response saved
        if !(req_num in keys(notifiers))
            @show keys(notifiers), req_num
            @assert false
        end
        lock(notifiers[req_num])
        notify(notifiers[req_num])
        unlock(notifiers[req_num])
        return resp
    end
end

function send_request(a, b, req_notifier)
    N = size(a, 1)
    R = size(a, 2)
    M = size(b, 2)

    cmd_args = get_cmd_args(N, R, M)
    target_pref = get_target_pref(N, R, M)
    cpu_thread = 1
    gpu_cpu_thread = 1
    gpu_thread = get_gpu_threads(N, M)
    cpu_ram = get_cpu_ram(N, R, M)
    gpu_ram = get_gpu_ram(N, R, M)
    gpu_mem = get_gpu_mem(N, R, M)
    gpu_shared_mem = get_gpu_shared_mem(N, R, M)
    job_id = get_job_id(N, R, M)

    if stdin == YES
        stdin_len, stdin_input = get_mat_strings(a, b)
    else
        stdin_len, stdin_input = 0, ""
    end

    req_num = 0
    while true
        req_num = request_num[]
        if atomic_cas!(request_num, req_num, req_num + 1) === req_num
            # we aquired a request number
            break
        end
    end

    # make the request string
    req_string = make_request_string(req_num, cmd_args, target_pref, cpu_thread, gpu_cpu_thread, gpu_thread, cpu_ram, gpu_ram, gpu_mem, gpu_shared_mem, job_id, stdin_len, stdin_input)

    # save the notifier for later
    notifiers[req_num] = req_notifier

    # send request to server (locked operation)
    lock(request_lock)
    println(req_string)
    println(server, req_string)
    unlock(request_lock)

    # report back request sent
    return req_num, req_string
end

function start_reciever()
    @async begin
       listener = listen(RECEIVE_PORT)
       while true
           sock = accept(listener)
           t = @async try
               while isopen(sock)
                   response_str = readline(sock, keep=false)
                   # println("parsing response...")
                   response = parse_response_string(response_str)
                   # println("done parsing")
                   if response != BAD_RESPONSE
                       # println("got good response")
                   else
                       println("got bad response!")
                       # got a bad response, continue waiting
                       continue
                   end
               end
            catch err
                bt = catch_backtrace()
                println()
                showerror(stderr, err, bt)
            end
        end
        # while !istaskdone(t)
        #     println("listener is running...")
        #     sleep(1)
        # end
    end
end
