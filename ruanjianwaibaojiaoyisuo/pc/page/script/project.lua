
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

projectFrame = inherit(GmBase.FrameBase):name("projectFrame")

projectFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_project"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaprojectarea
	self.areaprojectarea = gm_ruanjianwaibaojiaoyisuo.projectareaArea(self)
	
	if self.areaprojectarea.set then
		
		self.areaprojectarea:set('fid','93')
		
		self.areaprojectarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
		if self.areaprojectarea.set_closed then
			self.areaprojectarea:set_closed('0')
		elseif self.areaprojectarea.set then
			self.areaprojectarea:set('closed','0')
		end
					
		if self.areaprojectarea.set_fid then
			self.areaprojectarea:set_fid('93')
		elseif self.areaprojectarea.set then
			self.areaprojectarea:set('fid','93')
		end
					
	
	self.mainarea = self.areaprojectarea
	
	self:set_style('display:none')

	
end


projectFrame.set_data_id = function(self,data)
	
	if self.areaprojectarea.set_data_id then
		self.areaprojectarea:set_data_id(data)
	end
				
end


projectFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaprojectarea.set_data then
		self.areaprojectarea:set_data(data)
	end
			
end




projectFrame.on_show = function(self)
			
	if self.areaprojectarea.on_show then
		self.areaprojectarea:on_show()
	end
			
end


projectFrame.on_hide = function(self)
			
	if self.areaprojectarea.on_hide then
		self.areaprojectarea:on_hide()
	end		
			
end

	


	