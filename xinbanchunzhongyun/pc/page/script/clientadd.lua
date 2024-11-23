
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientaddFrame = inherit(GmBase.FrameBase):name("clientaddFrame")

clientaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaclientaddarea
	self.areaclientaddarea = gm_xinbanchunzhongyun.clientaddareaArea(self)
	
	if self.areaclientaddarea.set then
				
	end
	
		if self.areaclientaddarea.set_title then
			self.areaclientaddarea:set_title('添加客户')
		elseif self.areaclientaddarea.set then
			self.areaclientaddarea:set('title','添加客户')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaclientaddarea
	
	self:set_style('display:none')

	
end


clientaddFrame.set_data_id = function(self,data)
	
	if self.areaclientaddarea.set_data_id then
		self.areaclientaddarea:set_data_id(data)
	end
				
end


clientaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaclientaddarea.set_data then
		self.areaclientaddarea:set_data(data)
	end
			
end




clientaddFrame.on_show = function(self)
			
	if self.areaclientaddarea.on_show then
		self.areaclientaddarea:on_show()
	end
			
end


clientaddFrame.on_hide = function(self)
			
	if self.areaclientaddarea.on_hide then
		self.areaclientaddarea:on_hide()
	end		
			
end

	


	