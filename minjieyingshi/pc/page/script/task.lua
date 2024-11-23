
gr_module("gm_minjieyingshi")

taskFrame = inherit(GmBase.FrameBase):name("taskFrame")

taskFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_task")

	self.mainarea = gm_minjieyingshi.taskareaArea(self)

	self:set_style('display:none')

end
