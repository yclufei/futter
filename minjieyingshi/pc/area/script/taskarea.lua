
gr_module("gm_minjieyingshi")

taskareaArea = inherit(GmCtrl.ControlBase):name("taskareaArea")

taskareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "taskareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

