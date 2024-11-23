
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

rewardaddFrame = inherit(GmBase.FrameBase):name("rewardaddFrame")

rewardaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearewardaddarea
	self.arearewardaddarea = gm_chayegongsi.rewardaddareaArea(self)
	
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
			self.areanav:set_title('rewardadd')
		elseif self.areanav.set then
			self.areanav:set('title','rewardadd')
		end
					
	
	self.mainarea = self.arearewardaddarea
	
	self:set_style('display:none')

	
end


rewardaddFrame.set_data_id = function(self,data)
	
	if self.arearewardaddarea.set_data_id then
		self.arearewardaddarea:set_data_id(data)
	end
				
end


rewardaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardaddarea.set_data then
		self.arearewardaddarea:set_data(data)
	end
			
end




rewardaddFrame.on_show = function(self)
			
	if self.arearewardaddarea.on_show then
		self.arearewardaddarea:on_show()
	end
			
end


rewardaddFrame.on_hide = function(self)
			
	if self.arearewardaddarea.on_hide then
		self.arearewardaddarea:on_hide()
	end		
			
end

	


	