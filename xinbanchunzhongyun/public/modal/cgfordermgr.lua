
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mcgfordermgr = inherit(GmSql.list,GmBase.CallBack):name("mcgfordermgr")



mcgfordermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_order')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('czy_order','id')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['cgfordermodify'] = {} 	
	-------
	self.op['cgfordermodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfordermodify()
		for a,b in pairs(top.action['cgfordermodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfordermodify(newpostparam)
		
	end	
		
  self.action['cgfordermodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['cgfordermodify']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfordermodify']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgfordermodify']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgfordermodify']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['cgfordermodify']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfordermodify']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfordermodify']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfordermodify']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfordermodify']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfordermodify']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfordermodify']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfordermodify']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfordermodify']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfordermodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgforderdetail'] = {} 	
	-------
	self.op['cgforderdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgforderdetail()
		for a,b in pairs(top.action['cgforderdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgforderdetail(newpostparam)
		
	end	
		
  self.action['cgforderdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['cgforderdetail']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderdetail']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderdetail']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderdetail']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['cgforderdetail']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgforderdetail']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderdetail']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderdetail']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderdetail']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderdetail']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgforderdetail']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderdetail']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderdetail']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgforderdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgforderitem'] = {} 	
	-------
	self.op['cgforderitem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgforderitem()
		for a,b in pairs(top.action['cgforderitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgforderitem(newpostparam)
		
	end	
		
  self.action['cgforderitem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['cgforderitem']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderitem']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderitem']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderitem']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['cgforderitem']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgforderitem']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderitem']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderitem']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderitem']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderitem']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgforderitem']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderitem']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderitem']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgforderitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgforderpost'] = {} 	
	-------
	self.op['cgforderpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgforderpost()
		for a,b in pairs(top.action['cgforderpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgforderpost(newpostparam)
		
	end	
		
  self.action['cgforderpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['cgforderpost']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderpost']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderpost']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderpost']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['cgforderpost']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgforderpost']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderpost']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderpost']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderpost']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderpost']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgforderpost']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderpost']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderpost']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgforderpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgforderlist'] = {} 	
	-------
	self.op['cgforderlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgforderlist()
		for a,b in pairs(top.action['cgforderlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgforderlist(newpostparam)
		
	end	
		
  self.action['cgforderlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['group_id'] = { ['title'] = 'group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['finance_group_id'] = { ['title'] = 'finance_group_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['related_order_id'] = { ['title'] = '返工单：关联订单号,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['delivery_group_id'] = { ['title'] = '出库单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['warehouse_id'] = { ['title'] = 'warehouse_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['cgforderlist']['brand_id'] = { ['title'] = '品牌id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['order_code'] = { ['title'] = 'order_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['barcode'] = { ['title'] = '条形编码方便提取,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['sub_code'] = { ['title'] = 'sub_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['plan_code'] = { ['title'] = '排单编号,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['order_type'] = { ['title'] = '0:门;1:窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['order_process_type'] = { ['title'] = 'order_process_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['entire_type'] = { ['title'] = 'entire_type' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['customer_id'] = { ['title'] = '经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['buyer'] = { ['title'] = 'buyer' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['buyer_phone'] = { ['title'] = '终端客户电话,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['buyer_address'] = { ['title'] = '终端客户地址,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['product_name'] = { ['title'] = 'product_name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['product_code'] = { ['title'] = 'product_code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgforderlist']['script_id'] = { ['title'] = 'script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['separator_script_id'] = { ['title'] = 'separator_script_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['height'] = { ['title'] = 'height' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['width'] = { ['title'] = 'width' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['color'] = { ['title'] = 'color' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['price'] = { ['title'] = 'price' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['weight'] = { ['title'] = '订单重量,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['count'] = { ['title'] = 'count' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['cost'] = { ['title'] = '成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderlist']['loss_cost'] = { ['title'] = '耗损成本,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '13' }	
  self.action['cgforderlist']['money_sum'] = { ['title'] = 'money_sum' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['discount'] = { ['title'] = '折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['money'] = { ['title'] = '打折后的金额,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['pay_percent'] = { ['title'] = 'pay_percent' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['customer_note'] = { ['title'] = 'customer_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['work_note'] = { ['title'] = 'work_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['return_note'] = { ['title'] = '拒绝原因,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['delivery'] = { ['title'] = '物流简要信息，详细的在delivey_info表中,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['handler'] = { ['title'] = 'handler' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['erect'] = { ['title'] = '是否安装单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['is_erect'] = { ['title'] = '是否已经安装,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['order_time'] = { ['title'] = '录单时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['erect_date'] = { ['title'] = '安装日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['erector'] = { ['title'] = '安装人员,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['cgforderlist']['erect_remark'] = { ['title'] = '安装备注,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgforderlist']['due_time'] = { ['title'] = '预计交货日期,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['duedong_time'] = { ['title'] = '预计完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['finish_time'] = { ['title'] = '完成时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['delivery_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['edit_time'] = { ['title'] = '修改时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['is_due_time'] = { ['title'] = '是否修改过预计交货时间1是,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['shipping_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['sales_time'] = { ['title'] = '出库时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['freeze'] = { ['title'] = 'freeze' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['freeze_why'] = { ['title'] = 'freeze_why' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['request_product'] = { ['title'] = 'request_product' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['all_done'] = { ['title'] = 'all_done' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['exception'] = { ['title'] = '是否特殊订单:1为经销商订单,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['status'] = { ['title'] = 'status' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['finstatus'] = { ['title'] = '财务状态,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderlist']['try_uid'] = { ['title'] = 'try_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['start_time'] = { ['title'] = 'start_time' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['change_image_id'] = { ['title'] = 'change_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['msg_flag'] = { ['title'] = '1表示已发送短信，0表示未发,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['show_image_id'] = { ['title'] = 'show_image_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['plan_note'] = { ['title'] = 'plan_note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgforderlist']['custime'] = { ['title'] = 'custime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['fintime'] = { ['title'] = 'fintime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgforderlist']['is_library'] = { ['title'] = '是否已出库,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['is_delivery'] = { ['title'] = '是否允许出库默认为0,1为允许,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgforderlist']['kshow_order_id'] = { ['title'] = 'kshow订单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['customer_order_id'] = { ['title'] = 'App远程订单ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['merge_detail_id'] = { ['title'] = '合并领料单id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['is_multi_pkgcmpt'] = { ['title'] = '是否拆分成多个包装部件(用于包装模块),' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgforderlist']['order_type_note'] = { ['title'] = '订单类型的备注：比如补料、单独做材料、做成品等,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgforderlist']['carveid'] = { ['title'] = '雕刻路径ID,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgforderlist']['carve_name'] = { ['title'] = '雕刻路径名称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgforderlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mcgfordermgr.check_fields_validate = function(self,key,postparam)
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


 
mcgfordermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mcgfordermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mcgfordermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mcgfordermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mcgfordermgr.run = function(self,key,ui)
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


mcgfordermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mcgfordermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mcgfordermgr.get_net_page error ',methon)
	end		
end




mcgfordermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgforderlist']) do
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


mcgfordermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgforderlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mcgfordermgr.init_table = function(self)
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


	