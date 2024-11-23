
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientypeaddFrame = inherit(GmBase.FrameBase):name("clientypeaddFrame")

clientypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaclientypeaddarea
	self.areaclientypeaddarea = gm_xinbanchunzhongyun.clientypeaddareaArea(self)
	
	if self.areaclientypeaddarea.set then
				
	end
	
		if self.areaclientypeaddarea.set_title then
			self.areaclientypeaddarea:set_title('添加客户分类')
		elseif self.areaclientypeaddarea.set then
			self.areaclientypeaddarea:set('title','添加客户分类')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaclientypeaddarea
	
	self:set_style('display:none')

	
end


clientypeaddFrame.set_data_id = function(self,data)
	
	if self.areaclientypeaddarea.set_data_id then
		self.areaclientypeaddarea:set_data_id(data)
	end
				
end


clientypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaclientypeaddarea.set_data then
		self.areaclientypeaddarea:set_data(data)
	end
			
end




clientypeaddFrame.on_show = function(self)
			
	if self.areaclientypeaddarea.on_show then
		self.areaclientypeaddarea:on_show()
	end
			
end


clientypeaddFrame.on_hide = function(self)
			
	if self.areaclientypeaddarea.on_hide then
		self.areaclientypeaddarea:on_hide()
	end		
			
end

	


	