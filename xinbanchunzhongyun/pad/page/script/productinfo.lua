
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

productinfoFrame = inherit(GmBase.FrameBase):name("productinfoFrame")

productinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaproductinfoarea
	self.areaproductinfoarea = gm_xinbanchunzhongyun.productinfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('productinfo')
		elseif self.areanav.set then
			self.areanav:set('title','productinfo')
		end
					
		if self.areaproductinfoarea.set_title then
			self.areaproductinfoarea:set_title('productinfo')
		elseif self.areaproductinfoarea.set then
			self.areaproductinfoarea:set('title','productinfo')
		end
					
	
	self.mainarea = self.areaproductinfoarea
	
	self:set_style('display:none')

	
end


productinfoFrame.set_data_id = function(self,data)
	
	if self.areaproductinfoarea.set_data_id then
		self.areaproductinfoarea:set_data_id(data)
	end
				
end


productinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaproductinfoarea.set_data then
		self.areaproductinfoarea:set_data(data)
	end
			
end




productinfoFrame.on_show = function(self)
			
	if self.areaproductinfoarea.on_show then
		self.areaproductinfoarea:on_show()
	end
			
end


productinfoFrame.on_hide = function(self)
			
	if self.areaproductinfoarea.on_hide then
		self.areaproductinfoarea:on_hide()
	end		
			
end

	


	