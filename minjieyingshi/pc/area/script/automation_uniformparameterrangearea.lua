
gr_module("gm_minjieyingshi")

automation_uniformparameterrangeareaArea = inherit(GmCtrl.ControlBase):name("automation_uniformparameterrangeareaArea")

automation_uniformparameterrangeareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_uniformparameterrangeareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

