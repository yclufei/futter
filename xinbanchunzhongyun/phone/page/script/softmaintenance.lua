
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

softmaintenanceFrame = inherit(GmBase.FrameBase):name("softmaintenanceFrame")

softmaintenanceFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_softmaintenance"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areasoftmaintenancearea
	self.areasoftmaintenancearea = gm_xinbanchunzhongyun.softmaintenanceareaArea(self)
	
	if self.areasoftmaintenancearea.set then
				
	end
	
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
			self.areanav:set_title('软件维护')
		elseif self.areanav.set then
			self.areanav:set('title','软件维护')
		end
					
		if self.areasoftmaintenancearea.set_title then
			self.areasoftmaintenancearea:set_title('软件维护')
		elseif self.areasoftmaintenancearea.set then
			self.areasoftmaintenancearea:set('title','软件维护')
		end
					
	
	self.mainarea = self.areasoftmaintenancearea
	
	self:set_style('display:none')

	
end


softmaintenanceFrame.set_data_id = function(self,data)
	
	if self.areasoftmaintenancearea.set_data_id then
		self.areasoftmaintenancearea:set_data_id(data)
	end
				
end


softmaintenanceFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areasoftmaintenancearea.set_data then
		self.areasoftmaintenancearea:set_data(data)
	end
			
end




softmaintenanceFrame.on_show = function(self)
			
	if self.areasoftmaintenancearea.on_show then
		self.areasoftmaintenancearea:on_show()
	end
			
end


softmaintenanceFrame.on_hide = function(self)
			
	if self.areasoftmaintenancearea.on_hide then
		self.areasoftmaintenancearea:on_hide()
	end		
			
end

	


	