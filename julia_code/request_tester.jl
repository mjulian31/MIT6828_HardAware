include("request_handler.jl")

# matrix multiplication
function mult(x, y)
    notifier = Condition()
    req_num, _ = send_request(x, y, notifier)
    wait(notifier)
    # got response, return matrix
    return responses[req_num].output
end

function test_matrix(res, a, b)
    a_low = round.(a, digits=10)
    b_low = round.(b, digits=10)
    max_diff = maximum(abs, (a_low*b_low - res))
    mean_diff = mean(abs, (a_low*b_low - res))
    @show max_diff
    @show mean_diff
    return max_diff < 1e-3 && mean_diff < 1e-6
end

start_reciever()

println("test 1...")
a = rand(10, 10)
b = rand(10, 10)
res = mult(a, b)
@assert test_matrix(res, a, b)
println("done.")

println("test 2...")
a = rand(1024, 1000)
b = rand(1000, 1020)
res = mult(a, b)
@assert test_matrix(res, a, b)
println("done.")

println("test 3...")
a = rand(4098, 10)
b = rand(10, 124)
res = mult(a, b)
@assert test_matrix(res, a, b)
println("done.")

println("parallel tests")

println("test 1...")
@threads for i = 1:2
    a = rand(10, 10)
    b = rand(10, 10)
    res = mult(a, b)
    @assert test_matrix(res, a, b)
end
println("done.")

println("test 2...")
@threads for i = 1:8
    a = rand(1001, 1024)
    b = rand(1024, 1008)
    res = mult(a, b)
    @assert test_matrix(res, a, b)
end
println("done.")

println("test 3...")
@threads for i = 1:30
    a = rand(10, 1024)
    b = rand(1024, 53)
    res = mult(a, b)
    @assert test_matrix(res, a, b)
end
println("done.")

close_sender()
