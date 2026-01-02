-- @ScriptType: ModuleScript
--[[
paras,1/1/26
event object functions and class
]]
local event = {
	
	
}
export type function_list<provided_args...> = {
	(provided_args...)->()
}
export type base_event = {
	function_list:function_list<...any>,
	enabled:boolean,
	threads:{thread},
	__DESTROYED:boolean
}
event.__index = event
event.__newindex = function(self:base_event,index:any,value:any)
	print(self,index,value)
	if index == "enabled" then
		if not value then
			self:__disable_threads()
			rawset(self,index,false)
			return
		end
	end
	rawset(self,index,value)
end
local status = coroutine.status



export type event = setmetatable<base_event,typeof(event)>

function event:disable()
	local self:event = self 
	if self.__DESTROYED then return end
	self.enabled = false
	self:__disable_threads()
end

function event:enable()
	local self:event = self 
	if self.__DESTROYED then return end
	self.enabled = true
end


function event:fire<provided_args...>(...:provided_args...)
	local self:event = self 
	if self.__DESTROYED then return end
	if not self.enabled then
		self:__disable_threads()
		return
	end
	local args = table.pack(...)
	for i,v in self.function_list do
		
		local thread = coroutine.create(function()
			v(table.unpack(args))
		end)
		table.insert(self.threads,thread)
		coroutine.resume(thread)
	end
	
end

function event:connect<provided_args...>(connection:(provided_args...)->(...any))
	local self:event = self
	if self.__DESTROYED then return end
	table.insert(self.function_list,connection)
end

function event:once<provided_args...>(connection:(provided_args...)->(...any))
	local self:event = self
	if self.__DESTROYED then return end
	local new_func:typeof(connection)
	local function_list = self.function_list
	new_func = function()
		connection()
		table.remove(function_list,table.find(function_list,new_func()))
	end
	self:connect(new_func)
end

function event:destroy()
	local self:event = self
	if self.__DESTROYED then return end
	self:__disable_threads()
	table.clear(self)
	self.__DESTROYED = true
	
end



function event:__disable_threads()
	local self:event= self 
	--print(self)
	for i,v in self.threads do
		if status(v) ~= "dead" then
			
			coroutine.close(v)
		end
	end
	table.clear(self.threads)
end



return event
