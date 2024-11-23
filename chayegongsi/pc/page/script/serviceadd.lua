
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

serviceaddFrame = inherit(GmBase.FrameBase):name("serviceaddFrame")

serviceaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_serviceadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaserviceaddarea
	self.areaserviceaddarea = gm_chayegongsi.serviceaddareaArea(self)
	
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
			self.areanav:set_title('serviceadd')
		elseif self.areanav.set then
			self.areanav:set('title','serviceadd')
		end
					
	
	self.mainarea = self.areaserviceaddarea
	
	self:set_style('display:none')

	
end


serviceaddFrame.set_data_id = function(self,data)
	
	if self.areaserviceaddarea.set_data_id then
		self.areaserviceaddarea:set_data_id(data)
	end
				
end


serviceaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaserviceaddarea.set_data then
		self.areaserviceaddarea:set_data(data)
	end
			
end




serviceaddFrame.on_show = function(self)
			
	if self.areaserviceaddarea.on_show then
		self.areaserviceaddarea:on_show()
	end
			
end


serviceaddFrame.on_hide = function(self)
			
	if self.areaserviceaddarea.on_hide then
		self.areaserviceaddarea:on_hide()
	end		
			
end

	


	