
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

playerFrame = inherit(GmBase.FrameBase):name("playerFrame")

playerFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_player"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areaplayerarea
	self.areaplayerarea = gm_minjieyingshi.playerareaArea(self)
	
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
			self.areanav:set_title('播放')
		elseif self.areanav.set then
			self.areanav:set('title','播放')
		end
					
	
	self.mainarea = self.areaplayerarea
	
	self:set_style('display:none')

	
end


playerFrame.set_data_id = function(self,data)
	
	if self.areaplayerarea.set_data_id then
		self.areaplayerarea:set_data_id(data)
	end
				
end


playerFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaplayerarea.set_data then
		self.areaplayerarea:set_data(data)
	end
			
end




playerFrame.on_show = function(self)
			
	if self.areaplayerarea.on_show then
		self.areaplayerarea:on_show()
	end
			
end


playerFrame.on_hide = function(self)
			
	if self.areaplayerarea.on_hide then
		self.areaplayerarea:on_hide()
	end		
			
end

	


	