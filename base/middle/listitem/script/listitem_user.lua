
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

userListItem = inherit(GmCtrl.ControlBase):name("userListItem")

userListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_user"
	GmCtrl.ControlBase.init(self,parent,fid)

	if not itemid then
		self:set_visible(false)
	end
end
