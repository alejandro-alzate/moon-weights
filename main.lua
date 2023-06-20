local mw = require("moon-weights")
local layers = {}

--Pass a table telling the library the structure
--First is always taken like the input layer
--Last is always taken like the output layer
layers[1] = 748
layers[2] = 16
layers[3] = 16
layers[4] = 10

--A black box for making a weights & biases structure
--this will haunt me in the future
local weights = mw.newWeigths(layers)

local NeuralNetwork mw.newNetwork(layers, weights)