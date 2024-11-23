

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfcustomeritemItem = inherit(GmCtrl.ControlBase):name("cgfcustomeritemItem")

cgfcustomeritemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "cgfcustomeritemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.id = self:get_child("id")
	
	self.name = self:get_child("name")
	
	self.code = self:get_child("code")
	
	self.telephone = self:get_child("telephone")
	
	self.fax = self:get_child("fax")
	
	self.province = self:get_child("province")
	
	self.country = self:get_child("country")
	
	self.city = self:get_child("city")
	
	self.area = self:get_child("area")
	
	self.address = self:get_child("address")
	
	self.village = self:get_child("village")
	
	self.digging_uid = self:get_child("digging_uid")
	
	self.salesman_uid = self:get_child("salesman_uid")
	
	self.service_uid = self:get_child("service_uid")
	
	self.region = self:get_child("region")
	
	self.category = self:get_child("category")
	
	self.pinpai = self:get_child("pinpai")
	
	self.brand_id = self:get_child("brand_id")
	
	self.delivery = self:get_child("delivery")
	
	self.linkman = self:get_child("linkman")
	
	self.phone = self:get_child("phone")
	
	self.email = self:get_child("email")
	
	self.qq = self:get_child("qq")
	
	self.wechat = self:get_child("wechat")
	
	self.website = self:get_child("website")
	
	self.discount = self:get_child("discount")
	
	self.note = self:get_child("note")
	
	self.uid = self:get_child("uid")
	
	self.hittimes = self:get_child("hittimes")
	
	self.addtime = self:get_child("addtime")
	
	self.disable = self:get_child("disable")
	
	self.pay_type = self:get_child("pay_type")
	
	self.type = self:get_child("type")
	
	self.weixin_closed = self:get_child("weixin_closed")
	
	self.weixin_password = self:get_child("weixin_password")
	
	self.added_by = self:get_child("added_by")
	
	self.modified_by = self:get_child("modified_by")
	
	self.andriod_password = self:get_child("andriod_password")
	
	self.k_id = self:get_child("k_id")
	
	self.arrears_warning = self:get_child("arrears_warning")
	
	self.pref_pro = self:get_child("pref_pro")
	
	self.resource = self:get_child("resource")
	
	self.rebates = self:get_child("rebates")
	
	
	
end


cgfcustomeritemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	