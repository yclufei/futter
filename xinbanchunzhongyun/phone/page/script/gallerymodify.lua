
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerymodifyFrame = inherit(GmBase.FrameBase):name("gallerymodifyFrame")

gallerymodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerymodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areagallerymodifyarea
	self.areagallerymodifyarea = gm_xinbanchunzhongyun.gallerymodifyareaArea(self)
	
	if self.areagallerymodifyarea.set then
				
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
			self.areanav:set_title('编辑图片')
		elseif self.areanav.set then
			self.areanav:set('title','编辑图片')
		end
					
		if self.areagallerymodifyarea.set_title then
			self.areagallerymodifyarea:set_title('编辑图片')
		elseif self.areagallerymodifyarea.set then
			self.areagallerymodifyarea:set('title','编辑图片')
		end
					
	
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
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
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

	


	