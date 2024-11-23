
gr_module("gm_minjieyingshi")

automation_clearmljobareaArea = inherit(GmCtrl.ControlBase):name("automation_clearmljobareaArea")

automation_clearmljobareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_clearmljobareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

