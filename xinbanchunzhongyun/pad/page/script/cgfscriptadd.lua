
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfscriptaddFrame = inherit(GmBase.FrameBase):name("cgfscriptaddFrame")

cgfscriptaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfscriptadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfscriptaddarea
	self.areacgfscriptaddarea = gm_xinbanchunzhongyun.cgfscriptaddareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfscriptadd')
		elseif self.areanav.set then
			self.areanav:set('title','cgfscriptadd')
		end
					
		if self.areacgfscriptaddarea.set_title then
			self.areacgfscriptaddarea:set_title('cgfscriptadd')
		elseif self.areacgfscriptaddarea.set then
			self.areacgfscriptaddarea:set('title','cgfscriptadd')
		end
					
	
	self.mainarea = self.areacgfscriptaddarea
	
	self:set_style('display:none')

	
end


cgfscriptaddFrame.set_data_id = function(self,data)
	
	if self.areacgfscriptaddarea.set_data_id then
		self.areacgfscriptaddarea:set_data_id(data)
	end
				
end


cgfscriptaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfscriptaddarea.set_data then
		self.areacgfscriptaddarea:set_data(data)
	end
			
end




cgfscriptaddFrame.on_show = function(self)
			
	if self.areacgfscriptaddarea.on_show then
		self.areacgfscriptaddarea:on_show()
	end
			
end


cgfscriptaddFrame.on_hide = function(self)
			
	if self.areacgfscriptaddarea.on_hide then
		self.areacgfscriptaddarea:on_hide()
	end		
			
end

	


	