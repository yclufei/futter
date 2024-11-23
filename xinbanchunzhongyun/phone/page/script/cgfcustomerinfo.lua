
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfcustomerinfoFrame = inherit(GmBase.FrameBase):name("cgfcustomerinfoFrame")

cgfcustomerinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfcustomerinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfcustomerinfoarea
	self.areacgfcustomerinfoarea = gm_xinbanchunzhongyun.cgfcustomerinfoareaArea(self)
	
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
			self.areanav:set_title('cgfcustomerinfo')
		elseif self.areanav.set then
			self.areanav:set('title','cgfcustomerinfo')
		end
					
		if self.areacgfcustomerinfoarea.set_title then
			self.areacgfcustomerinfoarea:set_title('cgfcustomerinfo')
		elseif self.areacgfcustomerinfoarea.set then
			self.areacgfcustomerinfoarea:set('title','cgfcustomerinfo')
		end
					
	
	self.mainarea = self.areacgfcustomerinfoarea
	
	self:set_style('display:none')

	
end


cgfcustomerinfoFrame.set_data_id = function(self,data)
	
	if self.areacgfcustomerinfoarea.set_data_id then
		self.areacgfcustomerinfoarea:set_data_id(data)
	end
				
end


cgfcustomerinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfcustomerinfoarea.set_data then
		self.areacgfcustomerinfoarea:set_data(data)
	end
			
end




cgfcustomerinfoFrame.on_show = function(self)
			
	if self.areacgfcustomerinfoarea.on_show then
		self.areacgfcustomerinfoarea:on_show()
	end
			
end


cgfcustomerinfoFrame.on_hide = function(self)
			
	if self.areacgfcustomerinfoarea.on_hide then
		self.areacgfcustomerinfoarea:on_hide()
	end		
			
end

	


	