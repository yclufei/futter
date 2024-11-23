
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

PhoneOrderListItem = inherit(GmCtrl.ControlBase):name("PhoneOrderListItem")

PhoneOrderListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_phoneorder"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	
	self.status = self:get_child('status')
	self.statustext = self:get_child('statustext')
	
	
end

PhoneOrderListItem.set_data = function(self,data)
	if data.rel then
		for a,b in pairs(data.rel) do
			if b.object and b.object.parent_id and tonumber(b.object.parent_id) == 130 then
				self.status:set_class("phoneorderstatus_"..b.object.id)
				self.statustext:set_inner_text(b.object.title)
			end
		end
	end
--------self:set_use_cache(true)
end
