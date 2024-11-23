
gr_module("gm_minjieyingshi")

automation_discreteparameterrangeareaArea = inherit(GmCtrl.ControlBase):name("automation_discreteparameterrangeareaArea")

automation_discreteparameterrangeareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_discreteparameterrangeareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

