local config = require "config"

for _, module in ipairs(config.modules) do
	require(module)
end
