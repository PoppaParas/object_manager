-- @ScriptType: ModuleScript
local typecasts = require("../utils/typecasts")
local table = require("../utils/table")

local component_system = {
	
}

local component_object = {

}

local component_object_meta = {
	__index = component_object,
	__call = function()

	end,
}



function component_system.new()
	
	local component_object = {	
		components = {},
		systems = {},
		
		next_id = 1
	}
	local self = setmetatable(component_object,component_object_meta)
	
	
	return self
	
end



return component_system
