
gr_module("gm_minjieyingshi")

automation_parametersetFrame = inherit(GmBase.FrameBase):name("automation_parametersetFrame")

automation_parametersetFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_parameterset")

	self.mainarea = gm_minjieyingshi.automation_parametersetareaArea(self)

	self:set_style('display:none')

end
