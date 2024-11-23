

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgforderitemItem = inherit(GmCtrl.ControlBase):name("cgforderitemItem")

cgforderitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "cgforderitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.id = self:get_child("id")
	
	self.group_id = self:get_child("group_id")
	
	self.finance_group_id = self:get_child("finance_group_id")
	
	self.related_order_id = self:get_child("related_order_id")
	
	self.delivery_group_id = self:get_child("delivery_group_id")
	
	self.warehouse_id = self:get_child("warehouse_id")
	
	self.brand_id = self:get_child("brand_id")
	
	self.order_code = self:get_child("order_code")
	
	self.barcode = self:get_child("barcode")
	
	self.sub_code = self:get_child("sub_code")
	
	self.plan_code = self:get_child("plan_code")
	
	self.order_type = self:get_child("order_type")
	
	self.order_process_type = self:get_child("order_process_type")
	
	self.entire_type = self:get_child("entire_type")
	
	self.customer_id = self:get_child("customer_id")
	
	self.buyer = self:get_child("buyer")
	
	self.buyer_phone = self:get_child("buyer_phone")
	
	self.buyer_address = self:get_child("buyer_address")
	
	self.product_name = self:get_child("product_name")
	
	self.product_code = self:get_child("product_code")
	
	self.script_id = self:get_child("script_id")
	
	self.separator_script_id = self:get_child("separator_script_id")
	
	self.height = self:get_child("height")
	
	self.width = self:get_child("width")
	
	self.color = self:get_child("color")
	
	self.price = self:get_child("price")
	
	self.area = self:get_child("area")
	
	self.weight = self:get_child("weight")
	
	self.count = self:get_child("count")
	
	self.cost = self:get_child("cost")
	
	self.loss_cost = self:get_child("loss_cost")
	
	self.money_sum = self:get_child("money_sum")
	
	self.discount = self:get_child("discount")
	
	self.money = self:get_child("money")
	
	self.pay_percent = self:get_child("pay_percent")
	
	self.customer_note = self:get_child("customer_note")
	
	self.work_note = self:get_child("work_note")
	
	self.return_note = self:get_child("return_note")
	
	self.delivery = self:get_child("delivery")
	
	self.handler = self:get_child("handler")
	
	self.erect = self:get_child("erect")
	
	self.is_erect = self:get_child("is_erect")
	
	self.order_time = self:get_child("order_time")
	
	self.erect_date = self:get_child("erect_date")
	
	self.erector = self:get_child("erector")
	
	self.erect_remark = self:get_child("erect_remark")
	
	self.due_time = self:get_child("due_time")
	
	self.duedong_time = self:get_child("duedong_time")
	
	self.finish_time = self:get_child("finish_time")
	
	self.delivery_time = self:get_child("delivery_time")
	
	self.edit_time = self:get_child("edit_time")
	
	self.is_due_time = self:get_child("is_due_time")
	
	self.shipping_time = self:get_child("shipping_time")
	
	self.sales_time = self:get_child("sales_time")
	
	self.freeze = self:get_child("freeze")
	
	self.freeze_why = self:get_child("freeze_why")
	
	self.request_product = self:get_child("request_product")
	
	self.all_done = self:get_child("all_done")
	
	self.exception = self:get_child("exception")
	
	self.status = self:get_child("status")
	
	self.finstatus = self:get_child("finstatus")
	
	self.try_uid = self:get_child("try_uid")
	
	self.start_time = self:get_child("start_time")
	
	self.change_image_id = self:get_child("change_image_id")
	
	self.msg_flag = self:get_child("msg_flag")
	
	self.show_image_id = self:get_child("show_image_id")
	
	self.plan_note = self:get_child("plan_note")
	
	self.custime = self:get_child("custime")
	
	self.fintime = self:get_child("fintime")
	
	self.is_library = self:get_child("is_library")
	
	self.is_delivery = self:get_child("is_delivery")
	
	self.kshow_order_id = self:get_child("kshow_order_id")
	
	self.customer_order_id = self:get_child("customer_order_id")
	
	self.merge_detail_id = self:get_child("merge_detail_id")
	
	self.is_multi_pkgcmpt = self:get_child("is_multi_pkgcmpt")
	
	self.order_type_note = self:get_child("order_type_note")
	
	self.carveid = self:get_child("carveid")
	
	self.carve_name = self:get_child("carve_name")
	
	
	
end


cgforderitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	