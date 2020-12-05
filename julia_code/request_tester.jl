include("request_handler.jl")

# matrix multiplication
function mult(x, y)
    req_num, _ = send_request(x, y)
    while !haskey(responses, req_num)
        # wait for response to come back
    end
    # got response, return matrix
    return get(responses, req_num, :none)
end

start_reciever()

println("test 1...")
a = rand(10, 10)
b = rand(10, 10)
@assert mult(a, b) == a*b
println("done.")

println("test 2...")
a = rand(1024, 1000)
b = rand(1000, 1020)
@assert mult(a, b) == a*b
println("done.")

println("test 3...")
a = rand(4098, 10)
b = rand(10, 124)
@assert mult(a, b) == a*b
println("done.")

close_sender()
