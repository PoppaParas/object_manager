-- @ScriptType: ModuleScript
--[[
Paras,12/31/25
object system that utilizes properties events and methods
]]
local object_manager = {}
script:WaitForChild("object")
local object = require "@self/object"
local typecasts = require "@self/utils/typecasts"
local event_manager = require "@self/utils/event_manager"
local templates = require "@self/templates"

export type templates = typeof(templates)
export type object_data<k> = object.object_data<k>
object_manager.new = object.new


function object_manager.get_template<k>(template:k|keyof<templates>)
	return templates[template]
end

object_manager.event_manager = event_manager

-- good shit bro 🔥
return object_manager
