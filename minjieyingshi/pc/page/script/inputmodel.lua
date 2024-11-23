
gr_module("gm_minjieyingshi")

inputmodelFrame = inherit(GmBase.FrameBase):name("inputmodelFrame")

inputmodelFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_inputmodel")

	self.mainarea = gm_minjieyingshi.inputmodelareaArea(self)

	self:set_style('display:none')

end
