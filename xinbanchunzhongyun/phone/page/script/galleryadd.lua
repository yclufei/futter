
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

galleryaddFrame = inherit(GmBase.FrameBase):name("galleryaddFrame")

galleryaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_galleryadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areagalleryaddarea
	self.areagalleryaddarea = gm_xinbanchunzhongyun.galleryaddareaArea(self)
	
	if self.areagalleryaddarea.set then
				
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
			self.areanav:set_title('添加图片')
		elseif self.areanav.set then
			self.areanav:set('title','添加图片')
		end
					
		if self.areagalleryaddarea.set_title then
			self.areagalleryaddarea:set_title('添加图片')
		elseif self.areagalleryaddarea.set then
			self.areagalleryaddarea:set('title','添加图片')
		end
					
	
	self.mainarea = self.areagalleryaddarea
	
	self:set_style('display:none')

	
end


galleryaddFrame.set_data_id = function(self,data)
	
	if self.areagalleryaddarea.set_data_id then
		self.areagalleryaddarea:set_data_id(data)
	end
				
end


galleryaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areagalleryaddarea.set_data then
		self.areagalleryaddarea:set_data(data)
	end
			
end




galleryaddFrame.on_show = function(self)
			
	if self.areagalleryaddarea.on_show then
		self.areagalleryaddarea:on_show()
	end
			
end


galleryaddFrame.on_hide = function(self)
			
	if self.areagalleryaddarea.on_hide then
		self.areagalleryaddarea:on_hide()
	end		
			
end

	


	