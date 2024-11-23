
gr_module("gm_minjieyingshi")

pipelinecontrollerareaArea = inherit(GmCtrl.ControlBase):name("pipelinecontrollerareaArea")

pipelinecontrollerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "pipelinecontrollerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

