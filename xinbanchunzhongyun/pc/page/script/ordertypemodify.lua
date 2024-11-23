
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

ordertypemodifyFrame = inherit(GmBase.FrameBase):name("ordertypemodifyFrame")

ordertypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ordertypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaordertypemodifyarea
	self.areaordertypemodifyarea = gm_xinbanchunzhongyun.ordertypemodifyareaArea(self)
	
	if self.areaordertypemodifyarea.set then
				
	end
	
		if self.areaordertypemodifyarea.set_title then
			self.areaordertypemodifyarea:set_title('订单分类编辑')
		elseif self.areaordertypemodifyarea.set then
			self.areaordertypemodifyarea:set('title','订单分类编辑')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaordertypemodifyarea
	
	self:set_style('display:none')

	
end


ordertypemodifyFrame.set_data_id = function(self,data)
	
	if self.areaordertypemodifyarea.set_data_id then
		self.areaordertypemodifyarea:set_data_id(data)
	end
				
end


ordertypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaordertypemodifyarea.set_data then
		self.areaordertypemodifyarea:set_data(data)
	end
			
end




ordertypemodifyFrame.on_show = function(self)
			
	if self.areaordertypemodifyarea.on_show then
		self.areaordertypemodifyarea:on_show()
	end
			
end


ordertypemodifyFrame.on_hide = function(self)
			
	if self.areaordertypemodifyarea.on_hide then
		self.areaordertypemodifyarea:on_hide()
	end		
			
end

	


	