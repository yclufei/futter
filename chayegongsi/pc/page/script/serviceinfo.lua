
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

serviceinfoFrame = inherit(GmBase.FrameBase):name("serviceinfoFrame")

serviceinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_serviceinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaserviceinfoarea
	self.areaserviceinfoarea = gm_chayegongsi.serviceinfoareaArea(self)
	
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
			self.areanav:set_title('serviceinfo')
		elseif self.areanav.set then
			self.areanav:set('title','serviceinfo')
		end
					
	
	self.mainarea = self.areaserviceinfoarea
	
	self:set_style('display:none')

	
end


serviceinfoFrame.set_data_id = function(self,data)
	
	if self.areaserviceinfoarea.set_data_id then
		self.areaserviceinfoarea:set_data_id(data)
	end
				
end


serviceinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaserviceinfoarea.set_data then
		self.areaserviceinfoarea:set_data(data)
	end
			
end




serviceinfoFrame.on_show = function(self)
			
	if self.areaserviceinfoarea.on_show then
		self.areaserviceinfoarea:on_show()
	end
			
end


serviceinfoFrame.on_hide = function(self)
			
	if self.areaserviceinfoarea.on_hide then
		self.areaserviceinfoarea:on_hide()
	end		
			
end

	


	