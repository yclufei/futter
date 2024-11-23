
		
gr_module("gm_minjieyingshi")

createmusicFrame = inherit(GmBase.FrameBase):name("createmusicFrame")

createmusicFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	GmBase.FrameBase.init_by_parent(self,parent,"templete_createmusic")
	
	self.mainarea = gm_minjieyingshi.createmusicareaArea(self)

	
end


createmusicFrame.set_data_id = function(self,data)
	
	if self.mainarea and self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


createmusicFrame.set_data = function(self,data)

	self.data = data
	
	if self.mainarea and self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




	