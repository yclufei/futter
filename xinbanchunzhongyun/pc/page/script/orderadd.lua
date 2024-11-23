
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

orderaddFrame = inherit(GmBase.FrameBase):name("orderaddFrame")

orderaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_orderadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaorderaddarea
	self.areaorderaddarea = gm_xinbanchunzhongyun.orderaddareaArea(self)
	
	if self.areaorderaddarea.set then
				
	end
	
		if self.areaorderaddarea.set_title then
			self.areaorderaddarea:set_title('添加订单')
		elseif self.areaorderaddarea.set then
			self.areaorderaddarea:set('title','添加订单')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
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

	


	