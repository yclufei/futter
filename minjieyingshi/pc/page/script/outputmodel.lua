
gr_module("gm_minjieyingshi")

outputmodelFrame = inherit(GmBase.FrameBase):name("outputmodelFrame")

outputmodelFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_outputmodel")

	self.mainarea = gm_minjieyingshi.outputmodelareaArea(self)

	self:set_style('display:none')

end
