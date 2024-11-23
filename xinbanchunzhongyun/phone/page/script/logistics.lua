
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

logisticsFrame = inherit(GmBase.FrameBase):name("logisticsFrame")

logisticsFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_logistics"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- arealogisticsarea
	self.arealogisticsarea = gm_xinbanchunzhongyun.logisticsareaArea(self)
	
	if self.arealogisticsarea.set then
				
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
			self.areanav:set_title('找物流')
		elseif self.areanav.set then
			self.areanav:set('title','找物流')
		end
					
		if self.arealogisticsarea.set_title then
			self.arealogisticsarea:set_title('找物流')
		elseif self.arealogisticsarea.set then
			self.arealogisticsarea:set('title','找物流')
		end
					
	
	self.mainarea = self.arealogisticsarea
	
	self:set_style('display:none')

	
end


logisticsFrame.set_data_id = function(self,data)
	
	if self.arealogisticsarea.set_data_id then
		self.arealogisticsarea:set_data_id(data)
	end
				
end


logisticsFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arealogisticsarea.set_data then
		self.arealogisticsarea:set_data(data)
	end
			
end




logisticsFrame.on_show = function(self)
			
	if self.arealogisticsarea.on_show then
		self.arealogisticsarea:on_show()
	end
			
end


logisticsFrame.on_hide = function(self)
			
	if self.arealogisticsarea.on_hide then
		self.arealogisticsarea:on_hide()
	end		
			
end

	


	