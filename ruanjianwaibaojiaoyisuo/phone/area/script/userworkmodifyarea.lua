			
gr_module("gm_ruanjianwaibaojiaoyisuo")

userworkmodifyareaArea = inherit(GmCtrl.ControlBase):name("userworkmodifyareaArea")

userworkmodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "userworkmodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.company = 		GmCtrl.ItemInputCtrl(self.scrollcontainer,'company','公司', ' ',		function(k,v)  top.company:set(k,v)  end)
	self.occupation = GmCtrl.ItemInputCtrl(self.scrollcontainer,'occupation','职业', ' ',		function(k,v)  top.occupation:set(k,v)  end)
	self.position = 	GmCtrl.ItemInputCtrl(self.scrollcontainer,'position','职位', ' ',		function(k,v)  top.position:set(k,v)  end)
	self.revenue = 		GmCtrl.ItemInputCtrl(self.scrollcontainer,'revenue','年收入', ' ',		function(k,v)  top.revenue:set(k,v)  end)
	self.site = 			GmCtrl.ItemInputCtrl(self.scrollcontainer,'site','主页', ' ',		function(k,v)  top.site:set(k,v)  end)

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)
	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'space_profile'
	self.net:add_callback('discuznet.space_profile',self)	
	
end



userworkmodifyareaArea.save = function(self)
	self.mgr:run('spacecp_profile_work',self)
end


userworkmodifyareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)

	print('userworkmodifyareaArea.callback',callbackey,tbname,postparam,data,sortkey,ids)
	
	if 'discuznet.space_profile' == callbackey then
		for a,b in pairs(data['data']) do
			if self[a] then
				self[a]:set_text(b)
			end
		end
		return true
	end
	return false
	
end






userworkmodifyareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


userworkmodifyareaArea.set_data = function(self,data)
	self.data = data
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


