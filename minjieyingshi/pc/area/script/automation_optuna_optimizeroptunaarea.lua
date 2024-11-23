
gr_module("gm_minjieyingshi")

automation_optuna_optimizeroptunaareaArea = inherit(GmCtrl.ControlBase):name("automation_optuna_optimizeroptunaareaArea")

automation_optuna_optimizeroptunaareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_optuna_optimizeroptunaareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

