
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_minjieyingshi")

videomodifyFrame = inherit(GmBase.FrameBase):name("videomodifyFrame")

videomodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_videomodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areavideomodifyarea
	self.areavideomodifyarea = gm_minjieyingshi.videomodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('videomodify')
		elseif self.areanav.set then
			self.areanav:set('title','videomodify')
		end
					
	
	self.mainarea = self.areavideomodifyarea
	
	self:set_style('display:none')

	
end


videomodifyFrame.set_data_id = function(self,data)
	
	if self.areavideomodifyarea.set_data_id then
		self.areavideomodifyarea:set_data_id(data)
	end
				
end


videomodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areavideomodifyarea.set_data then
		self.areavideomodifyarea:set_data(data)
	end
			
end




videomodifyFrame.on_show = function(self)
			
	if self.areavideomodifyarea.on_show then
		self.areavideomodifyarea:on_show()
	end
			
end


videomodifyFrame.on_hide = function(self)
			
	if self.areavideomodifyarea.on_hide then
		self.areavideomodifyarea:on_hide()
	end		
			
end

	


	