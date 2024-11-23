
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

systemsettingFrame = inherit(GmBase.FrameBase):name("systemsettingFrame")

systemsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_systemsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areasystemsettingarea
	self.areasystemsettingarea = gm_xinbanchunzhongyun.systemsettingareaArea(self)
	
	if self.areasystemsettingarea.set then
				
	end
	
		if self.areasystemsettingarea.set_title then
			self.areasystemsettingarea:set_title('系统设置')
		elseif self.areasystemsettingarea.set then
			self.areasystemsettingarea:set('title','系统设置')
		end
					
	
	self.mainarea = self.areasystemsettingarea
	
	self:set_style('display:none')

	
end


systemsettingFrame.set_data_id = function(self,data)
	
	if self.areasystemsettingarea.set_data_id then
		self.areasystemsettingarea:set_data_id(data)
	end
				
end


systemsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areasystemsettingarea.set_data then
		self.areasystemsettingarea:set_data(data)
	end
			
end




systemsettingFrame.on_show = function(self)
			
	if self.areasystemsettingarea.on_show then
		self.areasystemsettingarea:on_show()
	end
			
end


systemsettingFrame.on_hide = function(self)
			
	if self.areasystemsettingarea.on_hide then
		self.areasystemsettingarea:on_hide()
	end		
			
end

	


	