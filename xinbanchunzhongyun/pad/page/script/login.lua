

gr_module("gm_xinbanchunzhongyun")

loginFrame = inherit(GmBase.FrameBase):name("loginFrame")

loginFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_login"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
						
	self.arealoginarea = gm_xinbanchunzhongyun.loginareaArea(self)
	
	
	self:set_style('display:none')

end


loginFrame.on_show = function(self)

	
		self.arealoginarea:set_title('登录')
		
	
end

	