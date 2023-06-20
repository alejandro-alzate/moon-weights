--SO and AI a hot topic in this day and age
--This is a proof of concept that will be awfully slow
--But screw python!

local moonWeights = {}
moonWeights.__index = moonWeights

function moonWeights.newWeights(structure)
	assert(type(structure) == 'table', "New neural network weights $structure not accepted: \""..type(structure).."\"")
	local newWeights = {}
	for i=1, #structure do
		newWeights[i] = {}
	end
	for i,v in ipairs(structure) do
		print(i,v)
		assert(type(v) == 'number', "New neural network $structure layer not accepted")
		assert(v >= 1, "New neural network $structure layer cannot be less than 1")
		for i2 = 1, v do
			table.insert(newWeights[i], 0)
		end
	end
end

function moonWeights.newNetwork(structure, weights)
	assert(type(structure) == 'table', "New neural network $structure not accepted: \""..type(structure).."\"")
	local newNeuralNetwork = setmetatable({}, moonWeights)
	newNeuralNetwork.network = {}

	for i=1, #structure do
		newNeuralNetwork.network[i] = {}
	end
	for i,v in ipairs(structure) do
		assert(type(v) == 'number', "New neural network $structure layer not accepted")
		assert(v >= 1, "New neural network $structure layer cannot be less than 1")
		for i2 = 1, v do
			table.insert(newNeuralNetwork.network[i], 0)
		end
	end

	return newNeuralNetwork
end

--Sets a table with all the weight who the user can poke around
function moonWeights:setNewEmptyWeights()
	self.weights = {}
	for i,v in ipairs(self.network) do
		self.weights[i] = {}
		for t,k in ipairs(self.network[i]) do
			self.weights[i][t] = {weight = 0, bias = 0}
		end
	end
end

return moonWeights