
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgforderinfoFrame = inherit(GmBase.FrameBase):name("cgforderinfoFrame")

cgforderinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgforderinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgforderinfoarea
	self.areacgforderinfoarea = gm_xinbanchunzhongyun.cgforderinfoareaArea(self)
	
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
			self.areanav:set_title('cgforderinfo')
		elseif self.areanav.set then
			self.areanav:set('title','cgforderinfo')
		end
					
		if self.areacgforderinfoarea.set_title then
			self.areacgforderinfoarea:set_title('cgforderinfo')
		elseif self.areacgforderinfoarea.set then
			self.areacgforderinfoarea:set('title','cgforderinfo')
		end
					
	
	self.mainarea = self.areacgforderinfoarea
	
	self:set_style('display:none')

	
end


cgforderinfoFrame.set_data_id = function(self,data)
	
	if self.areacgforderinfoarea.set_data_id then
		self.areacgforderinfoarea:set_data_id(data)
	end
				
end


cgforderinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgforderinfoarea.set_data then
		self.areacgforderinfoarea:set_data(data)
	end
			
end




cgforderinfoFrame.on_show = function(self)
			
	if self.areacgforderinfoarea.on_show then
		self.areacgforderinfoarea:on_show()
	end
			
end


cgforderinfoFrame.on_hide = function(self)
			
	if self.areacgforderinfoarea.on_hide then
		self.areacgforderinfoarea:on_hide()
	end		
			
end

	


	