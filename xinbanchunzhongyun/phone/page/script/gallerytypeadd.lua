
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypeaddFrame = inherit(GmBase.FrameBase):name("gallerytypeaddFrame")

gallerytypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areagallerytypeaddarea
	self.areagallerytypeaddarea = gm_xinbanchunzhongyun.gallerytypeaddareaArea(self)
	
	if self.areagallerytypeaddarea.set then
				
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
			self.areanav:set_title('添加图库分类')
		elseif self.areanav.set then
			self.areanav:set('title','添加图库分类')
		end
					
		if self.areagallerytypeaddarea.set_title then
			self.areagallerytypeaddarea:set_title('添加图库分类')
		elseif self.areagallerytypeaddarea.set then
			self.areagallerytypeaddarea:set('title','添加图库分类')
		end
					
	
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
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
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

	


	