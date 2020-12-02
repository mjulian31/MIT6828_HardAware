using Random
using Statistics
using FileIO
using Colors
using ImageTransformations
using Printf
using MLDatasets


# matrix multiplication
function mult(x, y)
    out = x*y
    return out
end


# fully connected layer functions
mutable struct fc_layer
    weights
    bias
    input
    output
end

function fc_init(fc, input_size, output_size)
    fc.weights = rand(input_size, output_size) .- 0.5
    fc.bias = rand(1, output_size) .- 0.5
end

function fc_forward(fc, input)
    fc.input = input
    fc.output = mult(fc.input, fc.weights) .+ fc.bias
    return fc.output
end

function fc_backward(fc, output_err, learning_rate)
    input_err = mult(output_err, transpose(fc.weights))
    weights_err = mult(transpose(fc.input), output_err)
    fc.weights -= learning_rate*weights_err
    diff = learning_rate*output_err
    for i = 1:size(diff, 1)
        fc.bias -= diff[i:i,:]
    end
    return input_err
end


# activation layer functions
mutable struct act_layer
    activation
    d_activation
    input
    output
end

function act_forward(act, input)
    act.input = input
    act.output = act.activation(act.input)
    return act.output
end

function act_backward(act, output_err, learning_rate)
    input_err = act.d_activation(act.input) .* output_err
    return input_err
end


# activation functions
function elem_tanh(x)
    return tanh.(x)
end

function elem_d_tanh(x)
    return 1 .- tanh.(x).^2
end


# loss functions
function mse(y_true, y_pred)
    err_arr = zeros(size(y_true, 1), 1)
    for i = 1:size(y_true, 1)
        err_arr[i, :] .= mean((y_true[i, :] .- y_pred[i, :]).^2)
    end
    return err_arr
end


function d_mse(y_true, y_pred)
    d_err_arr = zeros(size(y_true)...)
    for i = 1:size(y_true, 1)
        d_err_arr[i, :] .= 2*(y_pred[i, :] .- y_true[i, :])/size(y_true, 2)
    end
    return d_err_arr
end


# prediction mapping
function get_preds(estimates, pred_map)
   preds = [] # will be (num_inputs, 1)
   for row = 1:size(estimates, 1)
       _, index = findmax(estimates[row, :]) # maximum value in row
       pred = pred_map[index[1]] # matching prediction
       push!(preds, pred) # add to list
   end
   return preds
end


# prediction vector
function onehot_MNIST(pred, pred_map)
    mat = zeros(size(pred, 1), size(pred_map, 1)) # num_preds x num_features
    for i = 1:size(pred, 1)
        index = findall(x->x==pred[i], pred_map)[1]
        mat[i, index] = 1.0
    end
    return mat
end

function onehot_dogs(pred, pred_map)
    vec = zeros(1, size(pred_map, 1)) # 1 x num_features
    index = findall(x->x==pred, pred_map)[1]
    vec[1, index] = 1.0
    return vec
end


# randomize data
function randomize(arr1, arr2)
    len = size(arr1, 2)
    temp = hcat(arr1, arr2) # shuffle together
    temp = temp[shuffle(1:end), :] # shuffle rows
    return temp[:, 1:len], temp[:, len + 1:end]
end

function prep_data(input, DIM, final_DIM)
    arr = reshape(input, (1, DIM*DIM, :))
    arr = reshape(arr, (DIM*DIM, :))
    arr = transpose(arr)
    arr = imresize(arr, (size(arr,1), final_DIM*final_DIM))
    return arr
end


# network functions
struct network
    layers
    loss
    d_loss
end

function net_pred(net, input, pred_map)
    output = input # 2d output array

    # run network
    for (layer, prop_f, _) in net.layers
        output = prop_f(layer, output)
    end

    # calculate prediction based on output
    preds = get_preds(output, pred_map)

    return preds
end

function net_train(net, x_train, y_train, epochs, learning_rate, batch_size, pred_map)
    for epoch = 1:epochs
        err = 0
        # forward prop
        for j = 1:batch_size:size(x_train,1)
            output = x_train[j:j+batch_size-1, :]
            for (layer, prop_f, _) in net.layers
                output = prop_f(layer, output)
            end

            err += mean(net.loss(y_train[j:j+batch_size-1, :], output)) # error array

            # backward prop
            error = net.d_loss(y_train[j:j+batch_size-1, :], output)
            for (layer, _, prop_b) in reverse(net.layers)
                error = prop_b(layer, error, learning_rate)
            end
        end

        # average error
        err /= size(x_train, 1)
        if epoch % 5 == 0 # every 5 epochs calculate prediction percentage
            preds = net_pred(net, x_train, pred_map)
            actual = get_preds(y_train, pred_map)
            accuracy = sum(preds .== actual)/size(preds, 1)*100
            @printf("epoch %d/%d average error=%f, train accuracy=%f %%\n", epoch, epochs, err, accuracy)
        else
            @printf("epoch %d/%d average error=%f\n", epoch, epochs, err)
        end
    end
end


pred_map = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

x_train, y_train = MNIST.traindata(Float64, 1:4096)
x_test, y_test  = MNIST.testdata(Float64, 1:512)
DIM = 128
num_features = size(pred_map, 1)

x_train = prep_data(x_train, 28, DIM)
y_train = onehot_MNIST(y_train, pred_map)

x_test = prep_data(x_test, 28, DIM)
y_test = onehot_MNIST(y_test, pred_map)

# set up layers
fc1 = fc_layer(:none, :none, :none, :none)
fc_init(fc1, DIM*DIM, 512) # (num_train, DIMxDIM) -> (num_train, 128)
act1 = act_layer(elem_tanh, elem_d_tanh, :none, :none)
fc2 = fc_layer(:none, :none, :none, :none)
fc_init(fc2, 512, 64) # (num_train, 128) -> (num_train, 64)
act2 = act_layer(elem_tanh, elem_d_tanh, :none, :none)
fc3 = fc_layer(:none, :none, :none, :none)
fc_init(fc3, 64, num_features) # (num_train, 64) -> (num_train, num_features)
act3 = act_layer(elem_tanh, elem_d_tanh, :none, :none)

# set up network
net = network([(fc1, fc_forward, fc_backward),
                (act1, act_forward, act_backward),
                (fc2, fc_forward, fc_backward),
                (act2, act_forward, act_backward),
                (fc3, fc_forward, fc_backward),
                (act3, act_forward, act_backward)],
                mse, d_mse)

# run training, epochs=100, learning_rate=0.1, and batch_size=32
net_train(net, x_train, y_train, 100, 0.1, 32, pred_map)

# test
out = net_pred(net, x_test, pred_map)
actual = get_preds(y_test, pred_map)

# calculate percent correct
accuracy = sum(out .== actual)/size(actual, 1)*100
@printf("final accuracy: %f %%\n", accuracy)