
gr_module("gm_minjieyingshi")

automation_taskschedulerFrame = inherit(GmBase.FrameBase):name("automation_taskschedulerFrame")

automation_taskschedulerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_taskscheduler")

	self.mainarea = gm_minjieyingshi.automation_taskschedulerareaArea(self)

	self:set_style('display:none')

end
