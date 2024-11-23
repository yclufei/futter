
gr_module("gm_minjieyingshi")

automation_hpbandster_optimizerbohbFrame = inherit(GmBase.FrameBase):name("automation_hpbandster_optimizerbohbFrame")

automation_hpbandster_optimizerbohbFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_hpbandster_optimizerbohb")

	self.mainarea = gm_minjieyingshi.automation_hpbandster_optimizerbohbareaArea(self)

	self:set_style('display:none')

end
