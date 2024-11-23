
gr_module("gm_minjieyingshi")

automation_hyperparameteroptimizerFrame = inherit(GmBase.FrameBase):name("automation_hyperparameteroptimizerFrame")

automation_hyperparameteroptimizerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_hyperparameteroptimizer")

	self.mainarea = gm_minjieyingshi.automation_hyperparameteroptimizerareaArea(self)

	self:set_style('display:none')

end
