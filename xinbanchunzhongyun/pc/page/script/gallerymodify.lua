
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerymodifyFrame = inherit(GmBase.FrameBase):name("gallerymodifyFrame")

gallerymodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerymodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areagallerymodifyarea
	self.areagallerymodifyarea = gm_xinbanchunzhongyun.gallerymodifyareaArea(self)
	
	if self.areagallerymodifyarea.set then
				
	end
	
		if self.areagallerymodifyarea.set_title then
			self.areagallerymodifyarea:set_title('编辑图片')
		elseif self.areagallerymodifyarea.set then
			self.areagallerymodifyarea:set('title','编辑图片')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areagallerymodifyarea
	
	self:set_style('display:none')

	
end


gallerymodifyFrame.set_data_id = function(self,data)
	
	if self.areagallerymodifyarea.set_data_id then
		self.areagallerymodifyarea:set_data_id(data)
	end
				
end


gallerymodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areagallerymodifyarea.set_data then
		self.areagallerymodifyarea:set_data(data)
	end
			
end




gallerymodifyFrame.on_show = function(self)
			
	if self.areagallerymodifyarea.on_show then
		self.areagallerymodifyarea:on_show()
	end
			
end


gallerymodifyFrame.on_hide = function(self)
			
	if self.areagallerymodifyarea.on_hide then
		self.areagallerymodifyarea:on_hide()
	end		
			
end

	


	