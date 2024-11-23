
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfcustomeraddFrame = inherit(GmBase.FrameBase):name("cgfcustomeraddFrame")

cgfcustomeraddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfcustomeradd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfcustomeraddarea
	self.areacgfcustomeraddarea = gm_xinbanchunzhongyun.cgfcustomeraddareaArea(self)
	
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
			self.areanav:set_title('cgfcustomeradd')
		elseif self.areanav.set then
			self.areanav:set('title','cgfcustomeradd')
		end
					
		if self.areacgfcustomeraddarea.set_title then
			self.areacgfcustomeraddarea:set_title('cgfcustomeradd')
		elseif self.areacgfcustomeraddarea.set then
			self.areacgfcustomeraddarea:set('title','cgfcustomeradd')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areacgfcustomeraddarea
	
	self:set_style('display:none')

	
end


cgfcustomeraddFrame.set_data_id = function(self,data)
	
	if self.areacgfcustomeraddarea.set_data_id then
		self.areacgfcustomeraddarea:set_data_id(data)
	end
				
end


cgfcustomeraddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfcustomeraddarea.set_data then
		self.areacgfcustomeraddarea:set_data(data)
	end
			
end




cgfcustomeraddFrame.on_show = function(self)
			
	if self.areacgfcustomeraddarea.on_show then
		self.areacgfcustomeraddarea:on_show()
	end
			
end


cgfcustomeraddFrame.on_hide = function(self)
			
	if self.areacgfcustomeraddarea.on_hide then
		self.areacgfcustomeraddarea:on_hide()
	end		
			
end

	


	