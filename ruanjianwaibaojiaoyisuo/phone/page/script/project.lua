
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

projectFrame = inherit(GmBase.FrameBase):name("projectFrame")

projectFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_project"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.projectareaArea(self)
	
	if self.mainarea.set then
		
		self.mainarea:set('fid','93')
		
		self.mainarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)
	self.areamainmenu:set_index(2)

	if self.mainarea.set_closed then
		self.mainarea:set_closed('0')
	elseif self.mainarea.set then
		self.mainarea:set('closed','0')
	end
				
	if self.mainarea.set_fid then
		self.mainarea:set_fid('93')
	elseif self.mainarea.set then
		self.mainarea:set('fid','93')
	end
				
					
	self:set_style('display:none')

	
end


projectFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


projectFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




projectFrame.on_show = function(self)
			
	if self.mainarea.on_show then
		self.mainarea:on_show()
	end
			
end


projectFrame.on_hide = function(self)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide()
	end		
			
end

	


	