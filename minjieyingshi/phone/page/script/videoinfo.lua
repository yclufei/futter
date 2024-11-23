
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

videoinfoFrame = inherit(GmBase.FrameBase):name("videoinfoFrame")

videoinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_videoinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areavideoinfoarea
	self.areavideoinfoarea = gm_minjieyingshi.videoinfoareaArea(self)
	
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
			self.areanav:set_title('影片详情')
		elseif self.areanav.set then
			self.areanav:set('title','影片详情')
		end
					
	
	self.mainarea = self.areavideoinfoarea
	
	self:set_style('display:none')

	
end


videoinfoFrame.set_data_id = function(self,data)
	
	if self.areavideoinfoarea.set_data_id then
		self.areavideoinfoarea:set_data_id(data)
	end
				
end


videoinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areavideoinfoarea.set_data then
		self.areavideoinfoarea:set_data(data)
	end
			
end




videoinfoFrame.on_show = function(self)
			
	if self.areavideoinfoarea.on_show then
		self.areavideoinfoarea:on_show()
	end
			
end


videoinfoFrame.on_hide = function(self)
			
	if self.areavideoinfoarea.on_hide then
		self.areavideoinfoarea:on_hide()
	end		
			
end

	


	