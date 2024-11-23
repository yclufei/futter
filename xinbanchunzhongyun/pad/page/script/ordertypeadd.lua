
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

ordertypeaddFrame = inherit(GmBase.FrameBase):name("ordertypeaddFrame")

ordertypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ordertypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaordertypeaddarea
	self.areaordertypeaddarea = gm_xinbanchunzhongyun.ordertypeaddareaArea(self)
	
	if self.areaordertypeaddarea.set then
				
	end
	
		if self.areaordertypeaddarea.set_title then
			self.areaordertypeaddarea:set_title('添加订单分类')
		elseif self.areaordertypeaddarea.set then
			self.areaordertypeaddarea:set('title','添加订单分类')
		end
					
	
	self.mainarea = self.areaordertypeaddarea
	
	self:set_style('display:none')

	
end


ordertypeaddFrame.set_data_id = function(self,data)
	
	if self.areaordertypeaddarea.set_data_id then
		self.areaordertypeaddarea:set_data_id(data)
	end
				
end


ordertypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaordertypeaddarea.set_data then
		self.areaordertypeaddarea:set_data(data)
	end
			
end




ordertypeaddFrame.on_show = function(self)
			
	if self.areaordertypeaddarea.on_show then
		self.areaordertypeaddarea:on_show()
	end
			
end


ordertypeaddFrame.on_hide = function(self)
			
	if self.areaordertypeaddarea.on_hide then
		self.areaordertypeaddarea:on_hide()
	end		
			
end

	


	