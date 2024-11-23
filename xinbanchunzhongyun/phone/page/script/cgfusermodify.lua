
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfusermodifyFrame = inherit(GmBase.FrameBase):name("cgfusermodifyFrame")

cgfusermodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfusermodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfusermodifyarea
	self.areacgfusermodifyarea = gm_xinbanchunzhongyun.cgfusermodifyareaArea(self)
	
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
			self.areanav:set_title('cgfusermodify')
		elseif self.areanav.set then
			self.areanav:set('title','cgfusermodify')
		end
					
		if self.areacgfusermodifyarea.set_title then
			self.areacgfusermodifyarea:set_title('cgfusermodify')
		elseif self.areacgfusermodifyarea.set then
			self.areacgfusermodifyarea:set('title','cgfusermodify')
		end
					
	
	self.mainarea = self.areacgfusermodifyarea
	
	self:set_style('display:none')

	
end


cgfusermodifyFrame.set_data_id = function(self,data)
	
	if self.areacgfusermodifyarea.set_data_id then
		self.areacgfusermodifyarea:set_data_id(data)
	end
				
end


cgfusermodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfusermodifyarea.set_data then
		self.areacgfusermodifyarea:set_data(data)
	end
			
end




cgfusermodifyFrame.on_show = function(self)
			
	if self.areacgfusermodifyarea.on_show then
		self.areacgfusermodifyarea:on_show()
	end
			
end


cgfusermodifyFrame.on_hide = function(self)
			
	if self.areacgfusermodifyarea.on_hide then
		self.areacgfusermodifyarea:on_hide()
	end		
			
end

	


	