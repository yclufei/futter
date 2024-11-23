
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

urscenterFrame = inherit(GmBase.FrameBase):name("urscenterFrame")

urscenterFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_urscenter"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaurscenterarea
	self.areaurscenterarea = gm_minjieyingshi.urscenterareaArea(self)
	
	-- areamainmenu
	self.areamainmenu = gm_minjieyingshi.mainmenuArea(self)
	
	
	self.mainarea = self.areaurscenterarea
	
	self:set_style('display:none')

	
end


urscenterFrame.set_data_id = function(self,data)
	
	if self.areaurscenterarea.set_data_id then
		self.areaurscenterarea:set_data_id(data)
	end
				
end


urscenterFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaurscenterarea.set_data then
		self.areaurscenterarea:set_data(data)
	end
			
end




urscenterFrame.on_show = function(self)
			
	if self.areaurscenterarea.on_show then
		self.areaurscenterarea:on_show()
	end
			
end


urscenterFrame.on_hide = function(self)
			
	if self.areaurscenterarea.on_hide then
		self.areaurscenterarea:on_hide()
	end		
			
end

	


	