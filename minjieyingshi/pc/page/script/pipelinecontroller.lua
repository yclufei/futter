
gr_module("gm_minjieyingshi")

pipelinecontrollerFrame = inherit(GmBase.FrameBase):name("pipelinecontrollerFrame")

pipelinecontrollerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_pipelinecontroller ")

	self.mainarea = gm_minjieyingshi.pipelinecontrollerareaArea(self)

	self:set_style('display:none')

end
