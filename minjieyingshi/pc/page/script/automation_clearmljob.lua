
gr_module("gm_minjieyingshi")

automation_clearmljobFrame = inherit(GmBase.FrameBase):name("automation_clearmljobFrame")

automation_clearmljobFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_clearmljob")

	self.mainarea = gm_minjieyingshi.automation_clearmljobareaArea(self)

	self:set_style('display:none')

end
