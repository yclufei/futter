
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

firstFrame = inherit(GmBase.FrameBase):name("firstFrame")

firstFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_first"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areafirstarea
	self.areafirstarea = gm_ruanjianwaibaojiaoyisuo.firstareaArea(self)
	
	if self.areafirstarea.set then
		
		self.areafirstarea:set('fid','2')
		
		self.areafirstarea:set('fid','2')
		
		self.areafirstarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)
	
	self.areamainmenu:set_index(1)
	
	
	self.mainarea = self.areafirstarea
	
	self:set_style('display:none')

	
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




firstFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


firstFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end

	


	