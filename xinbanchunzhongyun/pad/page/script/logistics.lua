
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

logisticsFrame = inherit(GmBase.FrameBase):name("logisticsFrame")

logisticsFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_logistics"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- arealogisticsarea
	self.arealogisticsarea = gm_xinbanchunzhongyun.logisticsareaArea(self)
	
	if self.arealogisticsarea.set then
				
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

	


	