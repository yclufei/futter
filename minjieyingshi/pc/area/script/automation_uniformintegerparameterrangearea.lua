
gr_module("gm_minjieyingshi")

automation_uniformintegerparameterrangeareaArea = inherit(GmCtrl.ControlBase):name("automation_uniformintegerparameterrangeareaArea")

automation_uniformintegerparameterrangeareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_uniformintegerparameterrangeareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

