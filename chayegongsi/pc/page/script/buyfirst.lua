
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

buyfirstFrame = inherit(GmBase.FrameBase):name("buyfirstFrame")

buyfirstFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_buyfirst"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areabuyfirstarea
	self.areabuyfirstarea = gm_chayegongsi.buyfirstareaArea(self)
	
	if self.areabuyfirstarea.set then
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_chayegongsi.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	
	self.mainarea = self.areabuyfirstarea
	
	self:set_style('display:none')

	
end


buyfirstFrame.set_data_id = function(self,data)
	
	if self.areabuyfirstarea.set_data_id then
		self.areabuyfirstarea:set_data_id(data)
	end
				
end


buyfirstFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areabuyfirstarea.set_data then
		self.areabuyfirstarea:set_data(data)
	end
			
end




buyfirstFrame.on_show = function(self)
			
	if self.areabuyfirstarea.on_show then
		self.areabuyfirstarea:on_show()
	end
			
end


buyfirstFrame.on_hide = function(self)
			
	if self.areabuyfirstarea.on_hide then
		self.areabuyfirstarea:on_hide()
	end		
			
end

	


	