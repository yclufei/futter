
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

advListItem = inherit(GmCtrl.ControlBase):name("advListItem")

advListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_adv"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end

end
