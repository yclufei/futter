
gr_module("gm_minjieyingshi")

automation_triggerschedulerareaArea = inherit(GmCtrl.ControlBase):name("automation_triggerschedulerareaArea")

automation_triggerschedulerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_triggerschedulerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

