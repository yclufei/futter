
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

mybuybillFrame = inherit(GmBase.FrameBase):name("mybuybillFrame")

mybuybillFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mybuybill"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areamybuybillarea
	self.areamybuybillarea = gm_chayegongsi.mybuybillareaArea(self)
	
	if self.areamybuybillarea.set then
				
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
			self.areanav:set_title('我的采购订单')
		elseif self.areanav.set then
			self.areanav:set('title','我的采购订单')
		end
					
	
	self.mainarea = self.areamybuybillarea
	
	self:set_style('display:none')

	
end


mybuybillFrame.set_data_id = function(self,data)
	
	if self.areamybuybillarea.set_data_id then
		self.areamybuybillarea:set_data_id(data)
	end
				
end


mybuybillFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamybuybillarea.set_data then
		self.areamybuybillarea:set_data(data)
	end
			
end




mybuybillFrame.on_show = function(self)
			
	if self.areamybuybillarea.on_show then
		self.areamybuybillarea:on_show()
	end
			
end


mybuybillFrame.on_hide = function(self)
			
	if self.areamybuybillarea.on_hide then
		self.areamybuybillarea:on_hide()
	end		
			
end

	


	