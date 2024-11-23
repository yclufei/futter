
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

CollectListItem = inherit(GmCtrl.ControlBase):name("CollectListItem")

CollectListItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_phoneorder"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	
	self.jine = self:get_child('jine')
	self.miane = self:get_child('miane')
	
	
end


CollectListItem.set_data = function(self,data)

	data['jine']  = curl_data_getAttrValue(data,'actualamount')
	data['miane']  = curl_data_getAttrValue(data,'denomination')
	self:set_childs_inner_text(data)
--------self:set_use_cache(true)
	
end
