
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

tagsettingFrame = inherit(GmBase.FrameBase):name("tagsettingFrame")

tagsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_tagsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areatagsettingarea
	self.areatagsettingarea = gm_xinbanchunzhongyun.tagsettingareaArea(self)
	
	if self.areatagsettingarea.set then
				
	end
	
		if self.areatagsettingarea.set_title then
			self.areatagsettingarea:set_title('标记设置')
		elseif self.areatagsettingarea.set then
			self.areatagsettingarea:set('title','标记设置')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areatagsettingarea
	
	self:set_style('display:none')

	
end


tagsettingFrame.set_data_id = function(self,data)
	
	if self.areatagsettingarea.set_data_id then
		self.areatagsettingarea:set_data_id(data)
	end
				
end


tagsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areatagsettingarea.set_data then
		self.areatagsettingarea:set_data(data)
	end
			
end




tagsettingFrame.on_show = function(self)
			
	if self.areatagsettingarea.on_show then
		self.areatagsettingarea:on_show()
	end
			
end


tagsettingFrame.on_hide = function(self)
			
	if self.areatagsettingarea.on_hide then
		self.areatagsettingarea:on_hide()
	end		
			
end

	


	