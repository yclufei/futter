
gr_module("gm_minjieyingshi")

automation_hyperparameteroptimizerareaArea = inherit(GmCtrl.ControlBase):name("automation_hyperparameteroptimizerareaArea")

automation_hyperparameteroptimizerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_hyperparameteroptimizerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

