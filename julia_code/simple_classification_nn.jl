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
function onehot(pred, pred_map)
    mat = zeros(size(pred, 1), size(pred_map, 1)) # num_preds x num_features
    for i = 1:size(pred, 1)
        index = findall(x->x==pred[i], pred_map)[1]
        mat[i, index] = 1.0
    end
    return mat
end


# randomize data
function randomize(arr1, arr2)
    len = size(arr1, 2)
    temp = hcat(arr1, arr2) # shuffle together
    temp = temp[shuffle(1:end), :] # shuffle rows
    return temp[:, 1:len], temp[:, len + 1:end]
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

function net_train(net, x_train, y_train, epochs, learning_rate, batch_size)
    for i = 1:epochs
        err = 0
        # forward prop
        for j = 1:batch_size:size(x_train,1)
            output = x_train[j:j+batch_size-1, :]
            for (layer, prop_f, _) in net.layers
                output = prop_f(layer, output)
            end

            err += net.loss(y_train[j:j+batch_size-1, :], output)[1] # error array

            # backward prop
            error = net.d_loss(y_train[j:j+batch_size-1, :], output)
            for (layer, _, prop_b) in reverse(net.layers)
                error = prop_b(layer, error, learning_rate)
            end
        end

        # average error
        err /= size(x_train, 1)
        @printf("epoch %d/%d error=%f\n", i, epochs, err)
    end
end


# # prediction map
# pred_map = ["Shiba_Dog", "French_bulldog", "Siberian_husky", "malamute", "German_shepherd", "Labrador_retriever", "Australian_Shepherd", "basset", "Yorkshire_terrier", "golden_retriever", "Irish_setter", "Bernese_mountain_dog", "Newfoundland", "Great_Pyrenees", "Bull_mastiff", "Shetland_sheepdog"]
# num_features = size(pred_map, 1)
#
# # size constants
# const DIM = 64
# imsize = (DIM, DIM)
# shape = (1, DIM*DIM)
#
# # load training data
# num_train = 1024
# x_train = zeros(num_train, DIM*DIM)
# y_train = zeros(num_train, num_features)
# image_train_dir = "../images/images_train/"
# let row_num = 1
#     for dog_name in readdir(image_train_dir)
#         if dog_name == ".DS_Store" # skip stupid files
#             continue
#         end
#         full_path = joinpath(image_train_dir, dog_name)
#         for img_name in readdir(full_path)
#             if img_name == ".DS_Store" # skip stupid files
#                 continue
#             end
#             img_path = joinpath(full_path, img_name)
#             img = load(img_path)
#             img_gray = Gray.(img) # convert to greyscale
#             img_square = imresize(img_gray, imsize) # resize to square image
#             img_flat = reshape(img_square, shape) # flatten
#             img_arr = convert(Array{Float64}, img_flat) # convert to array
#             x_train[row_num, :] = img_arr # set row to input vector
#             vec = onehot(dog_name, pred_map) # vector of prediction
#             y_train[row_num, :] = vec # set row to output vector
#             row_num += 1
#             if row_num > num_train
#                 break
#             end
#         end
#         if row_num > num_train
#             break
#         end
#     end
# end
#
# # load testing data
# num_test = 128
# x_test = zeros(num_test, DIM*DIM)
# y_test = zeros(num_test, num_features)
# image_test_dir = "../images/images_test/"
# let row_num = 1
#     for dog_name in readdir(image_test_dir)
#         if dog_name == ".DS_Store" # skip stupid files
#             continue
#         end
#         full_path = joinpath(image_test_dir, dog_name)
#         for img_name in readdir(full_path)
#             if img_name == ".DS_Store" # skip stupid files
#                 continue
#             end
#             img_path = joinpath(full_path, img_name)
#             img = load(img_path)
#             img_gray = Gray.(img) # convert to greyscale
#             img_square = imresize(img_gray, imsize) # resize to square image
#             img_flat = reshape(img_square, shape) # flatten
#             img_arr = convert(Array{Float64}, img_flat) # convert to array
#             x_test[row_num, :] = img_arr # set row to input vector
#             vec = onehot(dog_name, pred_map) # vector of prediction
#             y_test[row_num, :] = vec # set row to output vector
#             row_num += 1
#             if row_num > num_test
#                 break
#             end
#         end
#         if row_num > num_test
#             break
#         end
#     end
# end

pred_map = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

x_train, y_train = MNIST.traindata(Float64, 1:10000)
x_test, y_test  = MNIST.testdata(Float64, 1:1000)
DIM = 28
num_features = size(pred_map, 1)

x_train = reshape(x_train, (1, DIM*DIM, :))
x_train = reshape(x_train, (DIM*DIM, :))
x_train = transpose(x_train)
y_train = onehot(y_train, pred_map)

x_test = reshape(x_test, (1, DIM*DIM, :))
x_test = reshape(x_test, (DIM*DIM, :))
x_test = transpose(x_test)
y_test = onehot(y_test, pred_map)

# set up layers
fc1 = fc_layer(:none, :none, :none, :none)
fc_init(fc1, DIM*DIM, 128) # (num_train, DIMxDIM) -> (num_train, 128)
act1 = act_layer(elem_tanh, elem_d_tanh, :none, :none)
fc2 = fc_layer(:none, :none, :none, :none)
fc_init(fc2, 128, 64) # (num_train, 128) -> (num_train, 64)
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

# run training, epochs=50, learning_rate=0.1, and batch_size=16
net_train(net, x_train, y_train, 100, 0.1, 16)

# test
out = net_pred(net, x_test, pred_map)

# calculate percent correct
print("overall accuracy: ")
print(sum(out .== actual)/size(actual, 1)*100)
print("%\n")
