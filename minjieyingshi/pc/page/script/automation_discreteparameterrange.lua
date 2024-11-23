
gr_module("gm_minjieyingshi")

automation_discreteparameterrangeFrame = inherit(GmBase.FrameBase):name("automation_discreteparameterrangeFrame")

automation_discreteparameterrangeFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_discreteparameterrange")

	self.mainarea = gm_minjieyingshi.automation_discreteparameterrangeareaArea(self)

	self:set_style('display:none')

end
