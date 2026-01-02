-- @ScriptType: ModuleScript


local object = require "./object"
local event_manager = require "./utils/event_manager"


local container = event_manager.new()
local event = event_manager.create_event()
event:connect(function(test_input)
	print(`input: {test_input}`)
	
end)
local container = container.add_event_data(container,{
	input = event
})





local templates = {}

local faux_player:Player = nil
local player = object.new {
	properties = {
		linked_player = faux_player
	},
	class_name = "player"
	
}

local player = player.add_methods(player,{
	join = function()
		print(player.properties.linked_player,"has joined game!")
		return 3
	end,
})
local player = player.add_events(player,{
	joined = event_manager.create_event()
})
templates.player = player
local joined = player.events.joined
joined:connect(function()
	
end)







return templates
