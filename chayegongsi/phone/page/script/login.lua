
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

loginFrame = inherit(GmBase.FrameBase):name("loginFrame")

loginFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_login"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arealoginarea
	self.arealoginarea = gm_chayegongsi.loginareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('登录')
		elseif self.areanav.set then
			self.areanav:set('title','登录')
		end
					
	
	self.mainarea = self.arealoginarea
	
	self:set_style('display:none')

	
end


loginFrame.set_data_id = function(self,data)
	
	if self.arealoginarea.set_data_id then
		self.arealoginarea:set_data_id(data)
	end
				
end


loginFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arealoginarea.set_data then
		self.arealoginarea:set_data(data)
	end
			
end




loginFrame.on_show = function(self)
			
	if self.arealoginarea.on_show then
		self.arealoginarea:on_show()
	end
			
end


loginFrame.on_hide = function(self)
			
	if self.arealoginarea.on_hide then
		self.arealoginarea:on_hide()
	end		
			
end

	


	