
local class_search = function(v,k)	
	for i,base in pairs(v.base_list) do
		if base[k] then
			return base[k]
		end
	end
end

-- 类继承函数
inherit = function(...)
	local class_table = {}
	class_table.base_list = {}
	class_table.name = function(self,s)
		self.classname = s
		return self
	end	
	--设置基类
	if #arg == 0 then
		arg[1] = {
								["new"] = function()
										return {} 
									  end
							}
	end
	for i=1, #arg do			
		table.insert(class_table.base_list,arg[i])
	end
	local mt = { __index = class_search,	      			
							   __call = function(class, ...)
								     	local obj = class_table:new(class, ...)
								     	local new_mt = { __index = class_table }
								     	setmetatable(obj, new_mt)
								     	obj.class = class
								     	if obj.init then
								     		obj:init(...)
								     	end
								     	if obj.set_msg_func then
								     		obj:set_msg_func(obj)
								     	end
								     	return obj
								end,
							}		
	setmetatable(class_table, mt)
	return class_table
end
