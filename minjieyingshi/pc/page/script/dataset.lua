
gr_module("gm_minjieyingshi")

datasetFrame = inherit(GmBase.FrameBase):name("datasetFrame")

datasetFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_dataset")

	self.mainarea = gm_minjieyingshi.datasetareaArea(self)

	self:set_style('display:none')

end
