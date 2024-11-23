
gr_module("gm_minjieyingshi")

automation_parametersetareaArea = inherit(GmCtrl.ControlBase):name("automation_parametersetareaArea")

automation_parametersetareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_parametersetareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

