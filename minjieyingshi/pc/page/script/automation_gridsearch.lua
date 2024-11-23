
gr_module("gm_minjieyingshi")

automation_gridsearchFrame = inherit(GmBase.FrameBase):name("automation_gridsearchFrame")

automation_gridsearchFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_gridsearch")

	self.mainarea = gm_minjieyingshi.automation_gridsearchareaArea(self)

	self:set_style('display:none')

end
