
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfordermodifyFrame = inherit(GmBase.FrameBase):name("cgfordermodifyFrame")

cgfordermodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfordermodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfordermodifyarea
	self.areacgfordermodifyarea = gm_xinbanchunzhongyun.cgfordermodifyareaArea(self)
	
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
			self.areanav:set_title('cgfordermodify')
		elseif self.areanav.set then
			self.areanav:set('title','cgfordermodify')
		end
					
		if self.areacgfordermodifyarea.set_title then
			self.areacgfordermodifyarea:set_title('cgfordermodify')
		elseif self.areacgfordermodifyarea.set then
			self.areacgfordermodifyarea:set('title','cgfordermodify')
		end
					
	
	self.mainarea = self.areacgfordermodifyarea
	
	self:set_style('display:none')

	
end


cgfordermodifyFrame.set_data_id = function(self,data)
	
	if self.areacgfordermodifyarea.set_data_id then
		self.areacgfordermodifyarea:set_data_id(data)
	end
				
end


cgfordermodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfordermodifyarea.set_data then
		self.areacgfordermodifyarea:set_data(data)
	end
			
end




cgfordermodifyFrame.on_show = function(self)
			
	if self.areacgfordermodifyarea.on_show then
		self.areacgfordermodifyarea:on_show()
	end
			
end


cgfordermodifyFrame.on_hide = function(self)
			
	if self.areacgfordermodifyarea.on_hide then
		self.areacgfordermodifyarea:on_hide()
	end		
			
end

	


	