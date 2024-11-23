
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

servicelistFrame = inherit(GmBase.FrameBase):name("servicelistFrame")

servicelistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_servicelist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaservicelistarea
	self.areaservicelistarea = gm_ruanjianwaibaojiaoyisuo.servicelistareaArea(self)
	
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
			self.areanav:set_title('servicelist')
		elseif self.areanav.set then
			self.areanav:set('title','servicelist')
		end
					
	
	self.mainarea = self.areaservicelistarea
	
	self:set_style('display:none')

	
end


servicelistFrame.set_data_id = function(self,data)
	
	if self.areaservicelistarea.set_data_id then
		self.areaservicelistarea:set_data_id(data)
	end
				
end


servicelistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaservicelistarea.set_data then
		self.areaservicelistarea:set_data(data)
	end
			
end




servicelistFrame.on_show = function(self)
			
	if self.areaservicelistarea.on_show then
		self.areaservicelistarea:on_show()
	end
			
end


servicelistFrame.on_hide = function(self)
			
	if self.areaservicelistarea.on_hide then
		self.areaservicelistarea:on_hide()
	end		
			
end

	


	