
gr_module("gm_minjieyingshi")

storagemanagerareaArea = inherit(GmCtrl.ControlBase):name("storagemanagerareaArea")

storagemanagerareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "storagemanagerareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self:show_scroll_bar(true)

end

