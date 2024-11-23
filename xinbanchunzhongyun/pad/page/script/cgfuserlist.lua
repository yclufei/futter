
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfuserlistFrame = inherit(GmBase.FrameBase):name("cgfuserlistFrame")

cgfuserlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfuserlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfuserlistarea
	self.areacgfuserlistarea = gm_xinbanchunzhongyun.cgfuserlistareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfuserlist')
		elseif self.areanav.set then
			self.areanav:set('title','cgfuserlist')
		end
					
		if self.areacgfuserlistarea.set_title then
			self.areacgfuserlistarea:set_title('cgfuserlist')
		elseif self.areacgfuserlistarea.set then
			self.areacgfuserlistarea:set('title','cgfuserlist')
		end
					
	
	self.mainarea = self.areacgfuserlistarea
	
	self:set_style('display:none')

	
end


cgfuserlistFrame.set_data_id = function(self,data)
	
	if self.areacgfuserlistarea.set_data_id then
		self.areacgfuserlistarea:set_data_id(data)
	end
				
end


cgfuserlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfuserlistarea.set_data then
		self.areacgfuserlistarea:set_data(data)
	end
			
end




cgfuserlistFrame.on_show = function(self)
			
	if self.areacgfuserlistarea.on_show then
		self.areacgfuserlistarea:on_show()
	end
			
end


cgfuserlistFrame.on_hide = function(self)
			
	if self.areacgfuserlistarea.on_hide then
		self.areacgfuserlistarea:on_hide()
	end		
			
end

	


	