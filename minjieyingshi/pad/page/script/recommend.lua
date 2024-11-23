
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_minjieyingshi")

recommendFrame = inherit(GmBase.FrameBase):name("recommendFrame")

recommendFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_recommend"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- arearecommendarea
	self.arearecommendarea = gm_minjieyingshi.recommendareaArea(self)
	
	-- areamainmenu
	self.areamainmenu = gm_minjieyingshi.mainmenuArea(self)
	
		if self.arearecommendarea.set_closed then
			self.arearecommendarea:set_closed('0')
		elseif self.arearecommendarea.set then
			self.arearecommendarea:set('closed','0')
		end
					
		if self.arearecommendarea.set_fid then
			self.arearecommendarea:set_fid('2')
		elseif self.arearecommendarea.set then
			self.arearecommendarea:set('fid','2')
		end
					
	
	self.mainarea = self.arearecommendarea
	
	self:set_style('display:none')

	
end


recommendFrame.set_data_id = function(self,data)
	
	if self.arearecommendarea.set_data_id then
		self.arearecommendarea:set_data_id(data)
	end
				
end


recommendFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.arearecommendarea.set_data then
		self.arearecommendarea:set_data(data)
	end
			
end




recommendFrame.on_show = function(self)
			
	if self.arearecommendarea.on_show then
		self.arearecommendarea:on_show()
	end
			
end


recommendFrame.on_hide = function(self)
			
	if self.arearecommendarea.on_hide then
		self.arearecommendarea:on_hide()
	end		
			
end

	


	