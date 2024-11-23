	


gr_module("gm_ruanjianwaibaojiaoyisuo")

registerareaArea = inherit(GmCtrl.ControlBase):name("registerareaArea")

registerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "registerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)


	
		-- sessionForm
		
  self.mobilenum = self:get_child('mobilenum')
	
  self.username = self:get_child('username')
	
		
  self.passwdword = self:get_child('passwdword')
	self.password = self:get_child('password')
	self.password:set_focus(function(ctrl) 
														top.passwdword:set_inner_text(' ')
														top:updatetick(true)
													end)													
	self.password:set_blur(function(ctrl)
														if string.len( ctrl:get_text() ) > 0 then
															top.passwdword:set_inner_text(' ')
														else
															top.passwdword:set_inner_text(' 请输入登录密码')
														end
														top:updatetick(true)
													end)
													
	
		
													
  self.passwdword2 = self:get_child('passwdword2')
	self.password2 = self:get_child('password2')
	self.password2:set_focus(function(ctrl) 
														top.passwdword2:set_inner_text(' ')
														top:updatetick(true)
													end)													
	self.password2:set_blur(function(ctrl)
														if string.len( ctrl:get_text() ) > 0 then
															top.passwdword2:set_inner_text(' ')
														else
															top.passwdword2:set_inner_text(' 请确认登录密码')
														end
														top:updatetick(true)
													end)
	
	self.login = self:get_child("login")
	self.login:set_click(function(link)			
			
		top.hostWindow:delTopNavFrame()		
					  			
	end)
	
	


	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
	self.mgr:add_ui('registerareaArea',self)


	self.register = self:get_child('register')
	self.register:set_click(function(link)			
		-- todo
		top.mgr:run('registerform',top)
	end)
	
	
	GmBase.usernet.get_instance():add_callback('usernet.loginform',self)	
	
		
end

registerareaArea.callback = function(self,key,tb,post,result)
	if key == 'usernet.registerform' and result['success'] then
		if result['error'] == 0 then
			self.hostWindow:delTopNavFrame()
			self.hostWindow:showMsg(  result['msg']  )
		elseif result['msg'] ~= nil then
			self.hostWindow:showMsg(  result['msg']  )
		end
		return true
	elseif key == 'usernet.loginform' and result['success'] and result['error'] ~= 0 then 
		self:set_data(post)
		return true
	end
end


registerareaArea.set_data = function(self,post)
		for key,value in pairs(post) do
			if self[key] ~= nil and self[key].set_text then
				self[key]:set_text(value)
			end
		end
end


	