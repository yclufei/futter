
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

rewardreplylistFrame = inherit(GmBase.FrameBase):name("rewardreplylistFrame")

rewardreplylistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardreplylist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearewardreplylistarea
	self.arearewardreplylistarea = gm_chayegongsi.rewardreplylistareaArea(self)
	
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
			self.areanav:set_title('rewardreplylist')
		elseif self.areanav.set then
			self.areanav:set('title','rewardreplylist')
		end
					
	
	self.mainarea = self.arearewardreplylistarea
	
	self:set_style('display:none')

	
end


rewardreplylistFrame.set_data_id = function(self,data)
	
	if self.arearewardreplylistarea.set_data_id then
		self.arearewardreplylistarea:set_data_id(data)
	end
				
end


rewardreplylistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardreplylistarea.set_data then
		self.arearewardreplylistarea:set_data(data)
	end
			
end




rewardreplylistFrame.on_show = function(self)
			
	if self.arearewardreplylistarea.on_show then
		self.arearewardreplylistarea:on_show()
	end
			
end


rewardreplylistFrame.on_hide = function(self)
			
	if self.arearewardreplylistarea.on_hide then
		self.arearewardreplylistarea:on_hide()
	end		
			
end

	


	