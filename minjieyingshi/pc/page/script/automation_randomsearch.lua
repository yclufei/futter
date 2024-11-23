
gr_module("gm_minjieyingshi")

automation_randomsearchFrame = inherit(GmBase.FrameBase):name("automation_randomsearchFrame")

automation_randomsearchFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_automation_randomsearch")

	self.mainarea = gm_minjieyingshi.automation_randomsearchareaArea(self)

	self:set_style('display:none')

end
