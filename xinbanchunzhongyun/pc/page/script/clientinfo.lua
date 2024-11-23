
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientinfoFrame = inherit(GmBase.FrameBase):name("clientinfoFrame")

clientinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaclientinfoarea
	self.areaclientinfoarea = gm_xinbanchunzhongyun.clientinfoareaArea(self)
	
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
			self.areanav:set_title('clientinfo')
		elseif self.areanav.set then
			self.areanav:set('title','clientinfo')
		end
					
		if self.areaclientinfoarea.set_title then
			self.areaclientinfoarea:set_title('clientinfo')
		elseif self.areaclientinfoarea.set then
			self.areaclientinfoarea:set('title','clientinfo')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaclientinfoarea
	
	self:set_style('display:none')

	
end


clientinfoFrame.set_data_id = function(self,data)
	
	if self.areaclientinfoarea.set_data_id then
		self.areaclientinfoarea:set_data_id(data)
	end
				
end


clientinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaclientinfoarea.set_data then
		self.areaclientinfoarea:set_data(data)
	end
			
end




clientinfoFrame.on_show = function(self)
			
	if self.areaclientinfoarea.on_show then
		self.areaclientinfoarea:on_show()
	end
			
end


clientinfoFrame.on_hide = function(self)
			
	if self.areaclientinfoarea.on_hide then
		self.areaclientinfoarea:on_hide()
	end		
			
end

	


	