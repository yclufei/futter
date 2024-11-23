
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

gallerytypemgrFrame = inherit(GmBase.FrameBase):name("gallerytypemgrFrame")

gallerytypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_gallerytypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areagallerytypemgrarea
	self.areagallerytypemgrarea = gm_xinbanchunzhongyun.gallerytypemgrareaArea(self)
	
	if self.areagallerytypemgrarea.set then
				
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
			self.areanav:set_title('图库分类管理')
		elseif self.areanav.set then
			self.areanav:set('title','图库分类管理')
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
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
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

	


	