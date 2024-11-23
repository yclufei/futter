
gr_module("gm_minjieyingshi")

automation_triggerschedulerFrame = inherit(GmBase.FrameBase):name("automation_triggerschedulerFrame")

automation_triggerschedulerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_triggerscheduler")

	self.mainarea = gm_minjieyingshi.automation_triggerschedulerareaArea(self)

	self:set_style('display:none')

end
