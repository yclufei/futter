
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfcustomerlistFrame = inherit(GmBase.FrameBase):name("cgfcustomerlistFrame")

cgfcustomerlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfcustomerlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfcustomerlistarea
	self.areacgfcustomerlistarea = gm_xinbanchunzhongyun.cgfcustomerlistareaArea(self)
	
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
			self.areanav:set_title('cgfcustomerlist')
		elseif self.areanav.set then
			self.areanav:set('title','cgfcustomerlist')
		end
					
		if self.areacgfcustomerlistarea.set_title then
			self.areacgfcustomerlistarea:set_title('cgfcustomerlist')
		elseif self.areacgfcustomerlistarea.set then
			self.areacgfcustomerlistarea:set('title','cgfcustomerlist')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areacgfcustomerlistarea
	
	self:set_style('display:none')

	
end


cgfcustomerlistFrame.set_data_id = function(self,data)
	
	if self.areacgfcustomerlistarea.set_data_id then
		self.areacgfcustomerlistarea:set_data_id(data)
	end
				
end


cgfcustomerlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfcustomerlistarea.set_data then
		self.areacgfcustomerlistarea:set_data(data)
	end
			
end




cgfcustomerlistFrame.on_show = function(self)
			
	if self.areacgfcustomerlistarea.on_show then
		self.areacgfcustomerlistarea:on_show()
	end
			
end


cgfcustomerlistFrame.on_hide = function(self)
			
	if self.areacgfcustomerlistarea.on_hide then
		self.areacgfcustomerlistarea:on_hide()
	end		
			
end

	


	