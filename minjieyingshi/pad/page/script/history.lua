
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_minjieyingshi")

historyFrame = inherit(GmBase.FrameBase):name("historyFrame")

historyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_history"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areahistoryarea
	self.areahistoryarea = gm_minjieyingshi.historyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('历史')
		elseif self.areanav.set then
			self.areanav:set('title','历史')
		end
					
	
	self.mainarea = self.areahistoryarea
	
	self:set_style('display:none')

	
end


historyFrame.set_data_id = function(self,data)
	
	if self.areahistoryarea.set_data_id then
		self.areahistoryarea:set_data_id(data)
	end
				
end


historyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areahistoryarea.set_data then
		self.areahistoryarea:set_data(data)
	end
			
end




historyFrame.on_show = function(self)
			
	if self.areahistoryarea.on_show then
		self.areahistoryarea:on_show()
	end
			
end


historyFrame.on_hide = function(self)
			
	if self.areahistoryarea.on_hide then
		self.areahistoryarea:on_hide()
	end		
			
end

	


	