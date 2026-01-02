-- @ScriptType: ModuleScript
local typecasts = require "./utils/typecasts"
local table = require "./utils/table"
local event_manager = require "./utils/event_manager"

local methods = {}
local events = {}
local event_container:event_manager.event_container<{}> = {}
local properties = {}

local object = {
	class_name = "",
	methods = methods,
	properties = properties,
	events = {}
}
object.__index = object


export type basic_object_data = typeof(object)

export type object_data<k> = basic_object_data & k

function object.new<new_data>(object_data:new_data|basic_object_data)
	--local obj = 
	object_data.methods = object_data.methods or {}
	local obj:object_data<new_data> = setmetatable(object_data,object)
	return obj
	--return thing
end


function object.add_methods<object,methods>(self:object,methods:methods)
	local self:object_data<object> = self 
	
	local funcs = self.methods
	
	type funcs = typeof(funcs)
	for i,v in methods do
		local function changed_method<k...>(...:k...)
			local method_results = table.pack(pcall(v,...))
			if method_results[1] then
				table.remove(method_results,1)
				return table.unpack(method_results)
			else
				warn(`METHOD {i} IS NOT WORKING: `,method_results[2])
			end
		end
		funcs[i] = changed_method
	end

	local self:object_data<object> & {
		methods:methods,
		} = self 
	
	
	return self
end


function object.add_properties<object,new_properties>(self:object,new_properties:new_properties)
local self:object&object_data<object> = self

	local properties = self.properties

	type properties = typeof(properties)
	for i,v in new_properties do
		
		properties[i] = v
	end
	type newer_properties =  new_properties
	local properties:newer_properties = properties
	
	local self:typeof(self) & {
		properties:newer_properties,
	} = self 
	

	return self
end



function object.add_events<object,new_events>(self:object,new_events:new_events)
	local self:object&object_data<object> = self

	local events = self.events
	

	type properties = typeof(properties)
	for i,v in new_events do

		properties[i] = v
	end

	local events:new_events = events

	local self:typeof(self) & {
		events:new_events,
	} = self 


	return self
end




function object:clone()
	return table.deep_clone(self)
end

return object
