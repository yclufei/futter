
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

producttypemodifyFrame = inherit(GmBase.FrameBase):name("producttypemodifyFrame")

producttypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_producttypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaproducttypemodifyarea
	self.areaproducttypemodifyarea = gm_xinbanchunzhongyun.producttypemodifyareaArea(self)
	
	if self.areaproducttypemodifyarea.set then
				
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
			self.areanav:set_title('产品分类编辑')
		elseif self.areanav.set then
			self.areanav:set('title','产品分类编辑')
		end
					
		if self.areaproducttypemodifyarea.set_title then
			self.areaproducttypemodifyarea:set_title('产品分类编辑')
		elseif self.areaproducttypemodifyarea.set then
			self.areaproducttypemodifyarea:set('title','产品分类编辑')
		end
					
	
	self.mainarea = self.areaproducttypemodifyarea
	
	self:set_style('display:none')

	
end


producttypemodifyFrame.set_data_id = function(self,data)
	
	if self.areaproducttypemodifyarea.set_data_id then
		self.areaproducttypemodifyarea:set_data_id(data)
	end
				
end


producttypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaproducttypemodifyarea.set_data then
		self.areaproducttypemodifyarea:set_data(data)
	end
			
end




producttypemodifyFrame.on_show = function(self)
			
	if self.areaproducttypemodifyarea.on_show then
		self.areaproducttypemodifyarea:on_show()
	end
			
end


producttypemodifyFrame.on_hide = function(self)
			
	if self.areaproducttypemodifyarea.on_hide then
		self.areaproducttypemodifyarea:on_hide()
	end		
			
end

	


	