
-- �����б�
gr_module("GmControl")

AccountDetailListItem = inherit(GmCtrl.ControlBase):name("AccountDetailListItem")

AccountDetailListItem.init = function (self,parent,itemid)

	local top = self
	local fid = itemid or "listitem_accountdetail"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end			
	

end

AccountDetailListItem.set_data = function(self,data)

	-- ���
	data['jine']  = curl_data_getAttrValue(data,'count')
	data['balance']  = curl_data_getAttrValue(data,'balance')

	local rels = curl_data_getRels(data)
	for a,b in pairs(rels) do
		local obj = curl_data_getObject(b)
		if tonumber(obj.parent_id) == 124 then
			data['type'] = obj.title -- ����
		end
		if obj.clsid then
			if tonumber(obj.clsid) == 121 then
				data['order'] = obj.objecttitle -- ��������
			end
			if tonumber(obj.clsid) == 13 then
				data['account'] = obj.objecttitle -- ��ֵ�˺�
			end
		end
	end
	
	self:set_childs_inner_text(data)
--------self:set_use_cache(true)
	
end
