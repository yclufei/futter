
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

followingFrame = inherit(GmBase.FrameBase):name("followingFrame")

followingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_following"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areafollowingarea
	self.areafollowingarea = gm_ruanjianwaibaojiaoyisuo.followingareaArea(self)
	
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
			self.areanav:set_title('关注')
		elseif self.areanav.set then
			self.areanav:set('title','关注')
		end
					
	
	self.mainarea = self.areafollowingarea
	
	self:set_style('display:none')

	
end


followingFrame.set_data_id = function(self,data)
	
	if self.areafollowingarea.set_data_id then
		self.areafollowingarea:set_data_id(data)
	end
				
end


followingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areafollowingarea.set_data then
		self.areafollowingarea:set_data(data)
	end
			
end




followingFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


followingFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end



	