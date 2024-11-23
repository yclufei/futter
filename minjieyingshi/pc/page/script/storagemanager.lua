
gr_module("gm_minjieyingshi")

storagemanagerFrame = inherit(GmBase.FrameBase):name("storagemanagerFrame")

storagemanagerFrame.init = function (self,parent,frameid)

	local top = self
	
	GmBase.FrameBase.init_by_parent(self,parent,frameid or "templete_storagemanager")

	self.mainarea = gm_minjieyingshi.storagemanagerareaArea(self)

	self:set_style('display:none')

end
