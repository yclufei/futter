
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

first2Frame = inherit(GmBase.FrameBase):name("first2Frame")

first2Frame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_first2"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areafirst2area
	self.areafirst2area = gm_chayegongsi.first2areaArea(self)
	
	if self.areafirst2area.set then
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_chayegongsi.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	
	self.mainarea = self.areafirst2area
	
	self:set_style('display:none')

	
end


first2Frame.set_data_id = function(self,data)
	
	if self.areafirst2area.set_data_id then
		self.areafirst2area:set_data_id(data)
	end
				
end


first2Frame.set_data = function(self,data)

	self.data = data
	
	
	if self.areafirst2area.set_data then
		self.areafirst2area:set_data(data)
	end
			
end




first2Frame.on_show = function(self)
			
	if self.areafirst2area.on_show then
		self.areafirst2area:on_show()
	end
			
end


first2Frame.on_hide = function(self)
			
	if self.areafirst2area.on_hide then
		self.areafirst2area:on_hide()
	end		
			
end

	


	