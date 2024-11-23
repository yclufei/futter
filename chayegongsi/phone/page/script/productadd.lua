
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

productaddFrame = inherit(GmBase.FrameBase):name("productaddFrame")

productaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaproductaddarea
	self.areaproductaddarea = gm_chayegongsi.productaddareaArea(self)
	
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
			self.areanav:set_title('我要售卖')
		elseif self.areanav.set then
			self.areanav:set('title','我要售卖')
		end
					
	
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
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
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

	


	