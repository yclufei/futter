
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

orderaddFrame = inherit(GmBase.FrameBase):name("orderaddFrame")

orderaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_orderadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaorderaddarea
	self.areaorderaddarea = gm_xinbanchunzhongyun.orderaddareaArea(self)
	
	if self.areaorderaddarea.set then
				
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
			self.areanav:set_title('添加订单')
		elseif self.areanav.set then
			self.areanav:set('title','添加订单')
		end
					
		if self.areaorderaddarea.set_title then
			self.areaorderaddarea:set_title('添加订单')
		elseif self.areaorderaddarea.set then
			self.areaorderaddarea:set('title','添加订单')
		end
					
	
	self.mainarea = self.areaorderaddarea
	
	self:set_style('display:none')

	
end


orderaddFrame.set_data_id = function(self,data)
	
	if self.areaorderaddarea.set_data_id then
		self.areaorderaddarea:set_data_id(data)
	end
				
end


orderaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaorderaddarea.set_data then
		self.areaorderaddarea:set_data(data)
	end
			
end




orderaddFrame.on_show = function(self)
			
	if self.areaorderaddarea.on_show then
		self.areaorderaddarea:on_show()
	end
			
end


orderaddFrame.on_hide = function(self)
			
	if self.areaorderaddarea.on_hide then
		self.areaorderaddarea:on_hide()
	end		
			
end

	


	