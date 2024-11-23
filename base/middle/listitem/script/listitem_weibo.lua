
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

weiboListItem = inherit(GmCtrl.ControlBase):name("weiboListItem")

weiboListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_weibo"
	GmCtrl.ControlBase.init(self,parent,fid)

	if not itemid then
		self:set_visible(false)
	end
	
end
