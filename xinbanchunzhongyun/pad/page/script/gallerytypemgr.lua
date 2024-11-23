
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypemgrFrame = inherit(GmBase.FrameBase):name("gallerytypemgrFrame")

gallerytypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areagallerytypemgrarea
	self.areagallerytypemgrarea = gm_xinbanchunzhongyun.gallerytypemgrareaArea(self)
	
	if self.areagallerytypemgrarea.set then
				
	end
	
		if self.areagallerytypemgrarea.set_title then
			self.areagallerytypemgrarea:set_title('图库分类管理')
		elseif self.areagallerytypemgrarea.set then
			self.areagallerytypemgrarea:set('title','图库分类管理')
		end
					
	
	self.mainarea = self.areagallerytypemgrarea
	
	self:set_style('display:none')

	
end


gallerytypemgrFrame.set_data_id = function(self,data)
	
	if self.areagallerytypemgrarea.set_data_id then
		self.areagallerytypemgrarea:set_data_id(data)
	end
				
end


gallerytypemgrFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areagallerytypemgrarea.set_data then
		self.areagallerytypemgrarea:set_data(data)
	end
			
end




gallerytypemgrFrame.on_show = function(self)
			
	if self.areagallerytypemgrarea.on_show then
		self.areagallerytypemgrarea:on_show()
	end
			
end


gallerytypemgrFrame.on_hide = function(self)
			
	if self.areagallerytypemgrarea.on_hide then
		self.areagallerytypemgrarea:on_hide()
	end		
			
end

	


	