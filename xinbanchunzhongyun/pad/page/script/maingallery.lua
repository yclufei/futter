
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

maingalleryFrame = inherit(GmBase.FrameBase):name("maingalleryFrame")

maingalleryFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_maingallery"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areamaingalleryarea
	self.areamaingalleryarea = gm_xinbanchunzhongyun.maingalleryareaArea(self)
	
	if self.areamaingalleryarea.set then
				
	end
	
		if self.areamaingalleryarea.set_title then
			self.areamaingalleryarea:set_title('图库')
		elseif self.areamaingalleryarea.set then
			self.areamaingalleryarea:set('title','图库')
		end
					
	
	self.mainarea = self.areamaingalleryarea
	
	self:set_style('display:none')

	
end


maingalleryFrame.set_data_id = function(self,data)
	
	if self.areamaingalleryarea.set_data_id then
		self.areamaingalleryarea:set_data_id(data)
	end
				
end


maingalleryFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamaingalleryarea.set_data then
		self.areamaingalleryarea:set_data(data)
	end
			
end




maingalleryFrame.on_show = function(self)
			
	if self.areamaingalleryarea.on_show then
		self.areamaingalleryarea:on_show()
	end
			
end


maingalleryFrame.on_hide = function(self)
			
	if self.areamaingalleryarea.on_hide then
		self.areamaingalleryarea:on_hide()
	end		
			
end

	


	