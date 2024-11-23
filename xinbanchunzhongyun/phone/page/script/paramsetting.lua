
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

paramsettingFrame = inherit(GmBase.FrameBase):name("paramsettingFrame")

paramsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_paramsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaparamsettingarea
	self.areaparamsettingarea = gm_xinbanchunzhongyun.paramsettingareaArea(self)
	
	if self.areaparamsettingarea.set then
				
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
			self.areanav:set_title('参数设置')
		elseif self.areanav.set then
			self.areanav:set('title','参数设置')
		end
					
		if self.areaparamsettingarea.set_title then
			self.areaparamsettingarea:set_title('参数设置')
		elseif self.areaparamsettingarea.set then
			self.areaparamsettingarea:set('title','参数设置')
		end
					
	
	self.mainarea = self.areaparamsettingarea
	
	self:set_style('display:none')

	
end


paramsettingFrame.set_data_id = function(self,data)
	
	if self.areaparamsettingarea.set_data_id then
		self.areaparamsettingarea:set_data_id(data)
	end
				
end


paramsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaparamsettingarea.set_data then
		self.areaparamsettingarea:set_data(data)
	end
			
end




paramsettingFrame.on_show = function(self)
			
	if self.areaparamsettingarea.on_show then
		self.areaparamsettingarea:on_show()
	end
			
end


paramsettingFrame.on_hide = function(self)
			
	if self.areaparamsettingarea.on_hide then
		self.areaparamsettingarea:on_hide()
	end		
			
end

	


	