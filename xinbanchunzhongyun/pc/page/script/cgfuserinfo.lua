
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfuserinfoFrame = inherit(GmBase.FrameBase):name("cgfuserinfoFrame")

cgfuserinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_cgfuserinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areacgfuserinfoarea
	self.areacgfuserinfoarea = gm_xinbanchunzhongyun.cgfuserinfoareaArea(self)
	
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
			self.areanav:set_title('cgfuserinfo')
		elseif self.areanav.set then
			self.areanav:set('title','cgfuserinfo')
		end
					
		if self.areacgfuserinfoarea.set_title then
			self.areacgfuserinfoarea:set_title('cgfuserinfo')
		elseif self.areacgfuserinfoarea.set then
			self.areacgfuserinfoarea:set('title','cgfuserinfo')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areacgfuserinfoarea
	
	self:set_style('display:none')

	
end


cgfuserinfoFrame.set_data_id = function(self,data)
	
	if self.areacgfuserinfoarea.set_data_id then
		self.areacgfuserinfoarea:set_data_id(data)
	end
				
end


cgfuserinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacgfuserinfoarea.set_data then
		self.areacgfuserinfoarea:set_data(data)
	end
			
end




cgfuserinfoFrame.on_show = function(self)
			
	if self.areacgfuserinfoarea.on_show then
		self.areacgfuserinfoarea:on_show()
	end
			
end


cgfuserinfoFrame.on_hide = function(self)
			
	if self.areacgfuserinfoarea.on_hide then
		self.areacgfuserinfoarea:on_hide()
	end		
			
end

	


	