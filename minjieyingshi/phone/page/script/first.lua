
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

firstFrame = inherit(GmBase.FrameBase):name("firstFrame")

firstFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_first"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areafirstarea
	self.areafirstarea = gm_minjieyingshi.firstareaArea(self)
	
	if self.areafirstarea.set then
		
		self.areafirstarea:set('fid','2')
		
		self.areafirstarea:set('fid','2')
		
		self.areafirstarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_minjieyingshi.mainmenuArea(self)
	
	
	self.mainarea = self.areafirstarea

	
end


firstFrame.set_data_id = function(self,data)
	
	if self.areafirstarea.set_data_id then
		self.areafirstarea:set_data_id(data)
	end
				
end


firstFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areafirstarea.set_data then
		self.areafirstarea:set_data(data)
	end
			
end




firstFrame.on_show = function(self)
			
	if self.areafirstarea.on_show then
		self.areafirstarea:on_show()
	end
			
end


firstFrame.on_hide = function(self)
			
	if self.areafirstarea.on_hide then
		self.areafirstarea:on_hide()
	end		
			
end

	


	