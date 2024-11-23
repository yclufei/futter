
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

permissionFrame = inherit(GmBase.FrameBase):name("permissionFrame")

permissionFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_permission"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areapermissionarea
	self.areapermissionarea = gm_xinbanchunzhongyun.permissionareaArea(self)
	
	if self.areapermissionarea.set then
				
	end
	
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
			self.areanav:set_title('用户权限')
		elseif self.areanav.set then
			self.areanav:set('title','用户权限')
		end
					
		if self.areapermissionarea.set_title then
			self.areapermissionarea:set_title('用户权限')
		elseif self.areapermissionarea.set then
			self.areapermissionarea:set('title','用户权限')
		end
					
	
	self.mainarea = self.areapermissionarea
	
	self:set_style('display:none')

	
end


permissionFrame.set_data_id = function(self,data)
	
	if self.areapermissionarea.set_data_id then
		self.areapermissionarea:set_data_id(data)
	end
				
end


permissionFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areapermissionarea.set_data then
		self.areapermissionarea:set_data(data)
	end
			
end




permissionFrame.on_show = function(self)
			
	if self.areapermissionarea.on_show then
		self.areapermissionarea:on_show()
	end
			
end


permissionFrame.on_hide = function(self)
			
	if self.areapermissionarea.on_hide then
		self.areapermissionarea:on_hide()
	end		
			
end

	


	