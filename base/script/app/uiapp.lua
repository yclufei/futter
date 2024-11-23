gr_module("GmBase")

App = inherit(gscriptapp):name("App")


App.init = function (self,w,h)

	self.class = {}

	self.objects = {}
	
	self.ctrls = {}
	
	self.clsdefines = {}
	
	self.idclsdefines = {}
	
	self.columns = {}
	
	self.catogarys = {}
	
	self.relations = {}
	
	self.fans = {}
	
	self.my = {}	
    
    
	self.framesys_callback = {}

end



App.add_framesys_callback = function(self,k,func)
--	print('add_framesys_callback',k,func)
	if self.framesys_callback[k] == nil then
		self.framesys_callback[k] = {}
	end
	table.insert( self.framesys_callback[k] , func )
end


App.on_framesys_update = function(self,k)
	print('on_framesys_update',k)
	if self.framesys_callback[k] ~= nil and table.size(self.framesys_callback[k]) > 0 then
		for a,b in pairs(self.framesys_callback[k]) do
	--		print(a,b)
			b()
		end
	end
end






App.add_class = function(self,key,object)
	--print("add class",key,object)
	self.class[key] = object
end

App.get_class = function(self,key)
	return self.class[key]
end


--------------------------------------------------------------- my

App.set_my = function(self,clsid,data)
	print('App.set_my',clsid,table.size(data))
	if clsid and data then
		self.my[tonumber(clsid)] = data
		return
	end
	print('App.set_my error',clsid,data)
	return nil
end

App.add_my = function(self,clsid,data)
	if self.my[tonumber(clsid)] == nil then
		self.my[tonumber(clsid)] = {}
	end
	for a,b in pairs(data) do
		self.my[tonumber(clsid)][a] = b
	end
end

App.get_my = function(self,clsid)
	if clsid then
		local id = tonumber(clsid)
		for a,b in pairs(self.my) do
			print('App.get_my',a,table.size(b))
		end
		return self.my[id]
	end
	print('App.get_my error',clsid)
	return nil
end

--------------------------------------------------------------- my

App.get_class_define = function(self,cname)
	return self.clsdefines[cname]
end


App.get_class_define_by_id = function(self,id)
	return self.idclsdefines[tonumber(id)]
end


App.add_class_define = function(self,clsinfo,attrs)
	local name = clsinfo['name']
	if name then
		local id = tonumber(clsinfo['id'])
		if id then
			self.clsdefines[name] = clsinfo
			self.idclsdefines[id] = clsinfo
		end
	end
end

--------------------------------------------------------------- class

App.add_column = function(self,columninfo,attrs)
	local name = columninfo['name']
	self.columns[name] = columninfo
end


App.add_catogary = function(self,catogaryinfo,attrs)
	local name = catogaryinfo['name']
	self.catogarys[name] = catogaryinfo
end


--------------------------------------------------------------- object

App.add_object = function(self,pcls,object,ctrl)

	if not object['IsObject'] then
		print("error : App.add_object",pcls,object,ctrl)
		--table.print(object)
		--return
	end
	
	local cls = tostring(pcls)
	local id = tostring(object['id'])	
	
	-- class 类数组
	if self.objects[cls] == nil then
		self.objects[cls] = {}
		self.ctrls[cls] = {}
	end	
	
	if id then
	
		-- object 对象
		if self.objects[cls][id] == nil then -- 还没有对象
		
			self.objects[cls][id] = object
			self.ctrls[cls][id] = {}
			
		elseif object ~= self.objects[cls][id] then -- has object 已经有对象
		
			self.objects[cls][id] = object
			
		end	
		
		if ctrl and self.ctrls[cls][id][ctrl] == nil then
			self.ctrls[cls][id][ctrl] = ctrl	
		end
		
	else
	
		print("App.add_object no id!!!!!!!!")
		
	end
	
end


App.get_object = function(self,pcls,pid)
	local id = tostring(pid)
	local cls = tostring(pcls)
	if self.objects[cls] == nil then
		return nil
	end	
	return self.objects[cls][id]
end


App.update_object = function(self,cls,object)
	local id = object['id']	
	if self.objects[cls] == nil or self.objects[cls][id] == nil then
		self:add_object(cls,object)
		return
	end	
	for a,b in pairs(self.ctrls[cls][id]) do
		if b.set_object then
			b:set_object(object)
		end
	end	
