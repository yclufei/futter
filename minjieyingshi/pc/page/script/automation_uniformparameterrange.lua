
gr_module("gm_minjieyingshi")

automation_uniformparameterrangeFrame = inherit(GmBase.FrameBase):name("automation_uniformparameterrangeFrame")

automation_uniformparameterrangeFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_uniformparameterrange")

	self.mainarea = gm_minjieyingshi.automation_uniformparameterrangeareaArea(self)

	self:set_style('display:none')

end
