
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

userinfoFrame = inherit(GmBase.FrameBase):name("userinfoFrame")

userinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_userinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areauserinfoarea
	self.areauserinfoarea = gm_minjieyingshi.userinfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('userinfo')
		elseif self.areanav.set then
			self.areanav:set('title','userinfo')
		end
					
	
	self.mainarea = self.areauserinfoarea
	
	self:set_style('display:none')

	
end


userinfoFrame.set_data_id = function(self,data)
	
	if self.areauserinfoarea.set_data_id then
		self.areauserinfoarea:set_data_id(data)
	end
				
end


userinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauserinfoarea.set_data then
		self.areauserinfoarea:set_data(data)
	end
			
end




userinfoFrame.on_show = function(self)
			
	if self.areauserinfoarea.on_show then
		self.areauserinfoarea:on_show()
	end
			
end


userinfoFrame.on_hide = function(self)
			
	if self.areauserinfoarea.on_hide then
		self.areauserinfoarea:on_hide()
	end		
			
end

	


	