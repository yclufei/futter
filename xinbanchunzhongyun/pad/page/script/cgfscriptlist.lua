
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfscriptlistFrame = inherit(GmBase.FrameBase):name("cgfscriptlistFrame")

cgfscriptlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfscriptlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfscriptlistarea
	self.areacgfscriptlistarea = gm_xinbanchunzhongyun.cgfscriptlistareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfscriptlist')
		elseif self.areanav.set then
			self.areanav:set('title','cgfscriptlist')
		end
					
		if self.areacgfscriptlistarea.set_title then
			self.areacgfscriptlistarea:set_title('cgfscriptlist')
		elseif self.areacgfscriptlistarea.set then
			self.areacgfscriptlistarea:set('title','cgfscriptlist')
		end
					
	
	self.mainarea = self.areacgfscriptlistarea
	
	self:set_style('display:none')

	
end


cgfscriptlistFrame.set_data_id = function(self,data)
	
	if self.areacgfscriptlistarea.set_data_id then
		self.areacgfscriptlistarea:set_data_id(data)
	end
				
end


cgfscriptlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfscriptlistarea.set_data then
		self.areacgfscriptlistarea:set_data(data)
	end
			
end




cgfscriptlistFrame.on_show = function(self)
			
	if self.areacgfscriptlistarea.on_show then
		self.areacgfscriptlistarea:on_show()
	end
			
end


cgfscriptlistFrame.on_hide = function(self)
			
	if self.areacgfscriptlistarea.on_hide then
		self.areacgfscriptlistarea:on_hide()
	end		
			
end

	


	