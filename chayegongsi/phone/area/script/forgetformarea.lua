	

gr_module("gm_chayegongsi")

forgetformareaArea = inherit(GmCtrl.ControlBase):name("forgetformareaArea")

forgetformareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "forgetformareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)


	
		-- sessionForm
		
  self.username = self:get_child('username')
	
	self.login = self:get_child("login")
	self.login:set_click(function(link)			
			
		top.hostWindow:delTopNavFrame()		
					  			
	end)
	
	
	
	

	self.mgr = gm_chayegongsi.clsusermgr.get_instance()
	self.mgr:add_ui('forgetformareaArea',self)

	self.forgetform = self:get_child('forgetform')
	self.forgetform:set_click(function(link)			
		-- todo
		top.mgr:run('forgetform',top)
	end)

	GmBase.usernet.get_instance():add_callback('usernet.loginform',self)	
	
end


forgetformareaArea.callback = function(self,key,tbname,post,result)
	if key == 'usernet.forgetform' and result['success'] then
		if result['error'] == 0 then
			self.hostWindow:delTopNavFrame()
			self.hostWindow:showMsg(  result['msg']  )
		elseif result['msg'] ~= nil then
			self.hostWindow:showMsg(  result['msg']  )
		end
		return true
	elseif key == 'usernet.loginform' and result['success'] then 
		self:set_data(post)
		return true
	end
end



forgetformareaArea.set_data = function(self,post)
		for key,value in pairs(post) do
			if self[key] ~= nil and self[key].set_text then
				self[key]:set_text(value)
			end
		end
end

	
	
	