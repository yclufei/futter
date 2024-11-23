
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainfirstFrame = inherit(GmBase.FrameBase):name("mainfirstFrame")

mainfirstFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mainfirst"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areamainfirstarea
	self.areamainfirstarea = gm_xinbanchunzhongyun.mainfirstareaArea(self)
	
	if self.areamainfirstarea.set then
				
	end
	
		if self.areamainfirstarea.set_title then
			self.areamainfirstarea:set_title('概述')
		elseif self.areamainfirstarea.set then
			self.areamainfirstarea:set('title','概述')
		end
					
	
	self.mainarea = self.areamainfirstarea
	
	self:set_style('display:none')

	
end


mainfirstFrame.set_data_id = function(self,data)
	
	if self.areamainfirstarea.set_data_id then
		self.areamainfirstarea:set_data_id(data)
	end
				
end


mainfirstFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamainfirstarea.set_data then
		self.areamainfirstarea:set_data(data)
	end
			
end




mainfirstFrame.on_show = function(self)
			
	if self.areamainfirstarea.on_show then
		self.areamainfirstarea:on_show()
	end
			
end


mainfirstFrame.on_hide = function(self)
			
	if self.areamainfirstarea.on_hide then
		self.areamainfirstarea:on_hide()
	end		
			
end

	


	