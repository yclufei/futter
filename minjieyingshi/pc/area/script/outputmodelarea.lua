
gr_module("gm_minjieyingshi")

outputmodelareaArea = inherit(GmCtrl.ControlBase):name("outputmodelareaArea")

outputmodelareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "outputmodelareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

