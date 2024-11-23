
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

videolistFrame = inherit(GmBase.FrameBase):name("videolistFrame")

videolistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_videolist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areavideolistarea
	self.areavideolistarea = gm_minjieyingshi.videolistareaArea(self)
	
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
			self.areanav:set_title('仓库')
		elseif self.areanav.set then
			self.areanav:set('title','仓库')
		end
					
	
	self.mainarea = self.areavideolistarea
	
	self:set_style('display:none')

	
end


videolistFrame.set_data_id = function(self,data)
	
	if self.areavideolistarea.set_data_id then
		self.areavideolistarea:set_data_id(data)
	end
				
end


videolistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areavideolistarea.set_data then
		self.areavideolistarea:set_data(data)
	end
			
end




videolistFrame.on_show = function(self)
			
	if self.areavideolistarea.on_show then
		self.areavideolistarea:on_show()
	end
			
end


videolistFrame.on_hide = function(self)
			
	if self.areavideolistarea.on_hide then
		self.areavideolistarea:on_hide()
	end		
			
end

	


	