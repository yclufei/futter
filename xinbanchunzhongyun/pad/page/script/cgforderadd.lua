
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgforderaddFrame = inherit(GmBase.FrameBase):name("cgforderaddFrame")

cgforderaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgforderadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgforderaddarea
	self.areacgforderaddarea = gm_xinbanchunzhongyun.cgforderaddareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgforderadd')
		elseif self.areanav.set then
			self.areanav:set('title','cgforderadd')
		end
					
		if self.areacgforderaddarea.set_title then
			self.areacgforderaddarea:set_title('cgforderadd')
		elseif self.areacgforderaddarea.set then
			self.areacgforderaddarea:set('title','cgforderadd')
		end
					
	
	self.mainarea = self.areacgforderaddarea
	
	self:set_style('display:none')

	
end


cgforderaddFrame.set_data_id = function(self,data)
	
	if self.areacgforderaddarea.set_data_id then
		self.areacgforderaddarea:set_data_id(data)
	end
				
end


cgforderaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgforderaddarea.set_data then
		self.areacgforderaddarea:set_data(data)
	end
			
end




cgforderaddFrame.on_show = function(self)
			
	if self.areacgforderaddarea.on_show then
		self.areacgforderaddarea:on_show()
	end
			
end


cgforderaddFrame.on_hide = function(self)
			
	if self.areacgforderaddarea.on_hide then
		self.areacgforderaddarea:on_hide()
	end		
			
end

	


	