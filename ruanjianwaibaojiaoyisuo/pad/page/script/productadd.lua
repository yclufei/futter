
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

productaddFrame = inherit(GmBase.FrameBase):name("productaddFrame")

productaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaproductaddarea
	self.areaproductaddarea = gm_ruanjianwaibaojiaoyisuo.productaddareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('productadd')
		elseif self.areanav.set then
			self.areanav:set('title','productadd')
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

	


	