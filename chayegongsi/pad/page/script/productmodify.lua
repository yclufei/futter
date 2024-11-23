
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

productmodifyFrame = inherit(GmBase.FrameBase):name("productmodifyFrame")

productmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaproductmodifyarea
	self.areaproductmodifyarea = gm_chayegongsi.productmodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('productmodify')
		elseif self.areanav.set then
			self.areanav:set('title','productmodify')
		end
					
	
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
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
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

	


	