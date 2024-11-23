	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

usercontactmodifyareaArea = inherit(GmCtrl.ControlBase):name("usercontactmodifyareaArea")

usercontactmodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "usercontactmodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.mobile = GmCtrl.ItemInputCtrl(self.scrollcontainer,'mobile','手机号码', ' ',	function(k,v) top.mobile:set(k,v) end)
	self.field2 = GmCtrl.ItemInputCtrl(self.scrollcontainer,'field2','微信', ' ',		function(k,v)  top.field2:set(k,v)  end)
	self.telephone = GmCtrl.ItemInputCtrl(self.scrollcontainer,'telephone','手机号码', ' ',	function(k,v) top.telephone:set(k,v) end)
	self.icq = GmCtrl.ItemInputCtrl(self.scrollcontainer,'icq','icq', ' ',	function(k,v) top.icq:set(k,v) end)
	self.qq = GmCtrl.ItemInputCtrl(self.scrollcontainer,'qq','qq', ' ',	function(k,v) top.qq:set(k,v) end)
	self.msn = GmCtrl.ItemInputCtrl(self.scrollcontainer,'msn','msn', ' ',	function(k,v) top.msn:set(k,v) end)
	self.taobao = GmCtrl.ItemInputCtrl(self.scrollcontainer,'taobao','阿里旺旺', ' ',	function(k,v) top.taobao:set(k,v) end)
		
	GmBase.discuznet.get_instance():add_callback('discuznet.space_profile',self)	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)



end


usercontactmodifyareaArea.save = function(self)
		print('usercontactmodifyareaArea rightfunc save')
		-- todo
		self.mgr:run('spacecp_profile_contact',self)

end



usercontactmodifyareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)

	print('usercontactmodifyareaArea.callback',callbackey,tbname,postparam,data,sortkey,ids)
	
	if 'discuznet.space_profile' == callbackey then
		
		--table.print(postparam)
		--table.print(data)
		
		for a,b in pairs(data['data']) do
			if self[a] and type(self[a]) == 'table' and self[a].set_text then
				print(a,b)
				self[a]:set_text(b)
			end
		end
		
		return true
	end
	return false
end





usercontactmodifyareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


usercontactmodifyareaArea.set_data = function(self,data)
	self.data = data
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


