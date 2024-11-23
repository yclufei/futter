
gr_module("gm_minjieyingshi")

automation_controller_pipelinedecoratorareaArea = inherit(GmCtrl.ControlBase):name("automation_controller_pipelinedecoratorareaArea")

automation_controller_pipelinedecoratorareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_controller_pipelinedecoratorareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

