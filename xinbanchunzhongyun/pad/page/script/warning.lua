
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

warningFrame = inherit(GmBase.FrameBase):name("warningFrame")

warningFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_warning"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areawarningarea
	self.areawarningarea = gm_xinbanchunzhongyun.warningareaArea(self)
	
	if self.areawarningarea.set then
				
	end
	
		if self.areawarningarea.set_title then
			self.areawarningarea:set_title('预警消息')
		elseif self.areawarningarea.set then
			self.areawarningarea:set('title','预警消息')
		end
					
	
	self.mainarea = self.areawarningarea
	
	self:set_style('display:none')

	
end


warningFrame.set_data_id = function(self,data)
	
	if self.areawarningarea.set_data_id then
		self.areawarningarea:set_data_id(data)
	end
				
end


warningFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areawarningarea.set_data then
		self.areawarningarea:set_data(data)
	end
			
end




warningFrame.on_show = function(self)
			
	if self.areawarningarea.on_show then
		self.areawarningarea:on_show()
	end
			
end


warningFrame.on_hide = function(self)
			
	if self.areawarningarea.on_hide then
		self.areawarningarea:on_hide()
	end		
			
end

	


	