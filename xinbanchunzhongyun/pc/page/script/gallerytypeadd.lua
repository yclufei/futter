
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypeaddFrame = inherit(GmBase.FrameBase):name("gallerytypeaddFrame")

gallerytypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areagallerytypeaddarea
	self.areagallerytypeaddarea = gm_xinbanchunzhongyun.gallerytypeaddareaArea(self)
	
	if self.areagallerytypeaddarea.set then
				
	end
	
		if self.areagallerytypeaddarea.set_title then
			self.areagallerytypeaddarea:set_title('添加图库分类')
		elseif self.areagallerytypeaddarea.set then
			self.areagallerytypeaddarea:set('title','添加图库分类')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areagallerytypeaddarea
	
	self:set_style('display:none')

	
end


gallerytypeaddFrame.set_data_id = function(self,data)
	
	if self.areagallerytypeaddarea.set_data_id then
		self.areagallerytypeaddarea:set_data_id(data)
	end
				
end


gallerytypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areagallerytypeaddarea.set_data then
		self.areagallerytypeaddarea:set_data(data)
	end
			
end




gallerytypeaddFrame.on_show = function(self)
			
	if self.areagallerytypeaddarea.on_show then
		self.areagallerytypeaddarea:on_show()
	end
			
end


gallerytypeaddFrame.on_hide = function(self)
			
	if self.areagallerytypeaddarea.on_hide then
		self.areagallerytypeaddarea:on_hide()
	end		
			
end

	


	