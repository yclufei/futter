
gr_module("gm_minjieyingshi")

modelareaArea = inherit(GmCtrl.ControlBase):name("modelareaArea")

modelareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "modelareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