end


App.delete_object = function(self,cls,object)
	local id = object['id']	
	if self.objects[cls] == nil then
		return 
	end	
	if self.objects[cls][id] == nil then
		return 
	end	
	for a,b in pairs(self.objects[cls][id].ctrls) do
		b:remove()
	end	
	self.objects[cls][id].ctrls = nil	
	self.objects[cls][id] = nil	
end

--------------------------------------------------------------- relation



App.remove_relation = function(self,ptype,ppc,pcc,ppo,pco)
	if ppc and pcc and ppo and pco then
		local pc = tonumber(ppc)
		local cc = tonumber(pcc)
		local po = tonumber(ppo)
		local co = tonumber(pco)
		local ret = nil		
		if pc then
			ret = self.relations[pc]
		end		
		if ret and cc then
			ret = ret[cc]
		else
			print("App.remove_relation error 1")
			return
		end		
		if ret and po then
			ret = ret[po]
		else
			print("App.remove_relation error 2")
			return
		end		
		if ret and ptype then
			ret = ret[ptype]
		else
			print("App.remove_relation error 3")
			return
		end
		if ret[co] then
			ret[co] = nil
		else
			print("App.remove_relation error 4")
		end
	end
end


App.add_relation = function(self,ptype,ppc,pcc,ppo,pco)
--	print("add_relation",ptype,ppc,pcc,ppo,pco)
	local pc = tonumber(ppc)
	local cc = tonumber(pcc)
	local po = tonumber(ppo)
	local co = tonumber(pco)
	if self.relations[pc] == nil then
		self.relations[pc] = {}
	end
	if self.relations[pc][cc] == nil then
		self.relations[pc][cc] = {}
	end
	if self.relations[pc][cc][po] == nil then
		self.relations[pc][cc][po] = {}
	end
	if self.relations[pc][cc][po][ptype] == nil then
		self.relations[pc][cc][po][ptype] = {}
	end
	self.relations[pc][cc][po][ptype][co] = co
end


App.get_relation = function(self,ptype,ppc,pcc,ppo)
	if ppc and pcc and ppo then
		local pc = tonumber(ppc)
		local cc = tonumber(pcc)
		local po = tonumber(ppo)
		ret = nil
		if pc then
			ret = self.relations[pc]
		end
		if ret and cc then
			ret = ret[cc]
		end
		if ret and po then
			ret = ret[po]
		end
		if ret and ptype then
			ret = ret[ptype]
		end
		return ret
	end
end

-------------------------------------

App.get_my_id = function(self)
	local urs = self:get_my(CONST_CLASS.USER)
	if urs then
		return urs['id']
	end
	return nil
end

App.add_fan = function(self,ursid,followid)
	local userid = tonumber(ursid)
	local followid = tonumber(followid)
	if self.fans[userid] == nil then
		self.fans[userid] = {}
	end
	self.fans[userid][followid] = followid
end

App.get_fans_id = function(self,ursid)
	local userid = tonumber(ursid)
	local ids = "999999"
	if ursid == nil then
		ursid = self:get_my_id()
	end
	if self.fans ~= nil and table.size(self.fans) > 0 and self.fans[userid] ~= nil then
		for a,b in pairs(self.fans[userid]) do
			if a ~= userid then
				ids = ids..","..tostring(a)
			end
		end
	end
	return ids
end

App.get_fan = function(self,ursid)
	if not ursid then
		ursid = self:get_my_id()
	end
	if ursid then
		local userid = tonumber(ursid)
		return self.fans[userid]
	end
	return nil
end

App.get_follow = function(self,ursid)
	if not ursid then
		ursid = self:get_my_id()
	end
	if ursid then
		local userid = tonumber(ursid)
		local tb = {}
		for u1,utb in pairs(self.fans) do
			if utb[userid] then
				table.insert(tb,u1)
			end
		end
		return tb
	end
	return nil
end


App.remove_fan = function(self,ursid,followid)
	local userid = tonumber(ursid)
	local followid = tonumber(followid)
	if self.fans[userid] then
		self.fans[userid][followid] = nil
	end
end


App.reset_fan = function(self,ursid)
	local userid = tonumber(ursid)
	self.fans[userid] = {}
end

App.clear_all_fans = function(self)
	self.fans = {}
end