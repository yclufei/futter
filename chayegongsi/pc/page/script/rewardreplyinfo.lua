
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

rewardreplyinfoFrame = inherit(GmBase.FrameBase):name("rewardreplyinfoFrame")

rewardreplyinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardreplyinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearewardreplyinfoarea
	self.arearewardreplyinfoarea = gm_chayegongsi.rewardreplyinfoareaArea(self)
	
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
			self.areanav:set_title('rewardreplyinfo')
		elseif self.areanav.set then
			self.areanav:set('title','rewardreplyinfo')
		end
					
	
	self.mainarea = self.arearewardreplyinfoarea
	
	self:set_style('display:none')

	
end


rewardreplyinfoFrame.set_data_id = function(self,data)
	
	if self.arearewardreplyinfoarea.set_data_id then
		self.arearewardreplyinfoarea:set_data_id(data)
	end
				
end


rewardreplyinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardreplyinfoarea.set_data then
		self.arearewardreplyinfoarea:set_data(data)
	end
			
end




rewardreplyinfoFrame.on_show = function(self)
			
	if self.arearewardreplyinfoarea.on_show then
		self.arearewardreplyinfoarea:on_show()
	end
			
end


rewardreplyinfoFrame.on_hide = function(self)
			
	if self.arearewardreplyinfoarea.on_hide then
		self.arearewardreplyinfoarea:on_hide()
	end		
			
end

	


	