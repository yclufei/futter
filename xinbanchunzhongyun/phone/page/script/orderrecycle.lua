
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

orderrecycleFrame = inherit(GmBase.FrameBase):name("orderrecycleFrame")

orderrecycleFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_orderrecycle"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaorderrecyclearea
	self.areaorderrecyclearea = gm_xinbanchunzhongyun.orderrecycleareaArea(self)
	
	if self.areaorderrecyclearea.set then
				
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
			self.areanav:set_title('订单回收站')
		elseif self.areanav.set then
			self.areanav:set('title','订单回收站')
		end
					
		if self.areaorderrecyclearea.set_title then
			self.areaorderrecyclearea:set_title('订单回收站')
		elseif self.areaorderrecyclearea.set then
			self.areaorderrecyclearea:set('title','订单回收站')
		end
					
	
	self.mainarea = self.areaorderrecyclearea
	
	self:set_style('display:none')

	
end


orderrecycleFrame.set_data_id = function(self,data)
	
	if self.areaorderrecyclearea.set_data_id then
		self.areaorderrecyclearea:set_data_id(data)
	end
				
end


orderrecycleFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaorderrecyclearea.set_data then
		self.areaorderrecyclearea:set_data(data)
	end
			
end




orderrecycleFrame.on_show = function(self)
			
	if self.areaorderrecyclearea.on_show then
		self.areaorderrecyclearea:on_show()
	end
			
end


orderrecycleFrame.on_hide = function(self)
			
	if self.areaorderrecyclearea.on_hide then
		self.areaorderrecyclearea:on_hide()
	end		
			
end

	


	