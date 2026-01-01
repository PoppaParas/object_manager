-- @ScriptType: ModuleScript
local typecasts = require("./utils/typecasts")
local table = require("./utils/table")



local object = {
	class_name = "",
	methods = {},
	properties = {},
	events = {}
}
object.__index = object


function object.__newindex<index,value>
(self:object_data<index>,index:index,value:value)
	if index == "methods" or 
		index == "properties" or 
		index == "events" then
		if type(value) ~= "table" then
			return
		else
			rawset(self,index,value)
		end
	end
	local events = self.events
	
	local old_value = self[index]
	rawset(self,index,value)
	
end
export type basic_object_data = typeof(object)

export type object_data<k> = basic_object_data & k




function object:add_methods<object,methods>(methods:methods)
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
	type new_funcs = funcs & methods
	local funcs:new_funcs = funcs
	local self:object_data<object> & {
		methods:new_funcs,
		} = self 
	
	
	return self
end


function object:add_properties<object,new_properties>(new_properties:new_properties)
	local self:object_data<object> = self 

	local properties = self.properties

	type properties = typeof(properties)
	for i,v in new_properties do
		
		properties[i] = v
	end
	type newer_properties = properties & new_properties
	local properties:newer_properties = properties
	local self:object_data<object> & {
		properties:newer_properties,
	} = self 


	return self
end



function object:add_event<object,event_name,func>()
	
end





function object:clone()
	local clone = table.deep_clone(self)
	
	
	return clone
end

return object
