
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_minjieyingshi")

discoverFrame = inherit(GmBase.FrameBase):name("discoverFrame")

discoverFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_discover"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areadiscoverarea
	self.areadiscoverarea = gm_minjieyingshi.discoverareaArea(self)
	
	if self.areadiscoverarea.set then
		
		self.areadiscoverarea:set('fid','91')
		
		self.areadiscoverarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_minjieyingshi.mainmenuArea(self)
	
		if self.areanav.set_title then
			self.areanav:set_title('发现')
		elseif self.areanav.set then
			self.areanav:set('title','发现')
		end
					
	
	self.mainarea = self.areadiscoverarea
	
	self:set_style('display:none')

	
end


discoverFrame.set_data_id = function(self,data)
	
	if self.areadiscoverarea.set_data_id then
		self.areadiscoverarea:set_data_id(data)
	end
				
end


discoverFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areadiscoverarea.set_data then
		self.areadiscoverarea:set_data(data)
	end
			
end




discoverFrame.on_show = function(self)
			
	if self.areadiscoverarea.on_show then
		self.areadiscoverarea:on_show()
	end
			
end


discoverFrame.on_hide = function(self)
			
	if self.areadiscoverarea.on_hide then
		self.areadiscoverarea:on_hide()
	end		
			
end

	


	