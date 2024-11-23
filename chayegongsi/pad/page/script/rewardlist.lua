
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

rewardlistFrame = inherit(GmBase.FrameBase):name("rewardlistFrame")

rewardlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearewardlistarea
	self.arearewardlistarea = gm_chayegongsi.rewardlistareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('rewardlist')
		elseif self.areanav.set then
			self.areanav:set('title','rewardlist')
		end
					
	
	self.mainarea = self.arearewardlistarea
	
	self:set_style('display:none')

	
end


rewardlistFrame.set_data_id = function(self,data)
	
	if self.arearewardlistarea.set_data_id then
		self.arearewardlistarea:set_data_id(data)
	end
				
end


rewardlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardlistarea.set_data then
		self.arearewardlistarea:set_data(data)
	end
			
end




rewardlistFrame.on_show = function(self)
			
	if self.arearewardlistarea.on_show then
		self.arearewardlistarea:on_show()
	end
			
end


rewardlistFrame.on_hide = function(self)
			
	if self.arearewardlistarea.on_hide then
		self.arearewardlistarea:on_hide()
	end		
			
end

	


	