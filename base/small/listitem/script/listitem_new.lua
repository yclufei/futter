
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

newListItem = inherit(GmCtrl.ControlBase):name("newListItem")

newListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_new"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	------self:set_use_cache(true)
	

end
