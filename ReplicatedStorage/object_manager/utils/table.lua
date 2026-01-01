-- @ScriptType: ModuleScript


local table_util = {}
type table = typeof(table)
type table_util<k> = k & table

function table_util.deep_clone<k>(table1:k) : k
	table1 = table_util.clone(table1)
	for i,v in table1 do
		if type(table) == "table" then
			table1[i] = table_util.deep_clone(table1[i])
		end
	end
	return table1
end
for i,v in table do
	table_util[i] = v
end
local table_util:typeof(table_util) & table = table_util 

return table_util
