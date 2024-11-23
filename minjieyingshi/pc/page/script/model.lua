
gr_module("gm_minjieyingshi")

modelFrame = inherit(GmBase.FrameBase):name("modelFrame")

modelFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_model")

	self.mainarea = gm_minjieyingshi.modelareaArea(self)

	self:set_style('display:none')

end
