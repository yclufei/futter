
gr_module("gm_minjieyingshi")

automation_randomsearchareaArea = inherit(GmCtrl.ControlBase):name("automation_randomsearchareaArea")

automation_randomsearchareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "automation_randomsearchareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

