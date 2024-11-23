
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

videoaddFrame = inherit(GmBase.FrameBase):name("videoaddFrame")

videoaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_videoadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areavideoaddarea
	self.areavideoaddarea = gm_minjieyingshi.videoaddareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('videoadd')
		elseif self.areanav.set then
			self.areanav:set('title','videoadd')
		end
					
	
	self.mainarea = self.areavideoaddarea
	
	self:set_style('display:none')

	
end


videoaddFrame.set_data_id = function(self,data)
	
	if self.areavideoaddarea.set_data_id then
		self.areavideoaddarea:set_data_id(data)
	end
				
end


videoaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areavideoaddarea.set_data then
		self.areavideoaddarea:set_data(data)
	end
			
end




videoaddFrame.on_show = function(self)
			
	if self.areavideoaddarea.on_show then
		self.areavideoaddarea:on_show()
	end
			
end


videoaddFrame.on_hide = function(self)
			
	if self.areavideoaddarea.on_hide then
		self.areavideoaddarea:on_hide()
	end		
			
end

	


	