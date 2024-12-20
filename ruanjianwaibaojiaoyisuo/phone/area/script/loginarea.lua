	

-- D:\GOA\reslibrary\templete\default\phone\area\loginarea\lua.xsl loginarea

gr_module("gm_ruanjianwaibaojiaoyisuo")

loginareaArea = inherit(GmCtrl.ControlBase):name("loginareaArea")

loginareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "loginareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)



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
	
	self.forgetform = self:get_child("forgetform")
	self.forgetform:set_click(function(link)			
			
		top.hostWindow:addNavFrame('forgetform',nil,function(frame) end)
					  			
	end)
	
	self.register = self:get_child("register")
	self.register:set_click(function(link)			
			
		top.hostWindow:addNavFrame('register',nil,function(frame)
				
		end)
					  			
	end)
	
	
	self.thirdlogin = gm_ruanjianwaibaojiaoyisuo.thirdloginArea(self)
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
	self.mgr:add_ui('loginareaArea',self)


	self.login = self:get_child('login')
	self.login:set_click(function(link)			
		-- todo
		top.mgr:run('loginform',top)
	end)
	
	
	GmBase.usernet.get_instance():add_callback('usernet.registerform',self)	
	
	
end



loginareaArea.callback = function(self,key,tbname,post,result)
	local top = self
	if key == 'usernet.loginform' and result['success'] then
	
		if result['error'] == 0 then
			local usr = gm_ruanjianwaibaojiaoyisuo.muser()
			
			local uid = result['user']['member_uid']
			
			usr:SetAttrs(result['user'])
			usr:SetAttrs(result['data'])
			
			self.mgr:add_session('default',usr)
			
			local usr = self.mgr:get_session('default')
			
			self.hostWindow:delTopNavFrame(nil,nil,function() 
					top.hostWindow:layout()
					top.hostWindow:updatetickMsg()
					top.hostWindow:showMsg(  result['msg']  ) 
				end)
			
		elseif result['msg'] ~= nil then
		
			self.hostWindow:showMsg(  result['msg']  )
			
		end
		
		return true
		
	elseif key == 'usernet.registerform' and result['success'] then 
	
		post['username'] = post['mobilenum']
		self:set_data(post)
		return true
		
	end
end



loginareaArea.set_data = function(self,post)
		for key,value in pairs(post) do
			if self[key] ~= nil and self[key].set_text then
				self[key]:set_text(value)
			end
		end
end




