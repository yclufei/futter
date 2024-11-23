
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

productaddFrame = inherit(GmBase.FrameBase):name("productaddFrame")

productaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaproductaddarea
	self.areaproductaddarea = gm_xinbanchunzhongyun.productaddareaArea(self)
	
	if self.areaproductaddarea.set then
				
	end
	
		if self.areaproductaddarea.set_title then
			self.areaproductaddarea:set_title('添加产品')
		elseif self.areaproductaddarea.set then
			self.areaproductaddarea:set('title','添加产品')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaproductaddarea
	
	self:set_style('display:none')

	
end


productaddFrame.set_data_id = function(self,data)
	
	if self.areaproductaddarea.set_data_id then
		self.areaproductaddarea:set_data_id(data)
	end
				
end


productaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaproductaddarea.set_data then
		self.areaproductaddarea:set_data(data)
	end
			
end




productaddFrame.on_show = function(self)
			
	if self.areaproductaddarea.on_show then
		self.areaproductaddarea:on_show()
	end
			
end


productaddFrame.on_hide = function(self)
			
	if self.areaproductaddarea.on_hide then
		self.areaproductaddarea:on_hide()
	end		
			
end

	


	