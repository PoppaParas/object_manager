-- @ScriptType: ModuleScript
--[[
Paras,12/31/25
object system that utilizes properties events and methods
]]
local object_manager = {}
script:WaitForChild("object")
local object = require("@self/object")
local typecasts = require("@self/utils/typecasts")
local event_manager = require("@self/utils/event_manager")

export type object_data<k> = object.object_data<k>
function object_manager.new_object<new_data>
(object_data:new_data|object.basic_object_data)
	--local obj = 
	object_data.methods = object_data.methods or {}
	local obj:object_data<new_data> = setmetatable(object_data,object)
	return obj
	--return thing
end


object_manager.event_manager = event_manager


return object_manager
