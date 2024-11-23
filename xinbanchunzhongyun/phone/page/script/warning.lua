
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

warningFrame = inherit(GmBase.FrameBase):name("warningFrame")

warningFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_warning"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areawarningarea
	self.areawarningarea = gm_xinbanchunzhongyun.warningareaArea(self)
	
	if self.areawarningarea.set then
				
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
			self.areanav:set_title('预警消息')
		elseif self.areanav.set then
			self.areanav:set('title','预警消息')
		end
					
		if self.areawarningarea.set_title then
			self.areawarningarea:set_title('预警消息')
		elseif self.areawarningarea.set then
			self.areawarningarea:set('title','预警消息')
		end
					
	
	self.mainarea = self.areawarningarea
	
	self:set_style('display:none')

	
end


warningFrame.set_data_id = function(self,data)
	
	if self.areawarningarea.set_data_id then
		self.areawarningarea:set_data_id(data)
	end
				
end


warningFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areawarningarea.set_data then
		self.areawarningarea:set_data(data)
	end
			
end




warningFrame.on_show = function(self)
			
	if self.areawarningarea.on_show then
		self.areawarningarea:on_show()
	end
			
end


warningFrame.on_hide = function(self)
			
	if self.areawarningarea.on_hide then
		self.areawarningarea:on_hide()
	end		
			
end

	


	