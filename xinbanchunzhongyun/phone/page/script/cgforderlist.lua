
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgforderlistFrame = inherit(GmBase.FrameBase):name("cgforderlistFrame")

cgforderlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgforderlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgforderlistarea
	self.areacgforderlistarea = gm_xinbanchunzhongyun.cgforderlistareaArea(self)
	
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
			self.areanav:set_title('cgforderlist')
		elseif self.areanav.set then
			self.areanav:set('title','cgforderlist')
		end
					
		if self.areacgforderlistarea.set_title then
			self.areacgforderlistarea:set_title('cgforderlist')
		elseif self.areacgforderlistarea.set then
			self.areacgforderlistarea:set('title','cgforderlist')
		end
					
	
	self.mainarea = self.areacgforderlistarea
	
	self:set_style('display:none')

	
end


cgforderlistFrame.set_data_id = function(self,data)
	
	if self.areacgforderlistarea.set_data_id then
		self.areacgforderlistarea:set_data_id(data)
	end
				
end


cgforderlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgforderlistarea.set_data then
		self.areacgforderlistarea:set_data(data)
	end
			
end




cgforderlistFrame.on_show = function(self)
			
	if self.areacgforderlistarea.on_show then
		self.areacgforderlistarea:on_show()
	end
			
end


cgforderlistFrame.on_hide = function(self)
			
	if self.areacgforderlistarea.on_hide then
		self.areacgforderlistarea:on_hide()
	end		
			
end

	


	