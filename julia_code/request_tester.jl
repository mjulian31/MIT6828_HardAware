include("request_handler.jl")

# matrix multiplication
function mult(x, y)
    @async begin
        notifier = Condition()
        req_num, _ = send_request(x, y, notifier)
        wait(notifier)
        # got response, return matrix
        return responses[req_num]
    end
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

println("parallel tests")

println("test 1...")
@threads for i = 1:2
    a = rand(10, 10)
    b = rand(10, 10)
    @assert mult(a, b) == a*b
end
println("done.")

println("test 2...")
@threads for i = 1:8
    a = rand(1001, 1024)
    b = rand(1024, 1008)
    @assert mult(a, b) == a*b
end
println("done.")

println("test 3...")
@threads for i = 1:30
    a = rand(10, 1024)
    b = rand(1024, 53)
    @assert mult(a, b) == a*b
end
println("done.")

close_sender()
