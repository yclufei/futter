
gr_module("gm_minjieyingshi")

automation_controller_pipelinedecoratorFrame = inherit(GmBase.FrameBase):name("automation_controller_pipelinedecoratorFrame")

automation_controller_pipelinedecoratorFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_controller_pipelinedecorator")

	self.mainarea = gm_minjieyingshi.automation_controller_pipelinedecoratorareaArea(self)

	self:set_style('display:none')

end
