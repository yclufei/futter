
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

productmodifyFrame = inherit(GmBase.FrameBase):name("productmodifyFrame")

productmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaproductmodifyarea
	self.areaproductmodifyarea = gm_xinbanchunzhongyun.productmodifyareaArea(self)
	
	if self.areaproductmodifyarea.set then
				
	end
	
		if self.areaproductmodifyarea.set_title then
			self.areaproductmodifyarea:set_title('编辑产品')
		elseif self.areaproductmodifyarea.set then
			self.areaproductmodifyarea:set('title','编辑产品')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaproductmodifyarea
	
	self:set_style('display:none')

	
end


productmodifyFrame.set_data_id = function(self,data)
	
	if self.areaproductmodifyarea.set_data_id then
		self.areaproductmodifyarea:set_data_id(data)
	end
				
end


productmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaproductmodifyarea.set_data then
		self.areaproductmodifyarea:set_data(data)
	end
			
end




productmodifyFrame.on_show = function(self)
			
	if self.areaproductmodifyarea.on_show then
		self.areaproductmodifyarea:on_show()
	end
			
end


productmodifyFrame.on_hide = function(self)
			
	if self.areaproductmodifyarea.on_hide then
		self.areaproductmodifyarea:on_hide()
	end		
			
end

	


	