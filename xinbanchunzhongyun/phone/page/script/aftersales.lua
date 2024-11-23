
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

aftersalesFrame = inherit(GmBase.FrameBase):name("aftersalesFrame")

aftersalesFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_aftersales"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaaftersalesarea
	self.areaaftersalesarea = gm_xinbanchunzhongyun.aftersalesareaArea(self)
	
	if self.areaaftersalesarea.set then
				
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
			self.areanav:set_title('售后部门')
		elseif self.areanav.set then
			self.areanav:set('title','售后部门')
		end
					
		if self.areaaftersalesarea.set_title then
			self.areaaftersalesarea:set_title('售后部门')
		elseif self.areaaftersalesarea.set then
			self.areaaftersalesarea:set('title','售后部门')
		end
					
	
	self.mainarea = self.areaaftersalesarea
	
	self:set_style('display:none')

	
end


aftersalesFrame.set_data_id = function(self,data)
	
	if self.areaaftersalesarea.set_data_id then
		self.areaaftersalesarea:set_data_id(data)
	end
				
end


aftersalesFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaaftersalesarea.set_data then
		self.areaaftersalesarea:set_data(data)
	end
			
end




aftersalesFrame.on_show = function(self)
			
	if self.areaaftersalesarea.on_show then
		self.areaaftersalesarea:on_show()
	end
			
end


aftersalesFrame.on_hide = function(self)
			
	if self.areaaftersalesarea.on_hide then
		self.areaaftersalesarea:on_hide()
	end		
			
end

	


	