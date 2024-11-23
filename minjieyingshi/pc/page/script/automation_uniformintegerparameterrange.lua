
gr_module("gm_minjieyingshi")

automation_uniformintegerparameterrangeFrame = inherit(GmBase.FrameBase):name("automation_uniformintegerparameterrangeFrame")

automation_uniformintegerparameterrangeFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_uniformintegerparameterrange")

	self.mainarea = gm_minjieyingshi.automation_uniformintegerparameterrangeareaArea(self)

	self:set_style('display:none')

end
