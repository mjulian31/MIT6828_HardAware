using Random
using Statistics
using FileIO
using Colors
using ImageTransformations
using Printf


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
    for i = 1:size(diff)[1]
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
    err_arr = zeros(size(y_true)[1], 1)
    for i = 1:size(y_true)[1]
        err_arr[i, :] .= mean((y_true[i, :] .- y_pred[i, :]).^2)
    end
    return err_arr
end


function d_mse(y_true, y_pred)
    d_err_arr = zeros(size(y_true)...)
    for i = 1:size(y_true)[1]
        d_err_arr[i, :] .= 2*(y_true[i, :] .- y_pred[i, :])/size(y_true)[2]
    end
    return d_err_arr
end


# prediction mapping
function get_preds(estimates, pred_map)
   preds = [] # will be (num_inputs, 1)
   for row = 1:size(estimates)[1]
       _, index = findmax(estimates[row, :]) # maximum value in row
       pred = pred_map[index[1]] # matching prediction
       push!(preds, pred) # add to list
   end
   return preds
end

# prediction vector
function onehot(pred, pred_map)
    index = findall(x->x==pred, pred_map)[1]
    vec = zeros(size(pred_map)[1])
    vec[index] = 1.0
    return vec
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

function net_train(net, x_train, y_train, epochs, learning_rate)
    for i = 1:epochs
        # forward prop
        output = x_train # 2d output array
        for (layer, prop_f, _) in net.layers
            output = prop_f(layer, output)
        end

        err_arr = net.loss(y_train, output) # error array

        # backward prop
        error = net.d_loss(y_train, output)
        for (layer, _, prop_b) in reverse(net.layers)
            error = prop_b(layer, error, learning_rate)
        end

        # average error
        err = mean(err_arr)
        @printf("epoch %d/%d error=%f\n", i, epochs, err)
    end
end


# prediction map
pred_map = ["Shiba_Dog", "French_bulldog", "Siberian_husky", "malamute", "German_shepherd", "Labrador_retriever", "Australian_Shepherd", "basset", "Yorkshire_terrier", "golden_retriever"]
num_features = size(pred_map)[1]

# size constants
const DIM = 512
imsize = (DIM, DIM)
shape = (1, DIM*DIM)

# load training data
num_train = 4
x_train = zeros(num_train, DIM*DIM)
y_train = zeros(num_train, num_features)
image_train_dir = "../images/images_train/"
let row_num = 1
    for dogdir_name in readdir(image_train_dir)
        if dogdir_name == ".DS_Store" # skip stupid files
            continue
        end
        full_path = joinpath(image_train_dir, dogdir_name)
        for img_name in readdir(full_path)
            img_path = joinpath(full_path, img_name)
            img = load(img_path)
            img_gray = Gray.(img) # convert to greyscale
            img_square = imresize(img_gray, imsize) # resize to square image
            img_flat = reshape(img_square, shape) # flatten
            img_arr = convert(Array{Float64}, img_flat) # convert to array
            x_train[row_num, :] = img_arr # set row to input vector
            dog_name = rsplit(dogdir_name, "-")[3] # get actual
            vec = onehot(dog_name, pred_map) # vector of prediction
            y_train[row_num, :] = vec # set row to output vector
            row_num += 1
        end
    end
end

# load testing data
num_test = 2
x_test = zeros(num_test, DIM*DIM)
y_test = zeros(num_test, num_features)
image_test_dir = "../images/images_test/"
let row_num = 1
    for dogdir_name in readdir(image_test_dir)
        if dogdir_name == ".DS_Store" # skip stupid files
            continue
        end
        full_path = joinpath(image_test_dir, dogdir_name)
        for img_name in readdir(full_path)
            img_path = joinpath(full_path, img_name)
            img = load(img_path)
            img_gray = Gray.(img) # convert to greyscale
            img_square = imresize(img_gray, imsize) # resize to square image
            img_flat = reshape(img_square, shape) # flatten
            img_arr = convert(Array{Float64}, img_flat) # convert to array
            x_test[row_num, :] = img_arr # set row to input vector
            dog_name = rsplit(dogdir_name, "-")[3] # get actual
            vec = onehot(dog_name, pred_map) # vector of prediction
            y_test[row_num, :] = vec # set row to output vector
            row_num += 1
        end
    end
end

# set up layers
fc1 = fc_layer(:none, :none, :none, :none)
fc_init(fc1, DIM*DIM, 256) # (num_train, DIMxDIM) -> (num_train, 256)
act1 = act_layer(elem_tanh, elem_d_tanh, :none, :none)
fc2 = fc_layer(:none, :none, :none, :none)
fc_init(fc2, 256, 64) # (num_train, 256) -> (num_train, 64)
act2 = act_layer(elem_tanh, elem_d_tanh, :none, :none)
fc3 = fc_layer(:none, :none, :none, :none)
fc_init(fc3, 64, 10) # (num_train, 64) -> (num_train, 10)
act3 = act_layer(elem_tanh, elem_d_tanh, :none, :none)

# set up network
net = network([(fc1, fc_forward, fc_backward),
                (act1, act_forward, act_backward),
                (fc2, fc_forward, fc_backward),
                (act2, act_forward, act_backward),
                (fc3, fc_forward, fc_backward),
                (act3, act_forward, act_backward)],
                mse, d_mse)

# run training, epochs=50, and learning_rate=0.1
net_train(net, x_train, y_train, 50, 0.1)

# test
out = net_pred(net, x_test, pred_map)
print("\npredicted values: ")
@show(out)
print("\n\ntrue values: ")
actual = get_preds(y_test, pred_map)
@show(actual)

# calculate percent correct
print("overall accuracy: ")
print(sum(out .== actual)/size(actual)[1]*100)
print("%\n")
