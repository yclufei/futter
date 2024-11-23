
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardreplyaddFrame = inherit(GmBase.FrameBase):name("rewardreplyaddFrame")

rewardreplyaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardreplyadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- arearewardreplyaddarea
	self.arearewardreplyaddarea = gm_ruanjianwaibaojiaoyisuo.rewardreplyaddareaArea(self)
	
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
			self.areanav:set_title('投标')
		elseif self.areanav.set then
			self.areanav:set('title','投标')
		end
					
	
	self.mainarea = self.arearewardreplyaddarea
	
	self:set_style('display:none')

	
end


rewardreplyaddFrame.set_data_id = function(self,data)
	
	if self.arearewardreplyaddarea.set_data_id then
		self.arearewardreplyaddarea:set_data_id(data)
	end
				
end


rewardreplyaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardreplyaddarea.set_data then
		self.arearewardreplyaddarea:set_data(data)
	end
			
end




rewardreplyaddFrame.on_show = function(self)
			
	if self.arearewardreplyaddarea.on_show then
		self.arearewardreplyaddarea:on_show()
	end
			
end


rewardreplyaddFrame.on_hide = function(self)
			
	if self.arearewardreplyaddarea.on_hide then
		self.arearewardreplyaddarea:on_hide()
	end		
			
end

	


	