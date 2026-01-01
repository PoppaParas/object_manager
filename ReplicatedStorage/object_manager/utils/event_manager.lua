-- @ScriptType: ModuleScript
--[[
Paras, 1/1/26
event manager class
manages all events
]]

local event = require("@self/event")

local event_manager = {}

local event_container = {}

local event_container_meta = {
	__index = event_container
}
export type event_container<events> = setmetatable<{
	events:{}
},typeof(event_container_meta)>


function event_manager.create_event_container()
	local container:event_container<{}> = setmetatable({},event_container_meta)
	container.events = {}
	
	return container
end

type function turn_to_events<data,key,index>
(data:data,key:key,index:index)
	
end

function event_container:add_event_data<events>(events:events)
	type self = typeof(self)|event_container<{}>
	local self:self = self
	for i,v in events do
		self.events[i] = v
	end
	type current_events = {
		
	}
	type new_container = self & current_events
	local self:new_container = self 
	return self
end



export type event = event.event
function event_manager.new() 
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
