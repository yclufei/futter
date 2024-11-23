
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

producttypeaddFrame = inherit(GmBase.FrameBase):name("producttypeaddFrame")

producttypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_producttypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaproducttypeaddarea
	self.areaproducttypeaddarea = gm_xinbanchunzhongyun.producttypeaddareaArea(self)
	
	if self.areaproducttypeaddarea.set then
				
	end
	
		if self.areaproducttypeaddarea.set_title then
			self.areaproducttypeaddarea:set_title('添加产品分类')
		elseif self.areaproducttypeaddarea.set then
			self.areaproducttypeaddarea:set('title','添加产品分类')
		end
					
	
	self.mainarea = self.areaproducttypeaddarea
	
	self:set_style('display:none')

	
end


producttypeaddFrame.set_data_id = function(self,data)
	
	if self.areaproducttypeaddarea.set_data_id then
		self.areaproducttypeaddarea:set_data_id(data)
	end
				
end


producttypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaproducttypeaddarea.set_data then
		self.areaproducttypeaddarea:set_data(data)
	end
			
end




producttypeaddFrame.on_show = function(self)
			
	if self.areaproducttypeaddarea.on_show then
		self.areaproducttypeaddarea:on_show()
	end
			
end


producttypeaddFrame.on_hide = function(self)
			
	if self.areaproducttypeaddarea.on_hide then
		self.areaproducttypeaddarea:on_hide()
	end		
			
end

	


	