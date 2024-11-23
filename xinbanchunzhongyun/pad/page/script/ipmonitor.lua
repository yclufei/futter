
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

ipmonitorFrame = inherit(GmBase.FrameBase):name("ipmonitorFrame")

ipmonitorFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ipmonitor"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaipmonitorarea
	self.areaipmonitorarea = gm_xinbanchunzhongyun.ipmonitorareaArea(self)
	
	if self.areaipmonitorarea.set then
				
	end
	
		if self.areaipmonitorarea.set_title then
			self.areaipmonitorarea:set_title('登录IP监控')
		elseif self.areaipmonitorarea.set then
			self.areaipmonitorarea:set('title','登录IP监控')
		end
					
	
	self.mainarea = self.areaipmonitorarea
	
	self:set_style('display:none')

	
end


ipmonitorFrame.set_data_id = function(self,data)
	
	if self.areaipmonitorarea.set_data_id then
		self.areaipmonitorarea:set_data_id(data)
	end
				
end


ipmonitorFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaipmonitorarea.set_data then
		self.areaipmonitorarea:set_data(data)
	end
			
end




ipmonitorFrame.on_show = function(self)
			
	if self.areaipmonitorarea.on_show then
		self.areaipmonitorarea:on_show()
	end
			
end


ipmonitorFrame.on_hide = function(self)
			
	if self.areaipmonitorarea.on_hide then
		self.areaipmonitorarea:on_hide()
	end		
			
end

	


	