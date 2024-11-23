
gr_module("GmBase")

python = inherit(gscriptpython):name("python")


python.init = function (self,userdata)
	if userdata then
		self:set_userdata(userdata)
	end
end


python.import = function(self,modelname)
	local modal = GmBase.python()
	self:py_import(modal[0],modelname)
	return modal
end



python.handle_result = function(self,res)
	local ret = {}
	for k,v in pairs(res) do
		if type(v) == 'userdata' then
			ret[k] = GmBase.python(v)
			--cwarn('handle_result A',type(v),k,v)
		elseif type(v) == 'table' then
			ret[k] = self:handle_result(v)
			--cwarn('handle_result B',type(v),k,v,ret[k])
		else
			--cwarn('handle_result C',type(v),k,v)
			ret[k] = v
		end
	end
	return ret
end


python.attr = function(self,attrname)
	local attr = self:py_object_attr(attrname)
	--print('python.attr ret ',attrname,attr)
	--table.print(attr)
	return self:handle_result(attr)[0]
end


python.sub = function(self,attrname)
	local attr = self:py_object_attr(attrname)
	local ret = self:handle_result(attr)
	return ret[0]
end


python.call = function(self,funcname,...)
	local ret = self:py_object_call(funcname,...)
	--print('python.call ret ',self.udata,ret)
	--table.print(ret)
	return self:handle_result(ret)
end


