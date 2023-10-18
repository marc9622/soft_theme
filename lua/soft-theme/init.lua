local lush = require('lush')
local base = require('soft-theme.mystic')
local config_module = require('codeschool.config')
local config = config_module.config

local function setup(user_config)
	if user_config then
		config_module.apply_config(user_config)
	end

	return lush.merge({base})
end

return {setup = setup}
