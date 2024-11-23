
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

favoriteFrame = inherit(GmBase.FrameBase):name("favoriteFrame")

favoriteFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_favorite"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areafavoritearea
	self.areafavoritearea = gm_ruanjianwaibaojiaoyisuo.favoriteareaArea(self)
	
	if self.areafavoritearea.set then
				
	end
	
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
			self.areanav:set_title('我的收藏')
		elseif self.areanav.set then
			self.areanav:set('title','我的收藏')
		end
					
	
	self.mainarea = self.areafavoritearea
	
	self:set_style('display:none')

	
end


favoriteFrame.set_data_id = function(self,data)
	
	if self.areafavoritearea.set_data_id then
		self.areafavoritearea:set_data_id(data)
	end
				
end


favoriteFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areafavoritearea.set_data then
		self.areafavoritearea:set_data(data)
	end
			
end




favoriteFrame.on_show = function(self)
			
	if self.areafavoritearea.on_show then
		self.areafavoritearea:on_show()
	end
			
end


favoriteFrame.on_hide = function(self)
			
	if self.areafavoritearea.on_hide then
		self.areafavoritearea:on_hide()
	end		
			
end

	


	