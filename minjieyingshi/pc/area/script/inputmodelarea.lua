
gr_module("gm_minjieyingshi")

inputmodelareaArea = inherit(GmCtrl.ControlBase):name("inputmodelareaArea")

inputmodelareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "inputmodelareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

