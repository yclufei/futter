
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

ranklistinfoFrame = inherit(GmBase.FrameBase):name("ranklistinfoFrame")

ranklistinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ranklistinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearanklistinfoarea
	self.arearanklistinfoarea = gm_chayegongsi.ranklistinfoareaArea(self)
	
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
			self.areanav:set_title('ranklistinfo')
		elseif self.areanav.set then
			self.areanav:set('title','ranklistinfo')
		end
					
	
	self.mainarea = self.arearanklistinfoarea
	
	self:set_style('display:none')

	
end


ranklistinfoFrame.set_data_id = function(self,data)
	
	if self.arearanklistinfoarea.set_data_id then
		self.arearanklistinfoarea:set_data_id(data)
	end
				
end


ranklistinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearanklistinfoarea.set_data then
		self.arearanklistinfoarea:set_data(data)
	end
			
end




ranklistinfoFrame.on_show = function(self)
			
	if self.arearanklistinfoarea.on_show then
		self.arearanklistinfoarea:on_show()
	end
			
end


ranklistinfoFrame.on_hide = function(self)
			
	if self.arearanklistinfoarea.on_hide then
		self.arearanklistinfoarea:on_hide()
	end		
			
end

	


	