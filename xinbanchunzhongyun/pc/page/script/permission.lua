
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

permissionFrame = inherit(GmBase.FrameBase):name("permissionFrame")

permissionFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_permission"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areapermissionarea
	self.areapermissionarea = gm_xinbanchunzhongyun.permissionareaArea(self)
	
	if self.areapermissionarea.set then
				
	end
	
		if self.areapermissionarea.set_title then
			self.areapermissionarea:set_title('用户权限')
		elseif self.areapermissionarea.set then
			self.areapermissionarea:set('title','用户权限')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
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

	


	