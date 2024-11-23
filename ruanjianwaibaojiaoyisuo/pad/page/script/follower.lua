
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

followerFrame = inherit(GmBase.FrameBase):name("followerFrame")

followerFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_follower"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areafollowerarea
	self.areafollowerarea = gm_ruanjianwaibaojiaoyisuo.followerareaArea(self)
	
	if self.areafollowerarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('粉丝')
		elseif self.areanav.set then
			self.areanav:set('title','粉丝')
		end
					
	
	self.mainarea = self.areafollowerarea
	
	self:set_style('display:none')

	
end


followerFrame.set_data_id = function(self,data)
	
	if self.areafollowerarea.set_data_id then
		self.areafollowerarea:set_data_id(data)
	end
				
end


followerFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areafollowerarea.set_data then
		self.areafollowerarea:set_data(data)
	end
			
end




followerFrame.on_show = function(self)
			
	if self.areafollowerarea.on_show then
		self.areafollowerarea:on_show()
	end
			
end


followerFrame.on_hide = function(self)
			
	if self.areafollowerarea.on_hide then
		self.areafollowerarea:on_hide()
	end		
			
end

	


	