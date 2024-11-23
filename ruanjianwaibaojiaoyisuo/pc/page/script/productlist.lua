
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

productlistFrame = inherit(GmBase.FrameBase):name("productlistFrame")

productlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_productlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaproductlistarea
	self.areaproductlistarea = gm_ruanjianwaibaojiaoyisuo.productlistareaArea(self)
	
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
			self.areanav:set_title('列表')
		elseif self.areanav.set then
			self.areanav:set('title','列表')
		end
					
	
	self.mainarea = self.areaproductlistarea
	
	self:set_style('display:none')

	
end


productlistFrame.set_data_id = function(self,data)
	
	if self.areaproductlistarea.set_data_id then
		self.areaproductlistarea:set_data_id(data)
	end
				
end


productlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaproductlistarea.set_data then
		self.areaproductlistarea:set_data(data)
	end
			
end




productlistFrame.on_show = function(self)
			
	if self.areaproductlistarea.on_show then
		self.areaproductlistarea:on_show()
	end
			
end


productlistFrame.on_hide = function(self)
			
	if self.areaproductlistarea.on_hide then
		self.areaproductlistarea:on_hide()
	end		
			
end

	


	