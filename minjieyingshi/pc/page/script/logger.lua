
gr_module("gm_minjieyingshi")

loggerFrame = inherit(GmBase.FrameBase):name("loggerFrame")

loggerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_logger")

	self.mainarea = gm_minjieyingshi.loggerareaArea(self)

	self:set_style('display:none')

end
