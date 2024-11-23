
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypemodifyFrame = inherit(GmBase.FrameBase):name("gallerytypemodifyFrame")

gallerytypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areagallerytypemodifyarea
	self.areagallerytypemodifyarea = gm_xinbanchunzhongyun.gallerytypemodifyareaArea(self)
	
	if self.areagallerytypemodifyarea.set then
				
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
			self.areanav:set_title('图库分类编辑')
		elseif self.areanav.set then
			self.areanav:set('title','图库分类编辑')
		end
					
		if self.areagallerytypemodifyarea.set_title then
			self.areagallerytypemodifyarea:set_title('图库分类编辑')
		elseif self.areagallerytypemodifyarea.set then
			self.areagallerytypemodifyarea:set('title','图库分类编辑')
		end
					
	
	self.mainarea = self.areagallerytypemodifyarea
	
	self:set_style('display:none')

	
end


gallerytypemodifyFrame.set_data_id = function(self,data)
	
	if self.areagallerytypemodifyarea.set_data_id then
		self.areagallerytypemodifyarea:set_data_id(data)
	end
				
end


gallerytypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areagallerytypemodifyarea.set_data then
		self.areagallerytypemodifyarea:set_data(data)
	end
			
end




gallerytypemodifyFrame.on_show = function(self)
			
	if self.areagallerytypemodifyarea.on_show then
		self.areagallerytypemodifyarea:on_show()
	end
			
end


gallerytypemodifyFrame.on_hide = function(self)
			
	if self.areagallerytypemodifyarea.on_hide then
		self.areagallerytypemodifyarea:on_hide()
	end		
			
end

	


	