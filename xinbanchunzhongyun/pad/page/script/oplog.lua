
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

oplogFrame = inherit(GmBase.FrameBase):name("oplogFrame")

oplogFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_oplog"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaoplogarea
	self.areaoplogarea = gm_xinbanchunzhongyun.oplogareaArea(self)
	
	if self.areaoplogarea.set then
				
	end
	
		if self.areaoplogarea.set_title then
			self.areaoplogarea:set_title('操作日志')
		elseif self.areaoplogarea.set then
			self.areaoplogarea:set('title','操作日志')
		end
					
	
	self.mainarea = self.areaoplogarea
	
	self:set_style('display:none')

	
end


oplogFrame.set_data_id = function(self,data)
	
	if self.areaoplogarea.set_data_id then
		self.areaoplogarea:set_data_id(data)
	end
				
end


oplogFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaoplogarea.set_data then
		self.areaoplogarea:set_data(data)
	end
			
end




oplogFrame.on_show = function(self)
			
	if self.areaoplogarea.on_show then
		self.areaoplogarea:on_show()
	end
			
end


oplogFrame.on_hide = function(self)
			
	if self.areaoplogarea.on_hide then
		self.areaoplogarea:on_hide()
	end		
			
end

	


	