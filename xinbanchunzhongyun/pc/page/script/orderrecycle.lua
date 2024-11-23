
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

orderrecycleFrame = inherit(GmBase.FrameBase):name("orderrecycleFrame")

orderrecycleFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_orderrecycle"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaorderrecyclearea
	self.areaorderrecyclearea = gm_xinbanchunzhongyun.orderrecycleareaArea(self)
	
	if self.areaorderrecyclearea.set then
				
	end
	
		if self.areaorderrecyclearea.set_title then
			self.areaorderrecyclearea:set_title('订单回收站')
		elseif self.areaorderrecyclearea.set then
			self.areaorderrecyclearea:set('title','订单回收站')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
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

	


	