
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

storeListItem = inherit(GmCtrl.ControlBase):name("storeListItem")

storeListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_store"
	GmCtrl.ControlBase.init(self,parent,fid)

	if not itemid then
		self:set_visible(false)
	end
	------self:set_use_cache(true)
	
end
