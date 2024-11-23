
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

ordertypemgrFrame = inherit(GmBase.FrameBase):name("ordertypemgrFrame")

ordertypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ordertypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaordertypemgrarea
	self.areaordertypemgrarea = gm_xinbanchunzhongyun.ordertypemgrareaArea(self)
	
	if self.areaordertypemgrarea.set then
				
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
			self.areanav:set_title('订单分类管理')
		elseif self.areanav.set then
			self.areanav:set('title','订单分类管理')
		end
					
		if self.areaordertypemgrarea.set_title then
			self.areaordertypemgrarea:set_title('订单分类管理')
		elseif self.areaordertypemgrarea.set then
			self.areaordertypemgrarea:set('title','订单分类管理')
		end
					
	
	self.mainarea = self.areaordertypemgrarea
	
	self:set_style('display:none')

	
end


ordertypemgrFrame.set_data_id = function(self,data)
	
	if self.areaordertypemgrarea.set_data_id then
		self.areaordertypemgrarea:set_data_id(data)
	end
				
end


ordertypemgrFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaordertypemgrarea.set_data then
		self.areaordertypemgrarea:set_data(data)
	end
			
end




ordertypemgrFrame.on_show = function(self)
			
	if self.areaordertypemgrarea.on_show then
		self.areaordertypemgrarea:on_show()
	end
			
end


ordertypemgrFrame.on_hide = function(self)
			
	if self.areaordertypemgrarea.on_hide then
		self.areaordertypemgrarea:on_hide()
	end		
			
end

	


	