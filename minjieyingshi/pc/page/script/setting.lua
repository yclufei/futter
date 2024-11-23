
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

settingFrame = inherit(GmBase.FrameBase):name("settingFrame")

settingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_setting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areasettingarea
	self.areasettingarea = gm_minjieyingshi.settingareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('设置')
		elseif self.areanav.set then
			self.areanav:set('title','设置')
		end
					
		if self.areasettingarea.set_title then
			self.areasettingarea:set_title('用户')
		elseif self.areasettingarea.set then
			self.areasettingarea:set('title','用户')
		end
					
	
	self.mainarea = self.areasettingarea
	
	self:set_style('display:none')

	
end


settingFrame.set_data_id = function(self,data)
	
	if self.areasettingarea.set_data_id then
		self.areasettingarea:set_data_id(data)
	end
				
end


settingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areasettingarea.set_data then
		self.areasettingarea:set_data(data)
	end
			
end




settingFrame.on_show = function(self)
			
	if self.areasettingarea.on_show then
		self.areasettingarea:on_show()
	end
			
end


settingFrame.on_hide = function(self)
			
	if self.areasettingarea.on_hide then
		self.areasettingarea:on_hide()
	end		
			
end

	


	