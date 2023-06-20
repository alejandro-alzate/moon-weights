love.graphics.setDefaultFilter('nearest', 'nearest')
local mw = require("moon-weights")
local lume = require("lume")
local lurker = require("lurker")
local lovebird = require("lovebird")
local layers = {}
local number1 = love.image.newImageData("1.png")
local drawablenum1 = love.graphics.newImage(number1)
--Pass a table telling the library the structure
--First is always taken like the input layer
--Last is always taken like the output layer
layers[1] = 784
layers[2] = 16
layers[3] = 16
layers[4] = 10

--A black box for making a weights & biases structure
--this will haunt me in the future
--local NeuralWeights = mw.newWeights(layers)

NeuralNetwork = mw.newNetwork(layers)
NeuralNetwork:setNewEmptyWeights()

	local index = 1
	for i=1, number1:getHeight() do
		for i2=1, number1:getWidth() do
			NeuralNetwork.network[1][index] = number1:getPixel(i2-1, i-1)
			index = index + 1
		end
	end

love.graphics.setBackgroundColor(0.5,0.5,0.5)

function love.update(dt)
	lurker.update(dt)
	lovebird.update(dt)
end

function love.draw()
	for i=1, #NeuralNetwork.network[1] do
		local x, y = i % number1:getHeight(), math.ceil(i / number1:getWidth())
		if y == 0 then
			y = number1:getHeight()
		end
		local value = tonumber(NeuralNetwork.network[1][i])
		love.graphics.setColor(1 - value, value, 0)
		love.graphics.rectangle("fill", x*10+30, y*10+30, 8, 8)
	end
	love.graphics.setColor(1,1,1,1)
	love.graphics.draw(drawablenum1, 330, 40, 0, 10, 10)
	love.graphics.print(love.timer.getFPS().. '\n')
end

function love.keypressed(key, scancode, isrepeat)
	if key == 'space' then
		NeuralNetwork:digest()
	end
end