
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

urscenter2Frame = inherit(GmBase.FrameBase):name("urscenter2Frame")

urscenter2Frame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_urscenter2"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaurscenter2area
	self.areaurscenter2area = gm_chayegongsi.urscenter2areaArea(self)
	
	if self.areaurscenter2area.set then
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_chayegongsi.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	
	self.mainarea = self.areaurscenter2area
	
	self:set_style('display:none')

	
end


urscenter2Frame.set_data_id = function(self,data)
	
	if self.areaurscenter2area.set_data_id then
		self.areaurscenter2area:set_data_id(data)
	end
				
end


urscenter2Frame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaurscenter2area.set_data then
		self.areaurscenter2area:set_data(data)
	end
			
end




urscenter2Frame.on_show = function(self)
			
	if self.areaurscenter2area.on_show then
		self.areaurscenter2area:on_show()
	end
			
end


urscenter2Frame.on_hide = function(self)
			
	if self.areaurscenter2area.on_hide then
		self.areaurscenter2area:on_hide()
	end		
			
end

	


	