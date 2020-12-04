const SEND_PORT = 8080
const RECEIVE_PORT = 8081

const REQ_START = "^"
const REQ_END = "\$"
const DELIM = ","

const CPU_BINARY = "/opt/haws/bin/matmul_cpu"
const GPU_BINARY = "/opt/haws/bin/matmul_gpu"

const TILE_DIM = 32

GPU_ONLY = "gpu-only"
GPU_PREF = "gpu-please"
ANY = "any"
CPU_PREF = "cpu-please"
CPU_ONLY = "cpu-only"

request_num = 1


function get_gpu_threads(N, M)
    blocks_row = div(N + TILE_DIM - N%TILE_DIM, TILE_DIM)
    blocks_col = div(M + TILE_DIM - M%TILE_DIM, TILE_DIM)
    return blocks_row * blocks_col
end

function get_mat_strings(a, b)
    matstrings = string(a, b)
    return length(matstrings), matstrings
end

function get_cmd_args(N, R, M)
    return string(N, " ", R, " ", M, " norand")
end

function get_target_pref(N, R, M) #TODO
    return ANY
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

function make_request_string(num, cmd_args, target_pref, cpu_thread, gpu_cpu_thread, gpu_thread, cpu_ram, gpu_ram, gpu_mem, gpu_shared_mem, job_id, stdin_len, stdin_input)
    req_string = string(REQ_START, DELIM,
                        num, DELIM,
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

function generate_request(a, b, c)
    N, M = size(c)
    R = size(a, 2)

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
    stdin_len, stdin_input = get_mat_strings(a, b)

    num = request_num # TODO ATOMIC

    req_string = make_request_string(num, cmd_args, target_pref, cpu_thread, gpu_cpu_thread, gpu_thread, cpu_ram, gpu_ram, gpu_mem, gpu_shared_mem, job_id, stdin_len, stdin_input)

    return req_string
end

a = rand(3, 4)
b = rand(4, 5)
c = a*b
print("matrix a:\n")
@show a
print("matrix b:\n")
@show b
print("answer:\n")
@show c
print("request string:\n")
print(generate_request(a, b, c))
