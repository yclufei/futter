
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientlistFrame = inherit(GmBase.FrameBase):name("clientlistFrame")

clientlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaclientlistarea
	self.areaclientlistarea = gm_xinbanchunzhongyun.clientlistareaArea(self)
	
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
			self.areanav:set_title('clientlist')
		elseif self.areanav.set then
			self.areanav:set('title','clientlist')
		end
					
		if self.areaclientlistarea.set_title then
			self.areaclientlistarea:set_title('clientlist')
		elseif self.areaclientlistarea.set then
			self.areaclientlistarea:set('title','clientlist')
		end
					
	
	self.mainarea = self.areaclientlistarea
	
	self:set_style('display:none')

	
end


clientlistFrame.set_data_id = function(self,data)
	
	if self.areaclientlistarea.set_data_id then
		self.areaclientlistarea:set_data_id(data)
	end
				
end


clientlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaclientlistarea.set_data then
		self.areaclientlistarea:set_data(data)
	end
			
end




clientlistFrame.on_show = function(self)
			
	if self.areaclientlistarea.on_show then
		self.areaclientlistarea:on_show()
	end
			
end


clientlistFrame.on_hide = function(self)
			
	if self.areaclientlistarea.on_hide then
		self.areaclientlistarea:on_hide()
	end		
			
end

	


	