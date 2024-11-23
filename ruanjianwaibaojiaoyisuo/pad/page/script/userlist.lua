
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

userlistFrame = inherit(GmBase.FrameBase):name("userlistFrame")

userlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_userlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areauserlistarea
	self.areauserlistarea = gm_ruanjianwaibaojiaoyisuo.userlistareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('userlist')
		elseif self.areanav.set then
			self.areanav:set('title','userlist')
		end
					
	
	self.mainarea = self.areauserlistarea
	
	self:set_style('display:none')

	
end


userlistFrame.set_data_id = function(self,data)
	
	if self.areauserlistarea.set_data_id then
		self.areauserlistarea:set_data_id(data)
	end
				
end


userlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauserlistarea.set_data then
		self.areauserlistarea:set_data(data)
	end
			
end




userlistFrame.on_show = function(self)
			
	if self.areauserlistarea.on_show then
		self.areauserlistarea:on_show()
	end
			
end


userlistFrame.on_hide = function(self)
			
	if self.areauserlistarea.on_hide then
		self.areauserlistarea:on_hide()
	end		
			
end

	


	