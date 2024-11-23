
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

ordermodifyFrame = inherit(GmBase.FrameBase):name("ordermodifyFrame")

ordermodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ordermodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaordermodifyarea
	self.areaordermodifyarea = gm_xinbanchunzhongyun.ordermodifyareaArea(self)
	
	if self.areaordermodifyarea.set then
				
	end
	
		if self.areaordermodifyarea.set_title then
			self.areaordermodifyarea:set_title('编辑订单')
		elseif self.areaordermodifyarea.set then
			self.areaordermodifyarea:set('title','编辑订单')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaordermodifyarea
	
	self:set_style('display:none')

	
end


ordermodifyFrame.set_data_id = function(self,data)
	
	if self.areaordermodifyarea.set_data_id then
		self.areaordermodifyarea:set_data_id(data)
	end
				
end


ordermodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaordermodifyarea.set_data then
		self.areaordermodifyarea:set_data(data)
	end
			
end




ordermodifyFrame.on_show = function(self)
			
	if self.areaordermodifyarea.on_show then
		self.areaordermodifyarea:on_show()
	end
			
end


ordermodifyFrame.on_hide = function(self)
			
	if self.areaordermodifyarea.on_hide then
		self.areaordermodifyarea:on_hide()
	end		
			
end

	


	