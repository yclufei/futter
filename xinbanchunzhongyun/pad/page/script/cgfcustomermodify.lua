
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfcustomermodifyFrame = inherit(GmBase.FrameBase):name("cgfcustomermodifyFrame")

cgfcustomermodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfcustomermodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfcustomermodifyarea
	self.areacgfcustomermodifyarea = gm_xinbanchunzhongyun.cgfcustomermodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('cgfcustomermodify')
		elseif self.areanav.set then
			self.areanav:set('title','cgfcustomermodify')
		end
					
		if self.areacgfcustomermodifyarea.set_title then
			self.areacgfcustomermodifyarea:set_title('cgfcustomermodify')
		elseif self.areacgfcustomermodifyarea.set then
			self.areacgfcustomermodifyarea:set('title','cgfcustomermodify')
		end
					
	
	self.mainarea = self.areacgfcustomermodifyarea
	
	self:set_style('display:none')

	
end


cgfcustomermodifyFrame.set_data_id = function(self,data)
	
	if self.areacgfcustomermodifyarea.set_data_id then
		self.areacgfcustomermodifyarea:set_data_id(data)
	end
				
end


cgfcustomermodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfcustomermodifyarea.set_data then
		self.areacgfcustomermodifyarea:set_data(data)
	end
			
end




cgfcustomermodifyFrame.on_show = function(self)
			
	if self.areacgfcustomermodifyarea.on_show then
		self.areacgfcustomermodifyarea:on_show()
	end
			
end


cgfcustomermodifyFrame.on_hide = function(self)
			
	if self.areacgfcustomermodifyarea.on_hide then
		self.areacgfcustomermodifyarea:on_hide()
	end		
			
end

	


	