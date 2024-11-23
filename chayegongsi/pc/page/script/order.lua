
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

orderFrame = inherit(GmBase.FrameBase):name("orderFrame")

orderFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_order"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaorderarea
	self.areaorderarea = gm_chayegongsi.orderareaArea(self)
	
	if self.areaorderarea.set then
				
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
			self.areanav:set_title('订单')
		elseif self.areanav.set then
			self.areanav:set('title','订单')
		end
					
	
	self.mainarea = self.areaorderarea
	
	self:set_style('display:none')

	
end


orderFrame.set_data_id = function(self,data)
	
	if self.areaorderarea.set_data_id then
		self.areaorderarea:set_data_id(data)
	end
				
end


orderFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaorderarea.set_data then
		self.areaorderarea:set_data(data)
	end
			
end




orderFrame.on_show = function(self)
			
	if self.areaorderarea.on_show then
		self.areaorderarea:on_show()
	end
			
end


orderFrame.on_hide = function(self)
			
	if self.areaorderarea.on_hide then
		self.areaorderarea:on_hide()
	end		
			
end

	


	