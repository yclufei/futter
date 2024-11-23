
		
gr_module("gm_minjieyingshi")

createmusicFrame = inherit(GmBase.FrameBase):name("createmusicFrame")

createmusicFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_createmusic"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	self.mainarea = gm_minjieyingshi.createmusicareaArea(self)
	
	self:set_style('display:none')

	
end


createmusicFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


createmusicFrame.set_data = function(self,data)

	self.data = data
	
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




createmusicFrame.on_show = function(self,key)
			
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
			
end


createmusicFrame.on_hide = function(self,key)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end		
			
end

	


	