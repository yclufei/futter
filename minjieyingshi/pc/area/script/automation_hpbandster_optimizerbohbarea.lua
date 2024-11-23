
gr_module("gm_minjieyingshi")

automation_hpbandster_optimizerbohbareaArea = inherit(GmCtrl.ControlBase):name("automation_hpbandster_optimizerbohbareaArea")

automation_hpbandster_optimizerbohbareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_hpbandster_optimizerbohbareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

