
gr_module("gm_minjieyingshi")

loggerareaArea = inherit(GmCtrl.ControlBase):name("loggerareaArea")

loggerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "loggerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

