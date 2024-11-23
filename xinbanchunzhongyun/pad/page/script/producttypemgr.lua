
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

producttypemgrFrame = inherit(GmBase.FrameBase):name("producttypemgrFrame")

producttypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_producttypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaproducttypemgrarea
	self.areaproducttypemgrarea = gm_xinbanchunzhongyun.producttypemgrareaArea(self)
	
	if self.areaproducttypemgrarea.set then
				
	end
	
		if self.areaproducttypemgrarea.set_title then
			self.areaproducttypemgrarea:set_title('产品分类管理')
		elseif self.areaproducttypemgrarea.set then
			self.areaproducttypemgrarea:set('title','产品分类管理')
		end
					
	
	self.mainarea = self.areaproducttypemgrarea
	
	self:set_style('display:none')

	
end


producttypemgrFrame.set_data_id = function(self,data)
	
	if self.areaproducttypemgrarea.set_data_id then
		self.areaproducttypemgrarea:set_data_id(data)
	end
				
end


producttypemgrFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaproducttypemgrarea.set_data then
		self.areaproducttypemgrarea:set_data(data)
	end
			
end




producttypemgrFrame.on_show = function(self)
			
	if self.areaproducttypemgrarea.on_show then
		self.areaproducttypemgrarea:on_show()
	end
			
end


producttypemgrFrame.on_hide = function(self)
			
	if self.areaproducttypemgrarea.on_hide then
		self.areaproducttypemgrarea:on_hide()
	end		
			
end

	


	