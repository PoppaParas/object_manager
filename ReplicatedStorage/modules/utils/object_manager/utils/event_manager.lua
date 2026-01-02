-- @ScriptType: ModuleScript
--[[
Paras, 1/1/26
event manager class
manages all events
]]

local event = require "@self/event"

local event_manager = {}

local event_container = {}

local event_container_meta = {
	__index = event_container
}
export type event_container<events> = {
events:{}	
} & typeof(event_container_meta.__index)


function event_manager.new()
	local container:event_container<{}> = setmetatable({},event_container_meta)
	container.events = {}
	
	return container
end



function event_container.add_event_data<self,events>(self:self,events:events)
	
	local self:event_container<self> = self
	for i,v in events do
		self.events[i] = v
	end
	type container = event_container<self> & {
		events:events
	}
	local self:container = self 
	return self
end

function event_container.remove_event<self,name>(self:self,
	name:name|keyof<index<self,"events">>)
	local self:self&event_container<{}> = self
	local find:event = self.events[name]
	self.events[name] = nil
	if find then
		find:destroy()
	end
	local self:self&{
		events:{
			[name]:never
		}
	} = self 
	return self
	
end



export type event = event.event
function event_manager.create_event() 
	local base_data:event.base_event = {
		
	}
	base_data.function_list = {}
	base_data.threads = {}
	base_data.enabled = true
	base_data.__DESTROYED = false
	
	setmetatable(base_data,event)
	
	return base_data
end

return event_manager
