
gr_module("gm_minjieyingshi")

automation_optuna_optimizeroptunaFrame = inherit(GmBase.FrameBase):name("automation_optuna_optimizeroptunaFrame")

automation_optuna_optimizeroptunaFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_optuna_optimizeroptuna")

	self.mainarea = gm_minjieyingshi.automation_optuna_optimizeroptunaareaArea(self)

	self:set_style('display:none')

end
