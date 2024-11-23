--创建一个可以读全局环境的module
gr_module = function (name, ...)
	--module创建后将调用的函数，设置此module的元表
	local gr_func = function(m)
		setmetatable(m,{__index=_G})
	end	
	--将此函数添加到原参数指定的函数列表中去
	table.insert(arg,1,gr_func)
	--调用原始的module创建函数
	module(name, unpack(arg) )	
	--由于module只会重置当前级别函数的环境表，所以我们要手工把再上一级的环境表设置一次
	setfenv(2,require(name))
end



