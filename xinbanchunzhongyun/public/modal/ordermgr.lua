
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mordermgr = inherit(GmSql.list,GmBase.CallBack):name("mordermgr")



mordermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'order')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('order','tid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['orderdetail'] = {} 	
	-------
	self.op['orderdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:orderdetail()
		for a,b in pairs(top.action['orderdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:orderdetail(newpostparam)
		
	end	
		
  self.action['orderdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['orderdetail']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderdetail']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderdetail']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderdetail']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['orderdetail']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['orderdetail']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderdetail']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderdetail']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderdetail']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderdetail']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['orderdetail']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderdetail']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderdetail']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['orderdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['ordermodify'] = {} 	
	-------
	self.op['ordermodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:ordermodify()
		for a,b in pairs(top.action['ordermodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:ordermodify(newpostparam)
		
	end	
		
  self.action['ordermodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['ordermodify']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['ordermodify']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['ordermodify']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['ordermodify']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['ordermodify']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['ordermodify']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['ordermodify']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['ordermodify']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ordermodify']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['ordermodify']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['ordermodify']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['ordermodify']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['ordermodify']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['ordermodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['orderlist'] = {} 	
	-------
	self.op['orderlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:orderlist()
		for a,b in pairs(top.action['orderlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:orderlist(newpostparam)
		
	end	
		
  self.action['orderlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['orderlist']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderlist']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderlist']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderlist']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['orderlist']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['orderlist']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderlist']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderlist']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderlist']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderlist']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['orderlist']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderlist']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderlist']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['orderlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['orderitem'] = {} 	
	-------
	self.op['orderitem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:orderitem()
		for a,b in pairs(top.action['orderitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:orderitem(newpostparam)
		
	end	
		
  self.action['orderitem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['orderitem']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderitem']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderitem']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderitem']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['orderitem']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['orderitem']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderitem']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderitem']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderitem']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderitem']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['orderitem']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderitem']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderitem']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['orderitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['orderpost'] = {} 	
	-------
	self.op['orderpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:orderpost()
		for a,b in pairs(top.action['orderpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:orderpost(newpostparam)
		
	end	
		
  self.action['orderpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['orderpost']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['orderpost']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderpost']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['orderpost']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['orderpost']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['orderpost']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderpost']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['orderpost']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['orderpost']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['orderpost']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['orderpost']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['orderpost']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['orderpost']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['orderpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mordermgr.check_fields_validate = function(self,key,postparam)
	local checkfunc = {}
	checkfunc['t'] = function(fm,value)
		return true
	end
	checkfunc['min'] = function(fm,value)
		if string.len(value) < tonumber(fm) then
			return false
		end
		return true
	end
	checkfunc['max'] = function(fm,value)
		if string.len(value) > tonumber(fm) then
			return false
		end
		return true
	end
	local format = self.action[key]
	for fkey,fvalue in pairs(postparam) do
		if format[fkey] ~= nil then
			for fmkey,fmvalue in pairs(format[fkey]) do
				if checkfunc[fmkey] ~= nil then
					if checkfunc[fmkey](fmvalue,fvalue) == false then
						return false,tostring(format[fkey]['title']).." "..tostring(fmkey).." "..tostring(fmvalue).." error"
					end
				end
			end
		end
	end
	return true,""
end 


 
mordermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mordermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mordermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mordermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mordermgr.run = function(self,key,ui)
	if self.action[key] ~= nil and self.op[key] ~= nil then
		local tb = {}
		for k,v in pairs(self.action[key]) do
			if ui[k] ~= nil and type(ui[k]) == 'table' and ui[k].get_text then
				tb[k] = ui[k]:get_text()
			else
				print('run error',key,k)
			end
		end
		local success,msg = self:check_fields_validate(key,tb)
		if success then
			self.op[key](tb,ui)
		else
			ui.hostWindow:showMsg(msg)
		end		
	else
		print('run error self.action',key)
	end
end


------------------------------------------------------------------------------------


mordermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mordermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mordermgr.get_net_page error ',methon)
	end		
end




mordermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['orderlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page - 1		

		if attrs.page < 1 then
			attrs.page = 1
		end

		self:get_net_page(ui.netmethon,attrs)
	end
end


mordermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['orderlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mordermgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['id'] = { ["i"] = 11, }
    
	--number
	tablefield['group_id'] = { ["i"] = 11, }
    
	--number
	tablefield['finance_group_id'] = { ["i"] = 11, }
    
	--number
	tablefield['related_order_id'] = { ["i"] = 11, }
    
	--number
	tablefield['delivery_group_id'] = { ["i"] = 11, }
    
	--string
	tablefield['warehouse_id'] = { ["v"] = 256, }
    
	--number
	tablefield['brand_id'] = { ["i"] = 11, }
    
	--string
	tablefield['order_code'] = { ["v"] = 32, }
    
	--string
	tablefield['barcode'] = { ["v"] = 32, }
    
	--string
	tablefield['sub_code'] = { ["v"] = 32, }
    
	--string
	tablefield['plan_code'] = { ["v"] = 32, }
    
	--number
	tablefield['order_type'] = { ["i"] = 11, }
    
	--number
	tablefield['order_process_type'] = { ["i"] = 11, }
    
	--number
	tablefield['entire_type'] = { ["i"] = 11, }
    
	--number
	tablefield['customer_id'] = { ["i"] = 11, }
    
	--string
	tablefield['buyer'] = { ["v"] = 64, }
    
	--string
	tablefield['buyer_phone'] = { ["v"] = 64, }
    
	--string
	tablefield['buyer_address'] = { ["v"] = 64, }
    
	--string
	tablefield['product_name'] = { ["v"] = 32, }
    
	--string
	tablefield['product_code'] = { ["v"] = 32, }
    
	--number
	tablefield['script_id'] = { ["i"] = 11, }
    
	--number
	tablefield['separator_script_id'] = { ["i"] = 11, }
    
	--string
	tablefield['height'] = { ["v"] = 64, }
    
	--string
	tablefield['width'] = { ["v"] = 64, }
    
	--string
	tablefield['color'] = { ["v"] = 64, }
    
	--string
	tablefield['price'] = { ["v"] = 20, }
    
	--string
	tablefield['area'] = { ["v"] = 20, }
    
	--string
	tablefield['weight'] = { ["v"] = 20, }
    
	--number
	tablefield['count'] = { ["i"] = 11, }
    
	--string
	tablefield['cost'] = { ["v"] = 13, }
    
	--string
	tablefield['loss_cost'] = { ["v"] = 13, }
    
	--string
	tablefield['money_sum'] = { ["v"] = 20, }
    
	--string
	tablefield['discount'] = { ["v"] = 20, }
    
	--string
	tablefield['money'] = { ["v"] = 20, }
    
	--string
	tablefield['pay_percent'] = { ["v"] = 20, }
    
	--string
	tablefield['customer_note'] = { ["v"] = 20, }
    
	--string
	tablefield['work_note'] = { ["v"] = 64, }
    
	--string
	tablefield['return_note'] = { ["v"] = 64, }
    
	--string
	tablefield['delivery'] = { ["v"] = 64, }
    
	--string
	tablefield['handler'] = { ["v"] = 64, }
    
	--number
	tablefield['erect'] = { ["i"] = 1, }
    
	--number
	tablefield['is_erect'] = { ["i"] = 1, }
    
	--string
	tablefield['order_time'] = { ["v"] = 20, }
    
	--string
	tablefield['erect_date'] = { ["v"] = 20, }
    
	--string
	tablefield['erector'] = { ["v"] = 10, }
    
	--string
	tablefield['erect_remark'] = { ["v"] = 30, }
    
	--string
	tablefield['due_time'] = { ["v"] = 20, }
    
	--string
	tablefield['duedong_time'] = { ["v"] = 20, }
    
	--string
	tablefield['finish_time'] = { ["v"] = 20, }
    
	--string
	tablefield['delivery_time'] = { ["v"] = 20, }
    
	--string
	tablefield['edit_time'] = { ["v"] = 20, }
    
	--number
	tablefield['is_due_time'] = { ["i"] = 1, }
    
	--string
	tablefield['shipping_time'] = { ["v"] = 20, }
    
	--string
	tablefield['sales_time'] = { ["v"] = 20, }
    
	--number
	tablefield['freeze'] = { ["i"] = 1, }
    
	--string
	tablefield['freeze_why'] = { ["v"] = 20, }
    
	--number
	tablefield['request_product'] = { ["i"] = 1, }
    
	--number
	tablefield['all_done'] = { ["i"] = 1, }
    
	--number
	tablefield['exception'] = { ["i"] = 1, }
    
	--string
	tablefield['status'] = { ["v"] = 64, }
    
	--string
	tablefield['finstatus'] = { ["v"] = 255, }
    
	--number
	tablefield['try_uid'] = { ["i"] = 11, }
    
	--string
	tablefield['start_time'] = { ["v"] = 20, }
    
	--number
	tablefield['change_image_id'] = { ["i"] = 11, }
    
	--string
	tablefield['msg_flag'] = { ["v"] = 64, }
    
	--number
	tablefield['show_image_id'] = { ["i"] = 11, }
    
	--string
	tablefield['plan_note'] = { ["v"] = 255, }
    
	--string
	tablefield['custime'] = { ["v"] = 20, }
    
	--string
	tablefield['fintime'] = { ["v"] = 20, }
    
	--number
	tablefield['is_library'] = { ["i"] = 1, }
    
	--number
	tablefield['is_delivery'] = { ["i"] = 1, }
    
	--number
	tablefield['kshow_order_id'] = { ["i"] = 11, }
    
	--number
	tablefield['customer_order_id'] = { ["i"] = 11, }
    
	--number
	tablefield['merge_detail_id'] = { ["i"] = 11, }
    
	--number
	tablefield['is_multi_pkgcmpt'] = { ["i"] = 2, }
    
	--string
	tablefield['order_type_note'] = { ["v"] = 64, }
    
	--number
	tablefield['carveid'] = { ["i"] = 11, }
    
	--string
	tablefield['carve_name'] = { ["v"] = 255, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	