
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypemodifyFrame = inherit(GmBase.FrameBase):name("gallerytypemodifyFrame")

gallerytypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areagallerytypemodifyarea
	self.areagallerytypemodifyarea = gm_xinbanchunzhongyun.gallerytypemodifyareaArea(self)
	
	if self.areagallerytypemodifyarea.set then
				
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

	


	