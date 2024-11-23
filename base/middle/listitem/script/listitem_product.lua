
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

productListItem = inherit(GmCtrl.ControlBase):name("productListItem")

productListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_product"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end

end
