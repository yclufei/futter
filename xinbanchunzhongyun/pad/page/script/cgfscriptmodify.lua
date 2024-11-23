
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfscriptmodifyFrame = inherit(GmBase.FrameBase):name("cgfscriptmodifyFrame")

cgfscriptmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfscriptmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfscriptmodifyarea
	self.areacgfscriptmodifyarea = gm_xinbanchunzhongyun.cgfscriptmodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfscriptmodify')
		elseif self.areanav.set then
			self.areanav:set('title','cgfscriptmodify')
		end
					
		if self.areacgfscriptmodifyarea.set_title then
			self.areacgfscriptmodifyarea:set_title('cgfscriptmodify')
		elseif self.areacgfscriptmodifyarea.set then
			self.areacgfscriptmodifyarea:set('title','cgfscriptmodify')
		end
					
	
	self.mainarea = self.areacgfscriptmodifyarea
	
	self:set_style('display:none')

	
end


cgfscriptmodifyFrame.set_data_id = function(self,data)
	
	if self.areacgfscriptmodifyarea.set_data_id then
		self.areacgfscriptmodifyarea:set_data_id(data)
	end
				
end


cgfscriptmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfscriptmodifyarea.set_data then
		self.areacgfscriptmodifyarea:set_data(data)
	end
			
end




cgfscriptmodifyFrame.on_show = function(self)
			
	if self.areacgfscriptmodifyarea.on_show then
		self.areacgfscriptmodifyarea:on_show()
	end
			
end


cgfscriptmodifyFrame.on_hide = function(self)
			
	if self.areacgfscriptmodifyarea.on_hide then
		self.areacgfscriptmodifyarea:on_hide()
	end		
			
end

	


	