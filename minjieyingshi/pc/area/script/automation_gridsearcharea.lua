
gr_module("gm_minjieyingshi")

automation_gridsearchareaArea = inherit(GmCtrl.ControlBase):name("automation_gridsearchareaArea")

automation_gridsearchareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_gridsearchareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

