
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

remotesettingFrame = inherit(GmBase.FrameBase):name("remotesettingFrame")

remotesettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_remotesetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- arearemotesettingarea
	self.arearemotesettingarea = gm_xinbanchunzhongyun.remotesettingareaArea(self)
	
	if self.arearemotesettingarea.set then
				
	end
	
		if self.arearemotesettingarea.set_title then
			self.arearemotesettingarea:set_title('远程设置')
		elseif self.arearemotesettingarea.set then
			self.arearemotesettingarea:set('title','远程设置')
		end
					
	
	self.mainarea = self.arearemotesettingarea
	
	self:set_style('display:none')

	
end


remotesettingFrame.set_data_id = function(self,data)
	
	if self.arearemotesettingarea.set_data_id then
		self.arearemotesettingarea:set_data_id(data)
	end
				
end


remotesettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.arearemotesettingarea.set_data then
		self.arearemotesettingarea:set_data(data)
	end
			
end




remotesettingFrame.on_show = function(self)
			
	if self.arearemotesettingarea.on_show then
		self.arearemotesettingarea:on_show()
	end
			
end


remotesettingFrame.on_hide = function(self)
			
	if self.arearemotesettingarea.on_hide then
		self.arearemotesettingarea:on_hide()
	end		
			
end

	


	