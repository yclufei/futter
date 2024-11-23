
gr_module("gm_minjieyingshi")

automation_taskschedulerareaArea = inherit(GmCtrl.ControlBase):name("automation_taskschedulerareaArea")

automation_taskschedulerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_taskschedulerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

