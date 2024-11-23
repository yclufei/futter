	

-- D:\GOA\reslibrary\templete\default\phone\area\loginarea\lua.xsl loginarea

gr_module("gm_xinbanchunzhongyun")

loginareaArea = inherit(GmCtrl.ControlBase):name("loginareaArea")

loginareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "loginareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)


	
		-- sessionForm
		
		-- form.lua.xsl form 38
	self.username = self:get_child('username')
	self.username:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.password = self:get_child('password')
	self.password:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.forgetform = self:get_child("forgetform")
	self.forgetform:set_click(function(link)			
			
		top.hostWindow:addNavFrame('forgetform',nil,function(frame)
				
		end)
					  			
	end)
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
	---- *[not(@__projectalias) and @parentclass] //@projectname @__table @__net @__netmethon @__count @__attr_order @__tobject
	
	
			
	self.thirdlogin = gm_xinbanchunzhongyun.thirdloginArea(self)
	
	
	
	--0

	
	self.mgr = gm_xinbanchunzhongyun.clscgfusermgr.get_instance()
	self.mgr:add_ui('loginareaArea',self)


	self.login = self:get_child('login')
	self.login:set_click(function(link)			
		-- todo
		top.mgr:run('cgfloginform',top)
	end)
	
	
	GmBase.czynet.get_instance():add_callback('czynet.cgfloginform',self)	
		
end



loginareaArea.callback = function(self,key,tbname,post,result)
	if key == 'czynet.cgfloginform' then
		if result['error'] == 0 then
			top.hostWindow:showFrame('mainfirst')
		elseif result['msg'] ~= nil then
			self.hostWindow:showMsg(  result['msg']  )
		end
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




