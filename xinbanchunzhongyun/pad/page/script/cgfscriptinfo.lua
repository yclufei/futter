
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfscriptinfoFrame = inherit(GmBase.FrameBase):name("cgfscriptinfoFrame")

cgfscriptinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfscriptinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfscriptinfoarea
	self.areacgfscriptinfoarea = gm_xinbanchunzhongyun.cgfscriptinfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfscriptinfo')
		elseif self.areanav.set then
			self.areanav:set('title','cgfscriptinfo')
		end
					
		if self.areacgfscriptinfoarea.set_title then
			self.areacgfscriptinfoarea:set_title('cgfscriptinfo')
		elseif self.areacgfscriptinfoarea.set then
			self.areacgfscriptinfoarea:set('title','cgfscriptinfo')
		end
					
	
	self.mainarea = self.areacgfscriptinfoarea
	
	self:set_style('display:none')

	
end


cgfscriptinfoFrame.set_data_id = function(self,data)
	
	if self.areacgfscriptinfoarea.set_data_id then
		self.areacgfscriptinfoarea:set_data_id(data)
	end
				
end


cgfscriptinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfscriptinfoarea.set_data then
		self.areacgfscriptinfoarea:set_data(data)
	end
			
end




cgfscriptinfoFrame.on_show = function(self)
			
	if self.areacgfscriptinfoarea.on_show then
		self.areacgfscriptinfoarea:on_show()
	end
			
end


cgfscriptinfoFrame.on_hide = function(self)
			
	if self.areacgfscriptinfoarea.on_hide then
		self.areacgfscriptinfoarea:on_hide()
	end		
			
end

	


	