
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

actListItem = inherit(GmCtrl.ControlBase):name("actListItem")

actListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_act"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
end
