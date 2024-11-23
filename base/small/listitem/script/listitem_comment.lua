
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

commentListItem = inherit(GmCtrl.ControlBase):name("commentListItem")

commentListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_comment"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	------self:set_use_cache(true)
	

end
