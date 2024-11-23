
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfuseraddFrame = inherit(GmBase.FrameBase):name("cgfuseraddFrame")

cgfuseraddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfuseradd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfuseraddarea
	self.areacgfuseraddarea = gm_xinbanchunzhongyun.cgfuseraddareaArea(self)
	
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
			self.areanav:set_title('cgfuseradd')
		elseif self.areanav.set then
			self.areanav:set('title','cgfuseradd')
		end
					
		if self.areacgfuseraddarea.set_title then
			self.areacgfuseraddarea:set_title('cgfuseradd')
		elseif self.areacgfuseraddarea.set then
			self.areacgfuseraddarea:set('title','cgfuseradd')
		end
					
	
	self.mainarea = self.areacgfuseraddarea
	
	self:set_style('display:none')

	
end


cgfuseraddFrame.set_data_id = function(self,data)
	
	if self.areacgfuseraddarea.set_data_id then
		self.areacgfuseraddarea:set_data_id(data)
	end
				
end


cgfuseraddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfuseraddarea.set_data then
		self.areacgfuseraddarea:set_data(data)
	end
			
end




cgfuseraddFrame.on_show = function(self)
			
	if self.areacgfuseraddarea.on_show then
		self.areacgfuseraddarea:on_show()
	end
			
end


cgfuseraddFrame.on_hide = function(self)
			
	if self.areacgfuseraddarea.on_hide then
		self.areacgfuseraddarea:on_hide()
	end		
			
end

	


	