
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

pwdmodifyFrame = inherit(GmBase.FrameBase):name("pwdmodifyFrame")

pwdmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_pwdmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areapwdmodifyarea
	self.areapwdmodifyarea = gm_xinbanchunzhongyun.pwdmodifyareaArea(self)
	
	if self.areapwdmodifyarea.set then
				
	end
	
		if self.areapwdmodifyarea.set_title then
			self.areapwdmodifyarea:set_title('修改密码')
		elseif self.areapwdmodifyarea.set then
			self.areapwdmodifyarea:set('title','修改密码')
		end
					
	
	self.mainarea = self.areapwdmodifyarea
	
	self:set_style('display:none')

	
end


pwdmodifyFrame.set_data_id = function(self,data)
	
	if self.areapwdmodifyarea.set_data_id then
		self.areapwdmodifyarea:set_data_id(data)
	end
				
end


pwdmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areapwdmodifyarea.set_data then
		self.areapwdmodifyarea:set_data(data)
	end
			
end




pwdmodifyFrame.on_show = function(self)
			
	if self.areapwdmodifyarea.on_show then
		self.areapwdmodifyarea:on_show()
	end
			
end


pwdmodifyFrame.on_hide = function(self)
			
	if self.areapwdmodifyarea.on_hide then
		self.areapwdmodifyarea:on_hide()
	end		
			
end

	


	