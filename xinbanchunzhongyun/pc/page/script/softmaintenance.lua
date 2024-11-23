
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

softmaintenanceFrame = inherit(GmBase.FrameBase):name("softmaintenanceFrame")

softmaintenanceFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_softmaintenance"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areasoftmaintenancearea
	self.areasoftmaintenancearea = gm_xinbanchunzhongyun.softmaintenanceareaArea(self)
	
	if self.areasoftmaintenancearea.set then
				
	end
	
		if self.areasoftmaintenancearea.set_title then
			self.areasoftmaintenancearea:set_title('软件维护')
		elseif self.areasoftmaintenancearea.set then
			self.areasoftmaintenancearea:set('title','软件维护')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areasoftmaintenancearea
	
	self:set_style('display:none')

	
end


softmaintenanceFrame.set_data_id = function(self,data)
	
	if self.areasoftmaintenancearea.set_data_id then
		self.areasoftmaintenancearea:set_data_id(data)
	end
				
end


softmaintenanceFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areasoftmaintenancearea.set_data then
		self.areasoftmaintenancearea:set_data(data)
	end
			
end




softmaintenanceFrame.on_show = function(self)
			
	if self.areasoftmaintenancearea.on_show then
		self.areasoftmaintenancearea:on_show()
	end
			
end


softmaintenanceFrame.on_hide = function(self)
			
	if self.areasoftmaintenancearea.on_hide then
		self.areasoftmaintenancearea:on_hide()
	end		
			
end

	


	