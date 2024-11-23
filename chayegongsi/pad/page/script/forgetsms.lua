
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

forgetsmsFrame = inherit(GmBase.FrameBase):name("forgetsmsFrame")

forgetsmsFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forgetsms"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforgetsmsarea
	self.areaforgetsmsarea = gm_chayegongsi.forgetsmsareaArea(self)
	
	if self.areaforgetsmsarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('输入手机验证码')
		elseif self.areanav.set then
			self.areanav:set('title','输入手机验证码')
		end
					
	
	self.mainarea = self.areaforgetsmsarea
	
	self:set_style('display:none')

	
end


forgetsmsFrame.set_data_id = function(self,data)
	
	if self.areaforgetsmsarea.set_data_id then
		self.areaforgetsmsarea:set_data_id(data)
	end
				
end


forgetsmsFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforgetsmsarea.set_data then
		self.areaforgetsmsarea:set_data(data)
	end
			
end




forgetsmsFrame.on_show = function(self)
			
	if self.areaforgetsmsarea.on_show then
		self.areaforgetsmsarea:on_show()
	end
			
end


forgetsmsFrame.on_hide = function(self)
			
	if self.areaforgetsmsarea.on_hide then
		self.areaforgetsmsarea:on_hide()
	end		
			
end

	


	