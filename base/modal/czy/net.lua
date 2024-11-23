
gr_module("GmBase")

czynet = inherit(GmSql.list,GmBase.CallBack):name("czynet")

czynet.instance = nil

czynet.get_instance = function(pagecount)
	if GmBase.czynet.instance == nil then
		GmBase.czynet.instance = GmBase.czynet()
		GmBase.czynet.instance:init_table()
	end
	return GmBase.czynet.instance
end

czynet.init = function (self)
	local top = self	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)	
	self.token = nil	
	self.base = 'http://110.41.160.209/mc2/src/?'	
	self.tpp = 20	
end

czynet.init_table = function(self)
	--[[
	"id":"1"
	"name":"\u65e0\u9521_\u7ecf\u9500\u5546"
	"code":"wx_jxs"
	"telephone":null,"fax":null,"address":"\u6ca1\u6709"
	"region":null,"pinpai":"\u65b0\u683c\u5c14"
	"phone":"13988887777"
	"discount":"10"
	"pay_type":""
	"brand_id":""
	"salesman_uid":null,"service_uid":null,"category":"\u94c2\u91d1\u5ba2\u6237"
	"type":"\u666e\u901a\u7ecf\u9500\u5546"
	"city":"\u978d\u5c71\u5e02"
	"delivery":"\u65e0\u7269\u6d41"
	"note":""
	"money":"0.00"
	"linkman":"\u80e5\u52a0\u9f99"
	"rebates_money":"0.00"
	"u1_service":""
	"u2_name":""
	"province":"\u8fbd\u5b81\u7701"
	"brand_name":""
	]]
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['note'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 20, }
	self:create_table( 'czy_andriodaction', tablefield)
	self.idPair['andriodaction'] = {}
	self.idPair['andriodaction']['prev'] = '0'
	self.idPair['andriodaction']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['version'] = { ['v'] = 64, }
	tablefield['down_url'] = { ['v'] = 255, }
	self:create_table( 'czy_appversion', tablefield)
	self.idPair['appversion'] = {}
	self.idPair['appversion']['prev'] = '0'
	self.idPair['appversion']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['is_using'] = { ['i'] = 1, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 20, }
	self:create_table( 'czy_clientformat', tablefield)
	self.idPair['clientformat'] = {}
	self.idPair['clientformat']['prev'] = '0'
	self.idPair['clientformat']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['client_format_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['my_label'] = { ['v'] = 32, }
	tablefield['note'] = { ['v'] = 32, }
	tablefield['is_basic'] = { ['i'] = 1, }
	tablefield['width'] = { ['v'] = 32, }
	tablefield['priority'] = { ['v'] = 20, }
	self:create_table( 'czy_clientformatrule', tablefield)
	self.idPair['clientformatrule'] = {}
	self.idPair['clientformatrule']['prev'] = '0'
	self.idPair['clientformatrule']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['info'] = { ['v'] = 20, }
	tablefield['tel'] = { ['v'] = 255, }
	tablefield['fax'] = { ['v'] = 255, }
	tablefield['email'] = { ['v'] = 255, }
	tablefield['address'] = { ['v'] = 255, }
	tablefield['account'] = { ['v'] = 255, }
	tablefield['logo'] = { ['v'] = 255, }
	tablefield['zip_code'] = { ['v'] = 255, }
	tablefield['msn'] = { ['v'] = 255, }
	tablefield['qq'] = { ['v'] = 255, }
	tablefield['hotline'] = { ['v'] = 255, }
	tablefield['phone'] = { ['v'] = 255, }
	tablefield['linkman'] = { ['v'] = 255, }
	tablefield['theme_id'] = { ['i'] = 4, }
	tablefield['province'] = { ['v'] = 30, }
	tablefield['lot'] = { ['v'] = 64, }
	tablefield['background'] = { ['v'] = 255, }
	tablefield['web'] = { ['v'] = 255, }
	tablefield['coefficient'] = { ['v'] = 16, }
	tablefield['kshow_name'] = { ['v'] = 255, }
	tablefield['kshow_password'] = { ['v'] = 255, }
	tablefield['kshow_key'] = { ['v'] = 255, }
	self:create_table( 'czy_company', tablefield)
	self.idPair['company'] = {}
	self.idPair['company']['prev'] = '0'
	self.idPair['company']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['code'] = { ['v'] = 20, }
	tablefield['telephone'] = { ['v'] = 64, }
	tablefield['fax'] = { ['v'] = 32, }
	tablefield['province'] = { ['v'] = 20, }
	tablefield['country'] = { ['v'] = 64, }
	tablefield['city'] = { ['v'] = 30, }
	tablefield['area'] = { ['v'] = 128, }
	tablefield['address'] = { ['v'] = 64, }
	tablefield['village'] = { ['v'] = 64, }
	tablefield['digging_uid'] = { ['i'] = 11, }
	tablefield['salesman_uid'] = { ['i'] = 11, }
	tablefield['service_uid'] = { ['i'] = 11, }
	tablefield['region'] = { ['v'] = 20, }
	tablefield['category'] = { ['v'] = 64, }
	tablefield['pinpai'] = { ['v'] = 64, }
	tablefield['brand_id'] = { ['v'] = 64, }
	tablefield['delivery'] = { ['v'] = 20, }
	tablefield['linkman'] = { ['v'] = 20, }
	tablefield['phone'] = { ['v'] = 32, }
	tablefield['email'] = { ['v'] = 32, }
	tablefield['qq'] = { ['v'] = 20, }
	tablefield['wechat'] = { ['v'] = 50, }
	tablefield['website'] = { ['v'] = 64, }
	tablefield['discount'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 20, }
	tablefield['uid'] = { ['i'] = 32, }
	tablefield['hittimes'] = { ['i'] = 32, }
	tablefield['addtime'] = { ['v'] = 20, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['pay_type'] = { ['v'] = 20, }
	tablefield['type'] = { ['v'] = 20, }
	tablefield['weixin_closed'] = { ['i'] = 1, }
	tablefield['weixin_password'] = { ['v'] = 32, }
	tablefield['added_by'] = { ['v'] = 32, }
	tablefield['modified_by'] = { ['v'] = 32, }
	tablefield['andriod_password'] = { ['v'] = 32, }
	tablefield['k_id'] = { ['i'] = 11, }
	tablefield['arrears_warning'] = { ['i'] = 11, }
	tablefield['pref_pro'] = { ['v'] = 64, }
	tablefield['resource'] = { ['v'] = 64, }
	tablefield['rebates'] = { ['v'] = 20, }
	self:create_table( 'czy_customer', tablefield)
	self.idPair['customer'] = {}
	self.idPair['customer']['prev'] = '0'
	self.idPair['customer']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['money'] = { ['v'] = 12, }
	tablefield['rebates_money'] = { ['v'] = 12, }
	tablefield['margin_money'] = { ['v'] = 12, }
	self:create_table( 'czy_customeraccount', tablefield)
	self.idPair['customeraccount'] = {}
	self.idPair['customeraccount']['prev'] = '0'
	self.idPair['customeraccount']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['discount'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 20, }
	self:create_table( 'czy_customercategory', tablefield)
	self.idPair['customercategory'] = {}
	self.idPair['customercategory']['prev'] = '0'
	self.idPair['customercategory']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['fee_name'] = { ['v'] = 32, }
	tablefield['money'] = { ['v'] = 20, }
	tablefield['fee_note'] = { ['v'] = 20, }
	tablefield['fee_date'] = { ['v'] = 20, }
	tablefield['handler'] = { ['v'] = 32, }
	self:create_table( 'czy_customerfee', tablefield)
	self.idPair['customerfee'] = {}
	self.idPair['customerfee']['prev'] = '0'
	self.idPair['customerfee']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['disable'] = { ['i'] = 2, }
	self:create_table( 'czy_customerpinpai', tablefield)
	self.idPair['customerpinpai'] = {}
	self.idPair['customerpinpai']['prev'] = '0'
	self.idPair['customerpinpai']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['priority'] = { ['i'] = 11, }
	self:create_table( 'czy_customertype', tablefield)
	self.idPair['customertype'] = {}
	self.idPair['customertype']['prev'] = '0'
	self.idPair['customertype']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['group_id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['company'] = { ['v'] = 64, }
	tablefield['telephone'] = { ['v'] = 64, }
	tablefield['fax'] = { ['v'] = 64, }
	tablefield['line'] = { ['v'] = 64, }
	tablefield['delivery_code'] = { ['v'] = 32, }
	tablefield['package_count'] = { ['v'] = 6, }
	tablefield['package_shape'] = { ['v'] = 32, }
	tablefield['delivery_date'] = { ['v'] = 20, }
	tablefield['reach_date'] = { ['v'] = 32, }
	tablefield['cost'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 64, }
	tablefield['pic_url'] = { ['v'] = 64, }
	tablefield['is_received'] = { ['i'] = 2, }
	self:create_table( 'czy_deliveryinfo', tablefield)
	self.idPair['deliveryinfo'] = {}
	self.idPair['deliveryinfo']['prev'] = '0'
	self.idPair['deliveryinfo']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['group_code'] = { ['v'] = 32, }
	tablefield['money_sum'] = { ['v'] = 20, }
	tablefield['area'] = { ['v'] = 20, }
	tablefield['count'] = { ['i'] = 11, }
	tablefield['note'] = { ['v'] = 20, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['other_money'] = { ['v'] = 20, }
	tablefield['car_code'] = { ['v'] = 255, }
	tablefield['status'] = { ['v'] = 255, }
	tablefield['shipping_time'] = { ['v'] = 20, }
	tablefield['sales_time'] = { ['v'] = 20, }
	self:create_table( 'czy_deliveryordergroup', tablefield)
	self.idPair['deliveryordergroup'] = {}
	self.idPair['deliveryordergroup']['prev'] = '0'
	self.idPair['deliveryordergroup']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['brand_id'] = { ['i'] = 11, }
	tablefield['group_code'] = { ['v'] = 32, }
	tablefield['plan_code'] = { ['v'] = 32, }
	tablefield['product_batch'] = { ['v'] = 64, }
	tablefield['money_sum'] = { ['v'] = 12, }
	tablefield['rebates_money'] = { ['v'] = 12, }
	tablefield['rebates_ratio'] = { ['v'] = 12, }
	tablefield['discount'] = { ['v'] = 20, }
	tablefield['other_money'] = { ['v'] = 12, }
	tablefield['money_pay'] = { ['v'] = 12, }
	tablefield['money_get'] = { ['v'] = 12, }
	tablefield['money_left'] = { ['v'] = 12, }
	tablefield['pay_percent'] = { ['v'] = 20, }
	tablefield['area'] = { ['v'] = 20, }
	tablefield['count'] = { ['i'] = 11, }
	tablefield['note'] = { ['v'] = 20, }
	tablefield['buyer'] = { ['v'] = 64, }
	tablefield['buyer_phone'] = { ['v'] = 64, }
	tablefield['buyer_address'] = { ['v'] = 255, }
	tablefield['buyer_make'] = { ['v'] = 255, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['project_addr'] = { ['v'] = 128, }
	tablefield['other_money_name'] = { ['v'] = 64, }
	tablefield['other_money_note'] = { ['v'] = 20, }
	tablefield['preferential'] = { ['v'] = 12, }
	tablefield['balance_money'] = { ['v'] = 12, }
	tablefield['flag'] = { ['i'] = 1, }
	tablefield['status'] = { ['v'] = 255, }
	tablefield['pay_time'] = { ['v'] = 20, }
	tablefield['order_status'] = { ['v'] = 64, }
	tablefield['custime'] = { ['v'] = 20, }
	tablefield['fintime'] = { ['v'] = 20, }
	tablefield['start_time'] = { ['v'] = 20, }
	tablefield['duedong_time'] = { ['v'] = 20, }
	tablefield['due_date'] = { ['v'] = 20, }
	tablefield['finish_time'] = { ['v'] = 20, }
	tablefield['delivery_time'] = { ['v'] = 20, }
	tablefield['is_reminders'] = { ['i'] = 11, }
	tablefield['agent'] = { ['v'] = 50, }
	tablefield['delivery'] = { ['v'] = 64, }
	self:create_table( 'czy_financeordergroup', tablefield)
	self.idPair['financeordergroup'] = {}
	self.idPair['financeordergroup']['prev'] = '0'
	self.idPair['financeordergroup']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['company'] = { ['v'] = 255, }
	tablefield['due_time'] = { ['v'] = 20, }
	self:create_table( 'czy_license', tablefield)
	self.idPair['license'] = {}
	self.idPair['license']['prev'] = '0'
	self.idPair['license']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['login_time'] = { ['v'] = 20, }
	tablefield['login_user_id'] = { ['i'] = 11, }
	tablefield['ip'] = { ['v'] = 20, }
	tablefield['login_address'] = { ['v'] = 32, }
	tablefield['token'] = { ['v'] = 255, }
	tablefield['user_type'] = { ['i'] = 11, }
	tablefield['from'] = { ['v'] = 32, }
	self:create_table( 'czy_logininfo', tablefield)
	self.idPair['logininfo'] = {}
	self.idPair['logininfo']['prev'] = '0'
	self.idPair['logininfo']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['token'] = { ['v'] = 64, }
	tablefield['time'] = { ['i'] = 11, }
	self:create_table( 'czy_logintoken', tablefield)
	self.idPair['logintoken'] = {}
	self.idPair['logintoken']['prev'] = '0'
	self.idPair['logintoken']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 9, }
	tablefield['url'] = { ['v'] = 200, }
	tablefield['name'] = { ['v'] = 100, }
	tablefield['w_h'] = { ['v'] = 200, }
	tablefield['add_time'] = { ['v'] = 20, }
	tablefield['using'] = { ['i'] = 1, }
	self:create_table( 'czy_logo', tablefield)
	self.idPair['logo'] = {}
	self.idPair['logo']['prev'] = '0'
	self.idPair['logo']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 65, }
	tablefield['color'] = { ['v'] = 7, }
	tablefield['confirm'] = { ['i'] = 11, }
	tablefield['key'] = { ['i'] = 11, }
	tablefield['priority'] = { ['i'] = 11, }
	self:create_table( 'czy_marktype', tablefield)
	self.idPair['marktype'] = {}
	self.idPair['marktype']['prev'] = '0'
	self.idPair['marktype']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['type'] = { ['v'] = 200, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['h_content'] = { ['v'] = 255, }
	tablefield['content'] = { ['v'] = 255, }
	tablefield['f_content'] = { ['v'] = 255, }
	self:create_table( 'czy_msgtpl', tablefield)
	self.idPair['msgtpl'] = {}
	self.idPair['msgtpl']['prev'] = '0'
	self.idPair['msgtpl']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['group_id'] = { ['i'] = 11, }
	tablefield['finance_group_id'] = { ['i'] = 11, }
	tablefield['related_order_id'] = { ['i'] = 11, }
	tablefield['delivery_group_id'] = { ['i'] = 11, }
	tablefield['warehouse_id'] = { ['v'] = 256, }
	tablefield['brand_id'] = { ['i'] = 11, }
	tablefield['order_code'] = { ['v'] = 32, }
	tablefield['barcode'] = { ['v'] = 32, }
	tablefield['sub_code'] = { ['v'] = 32, }
	tablefield['plan_code'] = { ['v'] = 32, }
	tablefield['order_type'] = { ['i'] = 11, }
	tablefield['order_process_type'] = { ['i'] = 11, }
	tablefield['entire_type'] = { ['i'] = 11, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['buyer'] = { ['v'] = 64, }
	tablefield['buyer_phone'] = { ['v'] = 64, }
	tablefield['buyer_address'] = { ['v'] = 64, }
	tablefield['product_name'] = { ['v'] = 32, }
	tablefield['product_code'] = { ['v'] = 32, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['separator_script_id'] = { ['i'] = 11, }
	tablefield['height'] = { ['v'] = 64, }
	tablefield['width'] = { ['v'] = 64, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['price'] = { ['v'] = 20, }
	tablefield['area'] = { ['v'] = 20, }
	tablefield['weight'] = { ['v'] = 20, }
	tablefield['count'] = { ['i'] = 11, }
	tablefield['cost'] = { ['v'] = 13, }
	tablefield['loss_cost'] = { ['v'] = 13, }
	tablefield['money_sum'] = { ['v'] = 20, }
	tablefield['discount'] = { ['v'] = 20, }
	tablefield['money'] = { ['v'] = 20, }
	tablefield['pay_percent'] = { ['v'] = 20, }
	tablefield['customer_note'] = { ['v'] = 20, }
	tablefield['work_note'] = { ['v'] = 64, }
	tablefield['return_note'] = { ['v'] = 64, }
	tablefield['delivery'] = { ['v'] = 64, }
	tablefield['handler'] = { ['v'] = 64, }
	tablefield['erect'] = { ['i'] = 1, }
	tablefield['is_erect'] = { ['i'] = 1, }
	tablefield['order_time'] = { ['v'] = 20, }
	tablefield['erect_date'] = { ['v'] = 20, }
	tablefield['erector'] = { ['v'] = 10, }
	tablefield['erect_remark'] = { ['v'] = 30, }
	tablefield['due_time'] = { ['v'] = 20, }
	tablefield['duedong_time'] = { ['v'] = 20, }
	tablefield['finish_time'] = { ['v'] = 20, }
	tablefield['delivery_time'] = { ['v'] = 20, }
	tablefield['edit_time'] = { ['v'] = 20, }
	tablefield['is_due_time'] = { ['i'] = 1, }
	tablefield['shipping_time'] = { ['v'] = 20, }
	tablefield['sales_time'] = { ['v'] = 20, }
	tablefield['freeze'] = { ['i'] = 1, }
	tablefield['freeze_why'] = { ['v'] = 20, }
	tablefield['request_product'] = { ['i'] = 1, }
	tablefield['all_done'] = { ['i'] = 1, }
	tablefield['exception'] = { ['i'] = 1, }
	tablefield['status'] = { ['v'] = 64, }
	tablefield['finstatus'] = { ['v'] = 255, }
	tablefield['try_uid'] = { ['i'] = 11, }
	tablefield['start_time'] = { ['v'] = 20, }
	tablefield['change_image_id'] = { ['i'] = 11, }
	tablefield['msg_flag'] = { ['v'] = 64, }
	tablefield['show_image_id'] = { ['i'] = 11, }
	tablefield['plan_note'] = { ['v'] = 255, }
	tablefield['custime'] = { ['v'] = 20, }
	tablefield['fintime'] = { ['v'] = 20, }
	tablefield['is_library'] = { ['i'] = 1, }
	tablefield['is_delivery'] = { ['i'] = 1, }
	tablefield['kshow_order_id'] = { ['i'] = 11, }
	tablefield['customer_order_id'] = { ['i'] = 11, }
	tablefield['merge_detail_id'] = { ['i'] = 11, }
	tablefield['is_multi_pkgcmpt'] = { ['i'] = 2, }
	tablefield['order_type_note'] = { ['v'] = 64, }
	tablefield['carveid'] = { ['i'] = 11, }
	tablefield['carve_name'] = { ['v'] = 255, }
	self:create_table( 'czy_order', tablefield)
	self.idPair['order'] = {}
	self.idPair['order']['prev'] = '0'
	self.idPair['order']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['label'] = { ['v'] = 64, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['is_separator'] = { ['i'] = 2, }
	tablefield['value'] = { ['v'] = 20, }
	tablefield['price'] = { ['v'] = 20, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['format_rule_id'] = { ['i'] = 11, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['role'] = { ['v'] = 32, }
	tablefield['user_id'] = { ['i'] = 11, }
	self:create_table( 'czy_orderattr', tablefield)
	self.idPair['orderattr'] = {}
	self.idPair['orderattr']['prev'] = '0'
	self.idPair['orderattr']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['v'] = 32, }
	tablefield['label'] = { ['v'] = 64, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['combox_list'] = { ['v'] = 20, }
	tablefield['price_list'] = { ['v'] = 20, }
	tablefield['auto_value'] = { ['v'] = 64, }
	tablefield['role'] = { ['v'] = 32, }
	tablefield['rule_type'] = { ['i'] = 1, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['editable'] = { ['i'] = 1, }
	tablefield['global_format_id'] = { ['i'] = 11, }
	tablefield['is_preval'] = { ['i'] = 11, }
	self:create_table( 'czy_orderformat', tablefield)
	self.idPair['orderformat'] = {}
	self.idPair['orderformat']['prev'] = '0'
	self.idPair['orderformat']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['handler'] = { ['v'] = 32, }
	tablefield['uid'] = { ['i'] = 11, }
	self:create_table( 'czy_orderlog', tablefield)
	self.idPair['orderlog'] = {}
	self.idPair['orderlog']['prev'] = '0'
	self.idPair['orderlog']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['type'] = { ['v'] = 32, }
	tablefield['name'] = { ['v'] = 65, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['handler'] = { ['v'] = 65, }
	tablefield['handler_id'] = { ['i'] = 11, }
	self:create_table( 'czy_ordermark', tablefield)
	self.idPair['ordermark'] = {}
	self.idPair['ordermark']['prev'] = '0'
	self.idPair['ordermark']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['thing_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['count'] = { ['v'] = 20, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['total'] = { ['v'] = 20, }
	tablefield['realtotal'] = { ['v'] = 20, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 11, }
	tablefield['spec'] = { ['v'] = 64, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['is_auto'] = { ['i'] = 1, }
	self:create_table( 'czy_outitemaddon', tablefield)
	self.idPair['outitemaddon'] = {}
	self.idPair['outitemaddon']['prev'] = '0'
	self.idPair['outitemaddon']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['thing_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['pos'] = { ['v'] = 16, }
	tablefield['size'] = { ['v'] = 20, }
	tablefield['count'] = { ['v'] = 20, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['material_length'] = { ['i'] = 13, }
	tablefield['total'] = { ['v'] = 20, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 11, }
	tablefield['spec'] = { ['v'] = 22, }
	tablefield['realtotal'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['type'] = { ['v'] = 20, }
	tablefield['is_auto'] = { ['i'] = 1, }
	self:create_table( 'czy_outitembom', tablefield)
	self.idPair['outitembom'] = {}
	self.idPair['outitembom']['prev'] = '0'
	self.idPair['outitembom']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['height'] = { ['v'] = 20, }
	tablefield['width'] = { ['v'] = 20, }
	tablefield['thick'] = { ['v'] = 20, }
	tablefield['count'] = { ['i'] = 11, }
	tablefield['suit'] = { ['i'] = 11, }
	tablefield['type'] = { ['i'] = 1, }
	self:create_table( 'czy_outitemdoor', tablefield)
	self.idPair['outitemdoor'] = {}
	self.idPair['outitemdoor']['prev'] = '0'
	self.idPair['outitemdoor']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['quantity'] = { ['v'] = 20, }
	tablefield['discount'] = { ['v'] = 200, }
	tablefield['price'] = { ['v'] = 20, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['money'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 40, }
	tablefield['priority'] = { ['v'] = 11, }
	tablefield['tip'] = { ['v'] = 20, }
	tablefield['is_auto'] = { ['i'] = 1, }
	self:create_table( 'czy_outitemmoney', tablefield)
	self.idPair['outitemmoney'] = {}
	self.idPair['outitemmoney']['prev'] = '0'
	self.idPair['outitemmoney']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['thing_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['height'] = { ['v'] = 20, }
	tablefield['width'] = { ['v'] = 20, }
	tablefield['count'] = { ['i'] = 13, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['total'] = { ['v'] = 20, }
	tablefield['thick'] = { ['i'] = 12, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 11, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['type'] = { ['v'] = 10, }
	tablefield['is_auto'] = { ['i'] = 1, }
	self:create_table( 'czy_outitempanel', tablefield)
	self.idPair['outitempanel'] = {}
	self.idPair['outitempanel']['prev'] = '0'
	self.idPair['outitempanel']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['group'] = { ['v'] = 32, }
	tablefield['item'] = { ['v'] = 255, }
	tablefield['memo'] = { ['v'] = 255, }
	self:create_table( 'czy_param', tablefield)
	self.idPair['param'] = {}
	self.idPair['param']['prev'] = '0'
	self.idPair['param']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['role_id'] = { ['i'] = 11, }
	tablefield['action_id'] = { ['i'] = 11, }
	self:create_table( 'czy_privilege', tablefield)
	self.idPair['privilege'] = {}
	self.idPair['privilege']['prev'] = '0'
	self.idPair['privilege']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['note'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 20, }
	self:create_table( 'czy_privilegeaction', tablefield)
	self.idPair['privilegeaction'] = {}
	self.idPair['privilegeaction']['prev'] = '0'
	self.idPair['privilegeaction']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['step_id'] = { ['i'] = 3, }
	tablefield['order_id'] = { ['i'] = 16, }
	tablefield['order_code'] = { ['v'] = 255, }
	tablefield['entire_type'] = { ['i'] = 4, }
	tablefield['quantity'] = { ['v'] = 13, }
	tablefield['price'] = { ['v'] = 11, }
	tablefield['money'] = { ['v'] = 14, }
	tablefield['worker_id'] = { ['i'] = 11, }
	tablefield['worker'] = { ['v'] = 64, }
	tablefield['status'] = { ['i'] = 4, }
	tablefield['start_time'] = { ['v'] = 20, }
	tablefield['time'] = { ['i'] = 3, }
	tablefield['finish_date'] = { ['v'] = 20, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['complete_date'] = { ['v'] = 20, }
	tablefield['line'] = { ['i'] = 2, }
	tablefield['product_name'] = { ['v'] = 32, }
	tablefield['product_code'] = { ['v'] = 32, }
	tablefield['customer_name'] = { ['v'] = 32, }
	tablefield['order_status'] = { ['v'] = 64, }
	tablefield['handler_id'] = { ['i'] = 11, }
	tablefield['handler'] = { ['v'] = 32, }
	self:create_table( 'czy_process', tablefield)
	self.idPair['process'] = {}
	self.idPair['process']['prev'] = '0'
	self.idPair['process']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['group_id'] = { ['i'] = 11, }
	tablefield['step_id'] = { ['i'] = 11, }
	tablefield['step_name'] = { ['v'] = 64, }
	tablefield['line'] = { ['i'] = 11, }
	tablefield['receive_count'] = { ['i'] = 11, }
	tablefield['delivery_count'] = { ['i'] = 11, }
	tablefield['update_time'] = { ['v'] = 20, }
	self:create_table( 'czy_processgroup', tablefield)
	self.idPair['processgroup'] = {}
	self.idPair['processgroup']['prev'] = '0'
	self.idPair['processgroup']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 22, }
	tablefield['step_type'] = { ['i'] = 11, }
	tablefield['scan_id'] = { ['v'] = 2, }
	tablefield['scan_id_fan'] = { ['v'] = 4, }
	tablefield['scan_id_case'] = { ['v'] = 4, }
	tablefield['entire_type'] = { ['i'] = 4, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['piece_method'] = { ['i'] = 4, }
	tablefield['unit_price'] = { ['v'] = 20, }
	tablefield['default_worker'] = { ['i'] = 11, }
	tablefield['finish'] = { ['i'] = 1, }
	tablefield['priority'] = { ['v'] = 12, }
	tablefield['start_date'] = { ['v'] = 11, }
	tablefield['start_date_type'] = { ['i'] = 3, }
	tablefield['date'] = { ['v'] = 12, }
	tablefield['line'] = { ['i'] = 2, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['rename'] = { ['v'] = 22, }
	tablefield['to_delivery'] = { ['i'] = 1, }
	tablefield['forbidden'] = { ['i'] = 1, }
	tablefield['system_type'] = { ['i'] = 11, }
	self:create_table( 'czy_processstep', tablefield)
	self.idPair['processstep'] = {}
	self.idPair['processstep']['prev'] = '0'
	self.idPair['processstep']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 8, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['photo_id'] = { ['i'] = 11, }
	tablefield['step_id'] = { ['i'] = 11, }
	tablefield['step_name'] = { ['v'] = 30, }
	tablefield['step_price'] = { ['v'] = 255, }
	tablefield['quantity'] = { ['v'] = 255, }
	tablefield['son_count'] = { ['v'] = 11, }
	tablefield['money'] = { ['v'] = 20, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['priority'] = { ['i'] = 11, }
	tablefield['line'] = { ['i'] = 2, }
	self:create_table( 'czy_processstepprice', tablefield)
	self.idPair['processstepprice'] = {}
	self.idPair['processstepprice']['prev'] = '0'
	self.idPair['processstepprice']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 256, }
	self:create_table( 'czy_region', tablefield)
	self.idPair['region'] = {}
	self.idPair['region']['prev'] = '0'
	self.idPair['region']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['cid'] = { ['i'] = 11, }
	tablefield['pid'] = { ['i'] = 11, }
	tablefield['max_value'] = { ['v'] = 16, }
	tablefield['min_value'] = { ['v'] = 16, }
	tablefield['last_value'] = { ['v'] = 16, }
	self:create_table( 'czy_rememberprice', tablefield)
	self.idPair['rememberprice'] = {}
	self.idPair['rememberprice']['prev'] = '0'
	self.idPair['rememberprice']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['filename'] = { ['v'] = 64, }
	tablefield['update_time'] = { ['v'] = 20, }
	tablefield['last_update_user_id'] = { ['i'] = 11, }
	tablefield['confirm'] = { ['i'] = 2, }
	tablefield['count'] = { ['i'] = 11, }
	tablefield['prefix'] = { ['v'] = 255, }
	tablefield['color'] = { ['v'] = 7, }
	tablefield['app_key'] = { ['v'] = 32, }
	tablefield['priority'] = { ['i'] = 11, }
	tablefield['printSql'] = { ['v'] = 20, }
	tablefield['printSql_name'] = { ['v'] = 20, }
	tablefield['force'] = { ['i'] = 2, }
	tablefield['print_time'] = { ['v'] = 20, }
	tablefield['y_count'] = { ['i'] = 11, }
	tablefield['m_count'] = { ['i'] = 11, }
	tablefield['d_count'] = { ['i'] = 11, }
	self:create_table( 'czy_reportfile', tablefield)
	self.idPair['reportfile'] = {}
	self.idPair['reportfile']['prev'] = '0'
	self.idPair['reportfile']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	self:create_table( 'czy_role', tablefield)
	self.idPair['role'] = {}
	self.idPair['role']['prev'] = '0'
	self.idPair['role']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['default_value'] = { ['v'] = 13, }
	tablefield['fixed'] = { ['i'] = 1, }
	self:create_table( 'czy_salaryformat', tablefield)
	self.idPair['salaryformat'] = {}
	self.idPair['salaryformat']['prev'] = '0'
	self.idPair['salaryformat']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['group_id'] = { ['i'] = 11, }
	tablefield['format_id'] = { ['i'] = 11, }
	tablefield['separator'] = { ['i'] = 2, }
	tablefield['separator_list'] = { ['v'] = 20, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['note'] = { ['v'] = 64, }
	tablefield['thumb_url'] = { ['v'] = 200, }
	tablefield['photo_url'] = { ['v'] = 200, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['tags'] = { ['v'] = 255, }
	tablefield['f_id'] = { ['i'] = 11, }
	tablefield['is_lock'] = { ['i'] = 2, }
	tablefield['margin'] = { ['v'] = 6, }
	tablefield['script_type'] = { ['i'] = 11, }
	tablefield['global_format'] = { ['v'] = 255, }
	self:create_table( 'czy_script', tablefield)
	self.idPair['script'] = {}
	self.idPair['script']['prev'] = '0'
	self.idPair['script']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_row_id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['count'] = { ['v'] = 64, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['total'] = { ['v'] = 64, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['coordinate'] = { ['v'] = 16, }
	tablefield['print_condition'] = { ['v'] = 100, }
	tablefield['print'] = { ['i'] = 1, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['spec'] = { ['v'] = 22, }
	tablefield['note'] = { ['v'] = 255, }
	self:create_table( 'czy_scriptaddon', tablefield)
	self.idPair['scriptaddon'] = {}
	self.idPair['scriptaddon']['prev'] = '0'
	self.idPair['scriptaddon']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['area'] = { ['v'] = 60, }
	tablefield['min_area'] = { ['v'] = 100, }
	tablefield['cost'] = { ['v'] = 60, }
	self:create_table( 'czy_scriptarea', tablefield)
	self.idPair['scriptarea'] = {}
	self.idPair['scriptarea']['prev'] = '0'
	self.idPair['scriptarea']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['file_name'] = { ['v'] = 255, }
	tablefield['file_path'] = { ['v'] = 255, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['handler'] = { ['v'] = 64, }
	tablefield['note'] = { ['v'] = 255, }
	self:create_table( 'czy_scriptbackup', tablefield)
	self.idPair['scriptbackup'] = {}
	self.idPair['scriptbackup']['prev'] = '0'
	self.idPair['scriptbackup']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_row_id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['formula'] = { ['v'] = 90, }
	tablefield['count'] = { ['v'] = 64, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['total'] = { ['v'] = 64, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['coordinate'] = { ['v'] = 16, }
	tablefield['print_condition'] = { ['v'] = 100, }
	tablefield['print'] = { ['i'] = 1, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['spec'] = { ['v'] = 22, }
	tablefield['note'] = { ['v'] = 255, }
	self:create_table( 'czy_scriptbom', tablefield)
	self.idPair['scriptbom'] = {}
	self.idPair['scriptbom']['prev'] = '0'
	self.idPair['scriptbom']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['height_name'] = { ['v'] = 32, }
	tablefield['height_value'] = { ['v'] = 64, }
	tablefield['width_name'] = { ['v'] = 64, }
	tablefield['width_value'] = { ['v'] = 32, }
	tablefield['thick_name'] = { ['v'] = 64, }
	tablefield['thick_value'] = { ['v'] = 64, }
	tablefield['count_value'] = { ['v'] = 100, }
	tablefield['count_name'] = { ['v'] = 100, }
	tablefield['suit'] = { ['i'] = 11, }
	tablefield['type'] = { ['i'] = 1, }
	self:create_table( 'czy_scriptdoor', tablefield)
	self.idPair['scriptdoor'] = {}
	self.idPair['scriptdoor']['prev'] = '0'
	self.idPair['scriptdoor']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['f_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['priority'] = { ['v'] = 20, }
	self:create_table( 'czy_scriptgroup', tablefield)
	self.idPair['scriptgroup'] = {}
	self.idPair['scriptgroup']['prev'] = '0'
	self.idPair['scriptgroup']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 60, }
	tablefield['price'] = { ['v'] = 100, }
	tablefield['quantity'] = { ['v'] = 200, }
	tablefield['discount'] = { ['v'] = 200, }
	tablefield['unit'] = { ['v'] = 30, }
	tablefield['print_condition'] = { ['v'] = 200, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 255, }
	self:create_table( 'czy_scriptmoney', tablefield)
	self.idPair['scriptmoney'] = {}
	self.idPair['scriptmoney']['prev'] = '0'
	self.idPair['scriptmoney']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 32, }
	tablefield['height'] = { ['v'] = 128, }
	tablefield['width'] = { ['v'] = 128, }
	tablefield['count'] = { ['v'] = 64, }
	tablefield['unit'] = { ['v'] = 10, }
	tablefield['cost'] = { ['v'] = 128, }
	tablefield['item'] = { ['v'] = 64, }
	tablefield['total'] = { ['v'] = 64, }
	tablefield['thick'] = { ['v'] = 64, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['print_condition'] = { ['v'] = 64, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['note'] = { ['v'] = 255, }
	self:create_table( 'czy_scriptpanel', tablefield)
	self.idPair['scriptpanel'] = {}
	self.idPair['scriptpanel']['prev'] = '0'
	self.idPair['scriptpanel']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 8, }
	tablefield['photo_id'] = { ['i'] = 11, }
	tablefield['step_id'] = { ['i'] = 11, }
	tablefield['step_name'] = { ['v'] = 30, }
	tablefield['step_price'] = { ['v'] = 255, }
	tablefield['disable'] = { ['i'] = 1, }
	tablefield['quantity'] = { ['v'] = 255, }
	tablefield['son_count'] = { ['v'] = 255, }
	tablefield['condition'] = { ['v'] = 255, }
	tablefield['priority'] = { ['i'] = 11, }
	tablefield['line'] = { ['i'] = 2, }
	tablefield['line_condition'] = { ['v'] = 255, }
	tablefield['disable_sub'] = { ['i'] = 1, }
	self:create_table( 'czy_scriptprocessstepprice', tablefield)
	self.idPair['scriptprocessstepprice'] = {}
	self.idPair['scriptprocessstepprice']['prev'] = '0'
	self.idPair['scriptprocessstepprice']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 20, }
	tablefield['priority'] = { ['v'] = 20, }
	tablefield['tb_type'] = { ['i'] = 1, }
	self:create_table( 'czy_scriptvar', tablefield)
	self.idPair['scriptvar'] = {}
	self.idPair['scriptvar']['prev'] = '0'
	self.idPair['scriptvar']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['script_var_id'] = { ['i'] = 11, }
	tablefield['condition'] = { ['v'] = 20, }
	tablefield['formula'] = { ['v'] = 20, }
	tablefield['priority'] = { ['v'] = 20, }
	self:create_table( 'czy_scriptvaritem', tablefield)
	self.idPair['scriptvaritem'] = {}
	self.idPair['scriptvaritem']['prev'] = '0'
	self.idPair['scriptvaritem']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['order_id'] = { ['i'] = 11, }
	tablefield['status'] = { ['v'] = 32, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['user_id'] = { ['i'] = 11, }
	tablefield['target_time'] = { ['v'] = 20, }
	self:create_table( 'czy_statuslog', tablefield)
	self.idPair['statuslog'] = {}
	self.idPair['statuslog']['prev'] = '0'
	self.idPair['statuslog']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['script_id'] = { ['i'] = 11, }
	tablefield['img_url'] = { ['v'] = 255, }
	self:create_table( 'czy_swing', tablefield)
	self.idPair['swing'] = {}
	self.idPair['swing']['prev'] = '0'
	self.idPair['swing']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['var_name'] = { ['v'] = 60, }
	tablefield['class_name'] = { ['v'] = 60, }
	tablefield['note'] = { ['v'] = 20, }
	tablefield['switch_class'] = { ['v'] = 60, }
	self:create_table( 'czy_switch', tablefield)
	self.idPair['switch'] = {}
	self.idPair['switch']['prev'] = '0'
	self.idPair['switch']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['card_no'] = { ['v'] = 32, }
	tablefield['money'] = { ['v'] = 20, }
	self:create_table( 'czy_systemaccount', tablefield)
	self.idPair['systemaccount'] = {}
	self.idPair['systemaccount']['prev'] = '0'
	self.idPair['systemaccount']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['title'] = { ['v'] = 255, }
	tablefield['user_id'] = { ['i'] = 11, }
	tablefield['username'] = { ['v'] = 100, }
	tablefield['create_time'] = { ['v'] = 20, }
	self:create_table( 'czy_systemlog', tablefield)
	self.idPair['systemlog'] = {}
	self.idPair['systemlog']['prev'] = '0'
	self.idPair['systemlog']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['key_code'] = { ['v'] = 128, }
	tablefield['is_used'] = { ['i'] = 1, }
	self:create_table( 'czy_timeoutkey', tablefield)
	self.idPair['timeoutkey'] = {}
	self.idPair['timeoutkey']['prev'] = '0'
	self.idPair['timeoutkey']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['trade_code'] = { ['v'] = 64, }
	tablefield['customer_id'] = { ['i'] = 11, }
	tablefield['user_id'] = { ['i'] = 11, }
	tablefield['supplier_id'] = { ['i'] = 11, }
	tablefield['finance_order_group_id'] = { ['i'] = 11, }
	tablefield['sell_id'] = { ['i'] = 11, }
	tablefield['purchase_id'] = { ['i'] = 11, }
	tablefield['purchase_order_id'] = { ['i'] = 11, }
	tablefield['record_group_id'] = { ['i'] = 11, }
	tablefield['last_money_account'] = { ['i'] = 19, }
	tablefield['money'] = { ['i'] = 19, }
	tablefield['next_money_account'] = { ['i'] = 19, }
	tablefield['discount'] = { ['v'] = 20, }
	tablefield['preferential'] = { ['v'] = 20, }
	tablefield['is_from_customer_account'] = { ['i'] = 2, }
	tablefield['is_recharge'] = { ['i'] = 2, }
	tablefield['money_name'] = { ['v'] = 64, }
	tablefield['money_type'] = { ['v'] = 64, }
	tablefield['money_project_id'] = { ['i'] = 11, }
	tablefield['system_account_id'] = { ['i'] = 11, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['receiver'] = { ['v'] = 32, }
	tablefield['payer'] = { ['v'] = 32, }
	tablefield['handler_uid'] = { ['i'] = 11, }
	tablefield['voucher'] = { ['v'] = 255, }
	tablefield['status'] = { ['i'] = 1, }
	tablefield['assignee_uid'] = { ['i'] = 11, }
	tablefield['account_before_money'] = { ['i'] = 18, }
	tablefield['fill_time'] = { ['v'] = 20, }
	tablefield['accepter'] = { ['v'] = 20, }
	self:create_table( 'czy_traderecord', tablefield)
	self.idPair['traderecord'] = {}
	self.idPair['traderecord']['prev'] = '0'
	self.idPair['traderecord']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['key'] = { ['v'] = 255, }
	tablefield['val'] = { ['i'] = 1, }
	tablefield['msg'] = { ['v'] = 500, }
	tablefield['create_time'] = { ['v'] = 20, }
	self:create_table( 'czy_upgradelog', tablefield)
	self.idPair['upgradelog'] = {}
	self.idPair['upgradelog']['prev'] = '0'
	self.idPair['upgradelog']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['username'] = { ['v'] = 32, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['login_time'] = { ['v'] = 20, }
	tablefield['role'] = { ['v'] = 32, }
	tablefield['user_type'] = { ['v'] = 32, }
	tablefield['last_active'] = { ['v'] = 12, }
	tablefield['master'] = { ['i'] = 1, }
	tablefield['expire'] = { ['v'] = 20, }
	tablefield['andriod_password'] = { ['v'] = 32, }
	tablefield['visit'] = { ['v'] = 32, }
	tablefield['sex'] = { ['v'] = 11, }
	tablefield['photo'] = { ['v'] = 32, }
	self:create_table( 'czy_user', tablefield)
	self.idPair['user'] = {}
	self.idPair['user']['prev'] = '0'
	self.idPair['user']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['user_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['yuexin'] = { ['v'] = 11, }
	tablefield['gongzi'] = { ['v'] = 11, }
	tablefield['zhiwu'] = { ['v'] = 11, }
	tablefield['nianjia'] = { ['v'] = 11, }
	tablefield['jiaban'] = { ['v'] = 11, }
	tablefield['shisu'] = { ['v'] = 11, }
	tablefield['quanqin'] = { ['v'] = 11, }
	tablefield['baoxian'] = { ['v'] = 11, }
	tablefield['other'] = { ['v'] = 11, }
	tablefield['queqin'] = { ['v'] = 11, }
	tablefield['queqin_day'] = { ['v'] = 20, }
	tablefield['ticheng'] = { ['v'] = 11, }
	tablefield['jixiao'] = { ['v'] = 11, }
	tablefield['yanfa'] = { ['v'] = 11, }
	tablefield['yingfae'] = { ['v'] = 11, }
	tablefield['geshui'] = { ['v'] = 11, }
	tablefield['shifae'] = { ['v'] = 11, }
	tablefield['month'] = { ['v'] = 255, }
	tablefield['update_time'] = { ['v'] = 20, }
	self:create_table( 'czy_wage', tablefield)
	self.idPair['wage'] = {}
	self.idPair['wage']['prev'] = '0'
	self.idPair['wage']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['note'] = { ['v'] = 32, }
	tablefield['type'] = { ['v'] = 32, }
	tablefield['barcode'] = { ['v'] = 20, }
	self:create_table( 'czy_warehouse', tablefield)
	self.idPair['warehouse'] = {}
	self.idPair['warehouse']['prev'] = '0'
	self.idPair['warehouse']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['type'] = { ['v'] = 200, }
	tablefield['name'] = { ['v'] = 255, }
	tablefield['h_content'] = { ['v'] = 255, }
	tablefield['content'] = { ['v'] = 255, }
	tablefield['f_content'] = { ['v'] = 255, }
	tablefield['lateday'] = { ['i'] = 11, }
	tablefield['getpeople'] = { ['v'] = 255, }
	tablefield['orderid'] = { ['i'] = 11, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['statu'] = { ['v'] = 32, }
	tablefield['uid'] = { ['i'] = 11, }
	self:create_table( 'czy_warnmsgtpl', tablefield)
	self.idPair['warnmsgtpl'] = {}
	self.idPair['warnmsgtpl']['prev'] = '0'
	self.idPair['warnmsgtpl']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['isopen'] = { ['i'] = 2, }
	self:create_table( 'czy_weixinpower', tablefield)
	self.idPair['weixinpower'] = {}
	self.idPair['weixinpower']['prev'] = '0'
	self.idPair['weixinpower']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 128, }
	tablefield['type_id'] = { ['i'] = 11, }
	tablefield['who_can'] = { ['v'] = 255, }
	tablefield['priority'] = { ['i'] = 3, }
	tablefield['f_id'] = { ['i'] = 11, }
	self:create_table( 'czy_whlist', tablefield)
	self.idPair['whlist'] = {}
	self.idPair['whlist']['prev'] = '0'
	self.idPair['whlist']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['list_id'] = { ['i'] = 10, }
	tablefield['wh_id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 64, }
	tablefield['unit'] = { ['v'] = 36, }
	tablefield['spec'] = { ['v'] = 64, }
	tablefield['length'] = { ['i'] = 12, }
	tablefield['width'] = { ['i'] = 12, }
	tablefield['thick'] = { ['i'] = 12, }
	tablefield['origin'] = { ['v'] = 36, }
	tablefield['quality'] = { ['v'] = 255, }
	tablefield['color'] = { ['v'] = 64, }
	tablefield['profile_thumb_url'] = { ['v'] = 255, }
	tablefield['profile_file_url'] = { ['v'] = 255, }
	tablefield['cost_price'] = { ['i'] = 12, }
	tablefield['sale_price'] = { ['i'] = 12, }
	tablefield['min_inventory'] = { ['i'] = 17, }
	tablefield['bom_code'] = { ['v'] = 32, }
	tablefield['color_code'] = { ['v'] = 55, }
	tablefield['inventory'] = { ['i'] = 18, }
	tablefield['warning_inventory'] = { ['i'] = 18, }
	tablefield['max_inventory'] = { ['i'] = 17, }
	tablefield['freeze_inventory'] = { ['i'] = 12, }
	tablefield['note'] = { ['v'] = 255, }
	tablefield['barcode'] = { ['v'] = 20, }
	tablefield['update_time'] = { ['v'] = 20, }
	tablefield['inOut_time'] = { ['v'] = 20, }
	tablefield['create_time'] = { ['v'] = 20, }
	tablefield['check_inventory_time'] = { ['v'] = 20, }
	tablefield['photo_data'] = { ['v'] = 20, }
	self:create_table( 'czy_whpanel', tablefield)
	self.idPair['whpanel'] = {}
	self.idPair['whpanel']['prev'] = '0'
	self.idPair['whpanel']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 11, }
	tablefield['name'] = { ['v'] = 128, }
	self:create_table( 'czy_whtype', tablefield)
	self.idPair['whtype'] = {}
	self.idPair['whtype']['prev'] = '0'
	self.idPair['whtype']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 4, }
	tablefield['area_id'] = { ['v'] = 6, }
	tablefield['area'] = { ['v'] = 40, }
	tablefield['father_id'] = { ['v'] = 6, }
	tablefield['py'] = { ['v'] = 255, }
	tablefield['py_head'] = { ['v'] = 255, }
	self:create_table( 'czy_warea', tablefield)
	self.idPair['warea'] = {}
	self.idPair['warea']['prev'] = '0'
	self.idPair['warea']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 4, }
	tablefield['city_id'] = { ['v'] = 6, }
	tablefield['city'] = { ['v'] = 40, }
	tablefield['father_id'] = { ['v'] = 6, }
	tablefield['py'] = { ['v'] = 255, }
	tablefield['py_head'] = { ['v'] = 255, }
	self:create_table( 'czy_wcity', tablefield)
	self.idPair['wcity'] = {}
	self.idPair['wcity']['prev'] = '0'
	self.idPair['wcity']['next'] = '0'
	----------------------------------------------------
	local tablefield = {}
	tablefield['id'] = { ['i'] = 4, }
	tablefield['province_id'] = { ['v'] = 6, }
	tablefield['province'] = { ['v'] = 40, }
	tablefield['py'] = { ['v'] = 255, }
	tablefield['py_head'] = { ['v'] = 255, }
	self:create_table( 'czy_wprovince', tablefield)
	self.idPair['wprovince'] = {}
	self.idPair['wprovince']['prev'] = '0'
	self.idPair['wprovince']['next'] = '0'
	----------------------------------------------------
	           
	self:initTableStruct()
	
end


-- 获取公式类型 http://110.41.160.209/mc2/src/?r=script/index&gid=4&ajax=groups
--[[ "id" "f_id" "name" "priority" ]]
czynet.script_groups = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.script_groups'
	
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	
	gxo_curl(self.base..'r=script/index&gid='..tostring(tb.gid)..'&ajax=groups'..'&prj='..g_mainModule ,function(netdata)	
				table.print(netdata)
				local data = netdata['value']
				if data ~= nil and table.size(data) > 0 then
					top.tablename = 'czy_script_groups'	
					for a,b in GSortedPairs4(data) do
						top:SetDirty(true)
						b['data'] = TableToString(b)
						top:AddorUpdateRecord('id',b)
					end
				end	
				top:SetDirty(true)
				top:handle_callback(callbackey,top.tablename,tb,netdata)				
		end,tb)	
		
	return self.table,callbackey		
end




-- 登录 http://110.41.160.209/mc2/src/?r=login/login
--[[ "id" "f_id" "name" "priority" ]]
czynet.login = function(self,tb)
	local top = self
	self.tablename = 'czy_user'	
	local callbackey = 'czynet.login'
	
	if tb == nil then
		local tb = {}
		tb.username 	= ''
		tb.password 	= ''
		return top.table,callbackey,tb
	end
	
	gxo_curl(self.base..'r=login/login&ajax=all&prj='..g_mainModule ,function(netdata)
				print('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ czynet.login')
				table.print(netdata)

				if netdata['error'] == 0 and netdata['success'] == 2 and table.size(netdata['user']) > 0 then
					top.tablename = 'czy_user'	
					top:AddorUpdateRecord('id',netdata['user'])
					top.tablename = 'czy_logininfo'	
					netdata['logininfo']['id'] = netdata['logininfo']['loginid']
					top:AddorUpdateRecord('id',netdata['logininfo'])
				end	

				top:SetDirty(true)
				top:handle_callback(callbackey,top.tablename,tb,netdata)				
		end,tb)	
		
	return self.table,callbackey		
end



czynet.Account_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_GetLastTrade = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_GetLastTrade'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/GetLastTrade&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_FinanceCdos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_FinanceCdos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/FinanceCdos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_DelCdos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_DelCdos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/DelCdos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_ChangeCdosStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_ChangeCdosStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/ChangeCdosStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_AddFinanceCdos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_AddFinanceCdos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/AddFinanceCdos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_Finance = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_Finance'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/Finance&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Account_RunningAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Account_RunningAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Account/RunningAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_Survey = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_Survey'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/Survey&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_Add = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_Add'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/Add&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_SaveAdd = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_SaveAdd'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/SaveAdd&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_editSurveyor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_editSurveyor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/editSurveyor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_editNote = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_editNote'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/editNote&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AfterSales_changeStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AfterSales_changeStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AfterSales/changeStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_finacepic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_finacepic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/finacepic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_orderpic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_orderpic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/orderpic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_workingpic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_workingpic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/workingpic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_productpic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_productpic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/productpic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_warehousepic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_warehousepic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/warehousepic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_statisticspic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_statisticspic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/statisticspic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_warnpic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_warnpic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/warnpic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_mainpic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_mainpic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/mainpic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_helppic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_helppic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/helppic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_slideIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_slideIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/slideIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_slide = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_slide'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/slide&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_slide2 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_slide2'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/slide2&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_slide3 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_slide3'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/slide3&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Export = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Export'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Export&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_UploadPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_UploadPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/UploadPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Confirm = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Confirm'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Confirm&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_SetCall = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_SetCall'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/SetCall&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Power = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Power'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Power&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_SetPower = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_SetPower'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/SetPower&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Message = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Message'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Message&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_GetCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_GetCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/GetCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_MsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_MsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/MsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_SaveMsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_SaveMsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/SaveMsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_delMsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_delMsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/delMsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_AddWeixinMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_AddWeixinMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/AddWeixinMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Updatemail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Updatemail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Updatemail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_MsgList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_MsgList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/MsgList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_DelMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_DelMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/DelMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_Notification = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_Notification'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/Notification&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_AddCustNotification = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_AddCustNotification'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/AddCustNotification&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_NotifyList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_NotifyList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/NotifyList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_DelNotify = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_DelNotify'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/DelNotify&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodCenter_FindCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodCenter_FindCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodCenter/FindCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_AjaxBatchDel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_AjaxBatchDel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/AjaxBatchDel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_AjaxDisable = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_AjaxDisable'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/AjaxDisable&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end


czynet.AndriodUser_Register = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Register'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Register&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_CheckUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_CheckUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/CheckUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Info = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Info'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Info&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_VisitHistory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_VisitHistory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/VisitHistory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Password = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Password'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Password&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_ModefyPasswd = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_ModefyPasswd'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/ModefyPasswd&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_ModefyUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_ModefyUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/ModefyUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Center = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Center'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Center&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Query = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Query'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Query&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Reset = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Reset'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Reset&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_Offline = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_Offline'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/Offline&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_SaveMesssageFilter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_SaveMesssageFilter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/SaveMesssageFilter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndriodUser_LoadMessageFilter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndriodUser_LoadMessageFilter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndriodUser/LoadMessageFilter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_CustomerLogin = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_CustomerLogin'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/CustomerLogin&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_UserLogin = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_UserLogin'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/UserLogin&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Orderscolors = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Orderscolors'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Orderscolors&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Orders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Orders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Orders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_OrderAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_OrderAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/OrderAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Orderfinace = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Orderfinace'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Orderfinace&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Orderprocess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Orderprocess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Orderprocess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_DeliveryInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_DeliveryInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/DeliveryInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_NearCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_NearCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/NearCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Statistics = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Statistics'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Statistics&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_GetMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_GetMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/GetMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_GetMsgpeolist = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_GetMsgpeolist'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/GetMsgpeolist&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_GetMsgdeil = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_GetMsgdeil'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/GetMsgdeil&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_GetunreadMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_GetunreadMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/GetunreadMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MsgList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MsgList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MsgList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Centermsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Centermsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Centermsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Finace = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Finace'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Finace&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_InProductIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_InProductIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/InProductIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_OutProductIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_OutProductIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/OutProductIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Workshopindex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Workshopindex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Workshopindex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Workshopprogress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Workshopprogress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Workshopprogress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_StepProgress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_StepProgress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/StepProgress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisProduct = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisProduct'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisProduct&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisHandler = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisHandler'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisHandler&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_MarketAnalysisTheDeposit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_MarketAnalysisTheDeposit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/MarketAnalysisTheDeposit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_financeoperatingStatte = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_financeoperatingStatte'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/financeoperatingStatte&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_slide = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_slide'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/slide&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Getid = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Getid'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Getid&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Androidapp_Getuser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Androidapp_Getuser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Androidapp/Getuser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndroidOrderCust_OrderList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndroidOrderCust_OrderList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndroidOrderCust/OrderList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndroidOrderCust_OrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndroidOrderCust_OrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndroidOrderCust/OrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndroidOrderCust_OrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndroidOrderCust_OrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndroidOrderCust/OrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AndroidOrderCust_OrderDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AndroidOrderCust_OrderDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AndroidOrderCust/OrderDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppBackUp_BackUpMysql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppBackUp_BackUpMysql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppBackUp/BackUpMysql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppExcel_Test = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppExcel_Test'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppExcel/Test&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppExcel_Set = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppExcel_Set'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppExcel/Set&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppExcel_Run = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppExcel_Run'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppExcel/Run&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrint_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrint_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrint/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_PrintFilename = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_PrintFilename'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/PrintFilename&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_PrintSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_PrintSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/PrintSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_SavePrintSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_SavePrintSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/SavePrintSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_LoadReportConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_LoadReportConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/LoadReportConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_SavePrintLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_SavePrintLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/SavePrintLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_SavePrintIds = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_SavePrintIds'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/SavePrintIds&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_AddPrintSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_AddPrintSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/AddPrintSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_ConfirmAddPrintFile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_ConfirmAddPrintFile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/ConfirmAddPrintFile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_UploadFile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_UploadFile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/UploadFile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_AddUploadFile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_AddUploadFile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/AddUploadFile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_LabelGetfiles = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_LabelGetfiles'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/LabelGetfiles&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_LabelGetPrintFile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_LabelGetPrintFile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/LabelGetPrintFile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_Getfile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_Getfile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/Getfile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.AppPrintText_LabelGetFile = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.AppPrintText_LabelGetFile'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=AppPrintText/LabelGetFile&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Buyer_GetBuyerName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Buyer_GetBuyerName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Buyer/GetBuyerName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Buyer_GetBuyerPhone = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Buyer_GetBuyerPhone'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Buyer/GetBuyerPhone&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Chat_Init = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Chat_Init'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Chat/Init&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Column = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Column'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Column&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_SaveRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_SaveRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/SaveRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_LoadRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_LoadRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/LoadRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Rename = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Rename'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Rename&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_DelRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_DelRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/DelRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_RenameRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_RenameRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/RenameRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Add = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Add'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Add&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_Copy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_Copy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/Copy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientFormat_MakeUsing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientFormat_MakeUsing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientFormat/MakeUsing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_Fast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_Fast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/Fast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_EditFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_EditFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/EditFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_Product = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_Product'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/Product&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_GetOrderFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_GetOrderFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/GetOrderFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_GetMoreRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_GetMoreRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/GetMoreRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_SaveFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_SaveFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/SaveFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_GroupOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_GroupOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/GroupOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_OrderIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_OrderIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/OrderIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ClientOrder_CustomerOrderIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ClientOrder_CustomerOrderIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ClientOrder/CustomerOrderIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_LoadCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_LoadCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/LoadCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_AjaxProvince = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_AjaxProvince'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/AjaxProvince&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_AjaxCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_AjaxCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/AjaxCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_AjaxArea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_AjaxArea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/AjaxArea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_NAjaxCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_NAjaxCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/NAjaxCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_MatchProvince = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_MatchProvince'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/MatchProvince&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_MatchCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_MatchCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/MatchCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_MatchArea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_MatchArea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/MatchArea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_GetFirstLetter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_GetFirstLetter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/GetFirstLetter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_GetPinyin = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_GetPinyin'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/GetPinyin&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_LoadJson = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_LoadJson'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/LoadJson&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_SaveRow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_SaveRow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/SaveRow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_UpdateColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_UpdateColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/UpdateColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Common_DelRow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Common_DelRow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Common/DelRow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_Logo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_Logo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/Logo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_AddLogo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_AddLogo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/AddLogo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_EditBackground = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_EditBackground'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/EditBackground&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_AddBackground = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_AddBackground'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/AddBackground&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_UseLogo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_UseLogo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/UseLogo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_DelLogo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_DelLogo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/DelLogo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_Bank = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_Bank'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/Bank&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_SaveBank = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_SaveBank'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/SaveBank&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_DelBank = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_DelBank'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/DelBank&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Company_EditLogo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Company_EditLogo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Company/EditLogo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_EditCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_EditCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/EditCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_AddList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_AddList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/AddList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_EditList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_EditList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/EditList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DelList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DelList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DelList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadCategory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadCategory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadCategory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadPinpai = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadPinpai'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadPinpai&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadRegion = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadRegion'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadRegion&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchSalesman = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchSalesman'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchSalesman&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchService = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchService'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchService&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveMan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveMan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveMan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_GetCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_GetCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/GetCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_GetBrandName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_GetBrandName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/GetBrandName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_GetCustomerOrderNum = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_GetCustomerOrderNum'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/GetCustomerOrderNum&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_CustomerInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_CustomerInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/CustomerInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_RememberPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_RememberPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/RememberPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Index = function(self,tb)

	local top = self
	self.tablename = 'czy_customer'	
	local callbackey = 'czynet.Customer_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	
	print('Customer_Index', self.base..'r=Customer/Index&ajax=all&prj='..g_mainModule) 
	
	gxo_curl(self.base..'r=Customer/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		print('################################################ czynet.Customer_Index')
		table.print(netdata)
		if netdata['customers'] and table.size(netdata['customers']['value']) > 0 then
			for a,b in pairs(netdata['customers']['value']) do
				top.tablename = 'czy_customer'	
				
				top:SetDirty(true)
				b['data'] = TableToString(b)
				top:AddorUpdateRecord('id',b)
				
			end		
		end
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Detail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Detail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Detail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_LoadBrand = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_LoadBrand'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/LoadBrand&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchRegion = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchRegion'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchRegion&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveRegion = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveRegion'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveRegion&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DelRegion = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DelRegion'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DelRegion&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchCategory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchCategory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchCategory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveCategory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveCategory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveCategory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DelCategory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DelCategory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DelCategory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DelType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DelType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DelType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MatchPinpai = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MatchPinpai'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MatchPinpai&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SavePinpai = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SavePinpai'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SavePinpai&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DisablePinpai = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DisablePinpai'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DisablePinpai&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_MEditCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_MEditCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/MEditCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Newest = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Newest'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Newest&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Sale = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Sale'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Sale&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Service = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Service'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Service&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Zone = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Zone'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Zone&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Saleman = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Saleman'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Saleman&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Brand = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Brand'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Brand&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Category = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Category'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Category&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Region = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Region'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Region&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Manage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Manage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Manage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_AjaxDisable = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_AjaxDisable'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/AjaxDisable&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_AjaxBatchDel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_AjaxBatchDel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/AjaxBatchDel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveBatch = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveBatch'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveBatch&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SearchCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SearchCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SearchCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Info = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Info'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Info&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_Delivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_Delivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/Delivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveSequence = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveSequence'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveSequence&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_SaveDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_SaveDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/SaveDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_DelDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_DelDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/DelDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Customer_ArrearsWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Customer_ArrearsWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Customer/ArrearsWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Loginkshow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Loginkshow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Loginkshow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Loginks = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Loginks'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Loginks&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Loginksorder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Loginksorder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Loginksorder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerLogin_Logout = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerLogin_Logout'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerLogin/Logout&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerFactory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerFactory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerFactory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerAddOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerAddOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerAddOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_SaveFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_SaveFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/SaveFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_GetAttrs = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_GetAttrs'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/GetAttrs&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerOrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerOrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerOrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_CustomerOneDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_CustomerOneDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/CustomerOneDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_ChangeSent = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_ChangeSent'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/ChangeSent&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_SentOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_SentOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/SentOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerMain_DelOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerMain_DelOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerMain/DelOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_GetAttrs = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_GetAttrs'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/GetAttrs&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_KshowOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_KshowOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/KshowOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_CompleteKshow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_CompleteKshow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/CompleteKshow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_Param = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_Param'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/Param&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_SaveParam = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_SaveParam'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/SaveParam&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_SaveParamMore = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_SaveParamMore'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/SaveParamMore&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_LoadCustomerOrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_LoadCustomerOrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/LoadCustomerOrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_LoadKshowOrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_LoadKshowOrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/LoadKshowOrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_GetCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_GetCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/GetCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_OptCustomerKcid = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_OptCustomerKcid'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/OptCustomerKcid&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_KshowPasswd = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_KshowPasswd'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/KshowPasswd&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.CustomerOrder_SetKshowOrderStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.CustomerOrder_SetKshowOrderStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=CustomerOrder/SetKshowOrderStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_MatchDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_MatchDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/MatchDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_SaveInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_SaveInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/SaveInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_SaveGroupInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_SaveGroupInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/SaveGroupInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_LoadInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_LoadInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/LoadInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_LoadGroupInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_LoadGroupInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/LoadGroupInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_Set = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_Set'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/Set&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_BatchDeliver = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_BatchDeliver'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/BatchDeliver&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_DeliveryOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_DeliveryOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/DeliveryOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_BatchFollowDeliver = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_BatchFollowDeliver'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/BatchFollowDeliver&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_ConfirmDeliver = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_ConfirmDeliver'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/ConfirmDeliver&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_ConfirmUnDeliver = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_ConfirmUnDeliver'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/ConfirmUnDeliver&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_Group = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_Group'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/Group&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_Ungroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_Ungroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/Ungroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_BatchGroupShipping = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_BatchGroupShipping'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/BatchGroupShipping&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_WithdrawDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_WithdrawDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/WithdrawDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_WithdrawShipping = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_WithdrawShipping'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/WithdrawShipping&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_BatchGroupSales = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_BatchGroupSales'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/BatchGroupSales&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_GetPackgeShape = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_GetPackgeShape'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/GetPackgeShape&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_SavePackageShape = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_SavePackageShape'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/SavePackageShape&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Delivery_DelPackageShape = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Delivery_DelPackageShape'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Delivery/DelPackageShape&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Download_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Download_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Download/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Download_Attachment = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Download_Attachment'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Download/Attachment&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ExportExcel_MaterialPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ExportExcel_MaterialPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ExportExcel/MaterialPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OrderIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OrderIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OrderIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SellTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SellTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SellTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SellInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SellInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SellInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OtherIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OtherIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OtherIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveOther = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveOther'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveOther&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveInout = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveInout'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveInout&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_AllPeople = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_AllPeople'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/AllPeople&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SelectProjectCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SelectProjectCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SelectProjectCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelProject = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelProject'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelProject&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveProject = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveProject'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveProject&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveProjectRow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveProjectRow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveProjectRow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_PurchaseTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_PurchaseTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/PurchaseTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Select = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Select'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Select&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_PurchaseInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_PurchaseInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/PurchaseInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_WhPurchaseTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_WhPurchaseTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/WhPurchaseTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_WpPurchaseInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_WpPurchaseInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/WpPurchaseInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_addCustomerFee = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_addCustomerFee'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/addCustomerFee&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelFee = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelFee'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelFee&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_CustomerFee = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_CustomerFee'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/CustomerFee&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Wage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Wage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Wage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveUserSalary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveUserSalary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveUserSalary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Detail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Detail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Detail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetPieceInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetPieceInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetPieceInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Stepdetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Stepdetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Stepdetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetSalaryInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetSalaryInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetSalaryInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelSalaryInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelSalaryInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelSalaryInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveSalaryInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveSalaryInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveSalaryInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Commission = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Commission'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Commission&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Commission2 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Commission2'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Commission2&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_MoneyDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_MoneyDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/MoneyDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Commission3 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Commission3'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Commission3&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OtherOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OtherOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OtherOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_operatingStatte = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_operatingStatte'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/operatingStatte&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Nonprofit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Nonprofit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Nonprofit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelInout = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelInout'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelInout&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Records = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Records'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Records&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OrderCost = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OrderCost'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OrderCost&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_HadDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_HadDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/HadDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetHadDeliveryOrderCost = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetHadDeliveryOrderCost'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetHadDeliveryOrderCost&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetOrderCost = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetOrderCost'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetOrderCost&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_RebatesSet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_RebatesSet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/RebatesSet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SetRebates = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SetRebates'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SetRebates&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_AccountSet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_AccountSet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/AccountSet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_AddAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_AddAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/AddAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Transfer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Transfer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Transfer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_AddTradeTransfer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_AddTradeTransfer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/AddTradeTransfer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_WageSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_WageSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/WageSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveSalary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveSalary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveSalary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelSalary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelSalary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelSalary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Accounting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Accounting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Accounting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_AddAccounting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_AddAccounting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/AddAccounting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelAccounting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelAccounting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelAccounting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Profit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Profit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Profit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SendProduct = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SendProduct'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SendProduct&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveSystemAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveSystemAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveSystemAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetProject = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetProject'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetProject&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_ProjectDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_ProjectDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/ProjectDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Setdiscount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Setdiscount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Setdiscount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SetOtherMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SetOtherMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SetOtherMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SetBalanceMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SetBalanceMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SetBalanceMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_GetGroupOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_GetGroupOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/GetGroupOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_PurchasePayInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_PurchasePayInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/PurchasePayInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_ThereGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_ThereGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/ThereGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_UnGroupOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_UnGroupOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/UnGroupOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Ungroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Ungroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Ungroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_Group = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_Group'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/Group&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_LoadVisit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_LoadVisit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/LoadVisit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveVisit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveVisit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveVisit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_DelVisit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_DelVisit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/DelVisit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_ClearFinanceOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_ClearFinanceOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/ClearFinanceOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SaveGroupNote = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SaveGroupNote'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SaveGroupNote&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_SendDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_SendDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/SendDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Finance_OrderInfoall = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Finance_OrderInfoall'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Finance/OrderInfoall&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Column = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Column'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Column&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_LoadRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_LoadRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/LoadRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_LoadSuiteGlobalRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_LoadSuiteGlobalRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/LoadSuiteGlobalRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_LoadGlobalRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_LoadGlobalRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/LoadGlobalRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_LoadWoodRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_LoadWoodRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/LoadWoodRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Backup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Backup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Backup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Restore = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Restore'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Restore&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_SaveRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_SaveRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/SaveRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_DelRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_DelRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/DelRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_SaveCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_SaveCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/SaveCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_DelRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_DelRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/DelRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Css = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Css'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Css&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_SaveCss = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_SaveCss'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/SaveCss&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_LoadMoneyJs = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_LoadMoneyJs'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/LoadMoneyJs&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_SaveMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_SaveMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/SaveMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Swing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Swing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Swing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_EditSwing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_EditSwing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/EditSwing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_DelSwing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_DelSwing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/DelSwing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_AddSwing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_AddSwing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/AddSwing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Check = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Check'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Check&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_SaveColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_SaveColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/SaveColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_DelColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_DelColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/DelColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Rename = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Rename'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Rename&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Add = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Add'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Add&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_Copy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_Copy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/Copy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_MakeDefault = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_MakeDefault'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/MakeDefault&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Format_ResetSystemRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Format_ResetSystemRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Format/ResetSystemRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.FormatNew_LoadRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.FormatNew_LoadRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=FormatNew/LoadRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Grade_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Grade_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Grade/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Grade_SaveGrade = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Grade_SaveGrade'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Grade/SaveGrade&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Grade_Ranking = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Grade_Ranking'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Grade/Ranking&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Grade_GetPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Grade_GetPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Grade/GetPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Guest_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Guest_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Guest/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Guest_Try = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Guest_Try'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Guest/Try&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Savecompanyinfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Savecompanyinfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Savecompanyinfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Savecoefficient = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Savecoefficient'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Savecoefficient&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Showcompany = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Showcompany'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Showcompany&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Showcustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Showcustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Showcustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Showorder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Showorder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Showorder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Showcoefficient = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Showcoefficient'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Showcoefficient&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Instruction_Showdelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Instruction_Showdelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Instruction/Showdelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_Orders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_Orders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/Orders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_Finance = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_Finance'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/Finance&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_FinanceCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_FinanceCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/FinanceCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_WorkingIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_WorkingIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/WorkingIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_Working = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_Working'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/Working&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_ProductIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_ProductIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/ProductIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_ProductOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_ProductOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/ProductOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_StatisticsProduct = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_StatisticsProduct'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/StatisticsProduct&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_StatisticsCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_StatisticsCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/StatisticsCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_Warn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_Warn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/Warn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.IosMini_WarnOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.IosMini_WarnOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=IosMini/WarnOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kcircle_Add = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kcircle_Add'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kcircle/Add&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kshow_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kshow_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kshow/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kshow_CustomerStatic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kshow_CustomerStatic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kshow/CustomerStatic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kshow_ProdStatic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kshow_ProdStatic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kshow/ProdStatic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kshow_BindCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kshow_BindCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kshow/BindCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Kshow_UnBindCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Kshow_UnBindCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Kshow/UnBindCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_AutoLogin = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_AutoLogin'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/AutoLogin&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_Qrcode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_Qrcode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/Qrcode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_TodayData = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_TodayData'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/TodayData&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_CheckLicense = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_CheckLicense'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/CheckLicense&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_LoginCc = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_LoginCc'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/LoginCc&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_Online = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_Online'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/Online&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_Logout = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_Logout'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/Logout&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Login_MiniUpgrade = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Login_MiniUpgrade'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Login/MiniUpgrade&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end


czynet.Main_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_IndexNew = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_IndexNew'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/IndexNew&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_IndexAllNew = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_IndexAllNew'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/IndexAllNew&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_More = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_More'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/More&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_DataBackup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_DataBackup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/DataBackup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_BackupDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_BackupDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/BackupDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_GetMenVip = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_GetMenVip'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/GetMenVip&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_Questionnaire = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_Questionnaire'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/Questionnaire&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_UpdateGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_UpdateGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/UpdateGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_Qrcode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_Qrcode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/Qrcode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Main_Getfid = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Main_Getfid'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Main/Getfid&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_CheckShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_CheckShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/CheckShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_SaveMarkColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_SaveMarkColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/SaveMarkColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_AddMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_AddMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/AddMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_EditMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_EditMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/EditMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_DelMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_DelMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/DelMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_SaveMarkSort = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_SaveMarkSort'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/SaveMarkSort&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_GetMarkOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_GetMarkOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/GetMarkOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_GetDelMarkOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_GetDelMarkOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/GetDelMarkOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_GetMarks = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_GetMarks'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/GetMarks&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_GetGroupMarks = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_GetGroupMarks'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/GetGroupMarks&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_InsertMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_InsertMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/InsertMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_DelAllOrderMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_DelAllOrderMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/DelAllOrderMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Mark_DelOrderMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Mark_DelOrderMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Mark/DelOrderMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_CustomerDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_CustomerDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/CustomerDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_CustomerColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_CustomerColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/CustomerColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Handler = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Handler'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Handler&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_HandlerProvince = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_HandlerProvince'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/HandlerProvince&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_ProvinceDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_ProvinceDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/ProvinceDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Product = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Product'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Product&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Size = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Size'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Size&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Area = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Area'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Area&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_AreaDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_AreaDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/AreaDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Month = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Month'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Month&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_MonthDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_MonthDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/MonthDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_Delivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_Delivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/Delivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_OrderAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_OrderAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/OrderAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MarketAnalysis_TheDeposit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MarketAnalysis_TheDeposit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MarketAnalysis/TheDeposit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_ContactGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_ContactGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/ContactGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_SetMessageUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_SetMessageUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/SetMessageUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_Send = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_Send'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/Send&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_AjaxMessageLeft = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_AjaxMessageLeft'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/AjaxMessageLeft&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_AjaxLocalMessage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_AjaxLocalMessage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/AjaxLocalMessage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_SaveSignature = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_SaveSignature'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/SaveSignature&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_SaveMessageModule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_SaveMessageModule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/SaveMessageModule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_List = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_List'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/List&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_DelMessageGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_DelMessageGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/DelMessageGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_ModuleOperation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_ModuleOperation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/ModuleOperation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_DelMessageTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_DelMessageTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/DelMessageTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_Contact = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_Contact'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/Contact&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_AddContact = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_AddContact'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/AddContact&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_RemoveCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_RemoveCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/RemoveCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Message_DelCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Message_DelCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Message/DelCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileCustomer_FindByCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileCustomer_FindByCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileCustomer/FindByCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileCustomer_FindById = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileCustomer_FindById'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileCustomer/FindById&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileCustomer_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileCustomer_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileCustomer/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileCustomer_GetAllCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileCustomer_GetAllCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileCustomer/GetAllCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileCustomer_GetCustomerCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileCustomer_GetCustomerCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileCustomer/GetCustomerCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_OrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_OrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/OrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_leftMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_leftMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/leftMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_SystemAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_SystemAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/SystemAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_AddOrderPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_AddOrderPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/AddOrderPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_SellRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_SellRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/SellRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_AddSellPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_AddSellPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/AddSellPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_CustomerAccount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_CustomerAccount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/CustomerAccount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_Recharge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_Recharge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/Recharge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_WhPurchaseTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_WhPurchaseTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/WhPurchaseTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_WpPurchaseInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_WpPurchaseInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/WpPurchaseInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_WpPurchasePay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_WpPurchasePay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/WpPurchasePay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_WpPurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_WpPurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/WpPurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileFinance_AllRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileFinance_AllRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileFinance/AllRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileLogin_Register = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileLogin_Register'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileLogin/Register&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileLogin_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileLogin_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileLogin/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileLogin_CustLogin = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileLogin_CustLogin'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileLogin/CustLogin&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileLogin_Version = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileLogin_Version'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileLogin/Version&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileNotify_GetAllNotify = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileNotify_GetAllNotify'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileNotify/GetAllNotify&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileNotify_GetUnreadCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileNotify_GetUnreadCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileNotify/GetUnreadCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileNotify_Read = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileNotify_Read'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileNotify/Read&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileNotify_GetAllMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileNotify_GetAllMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileNotify/GetAllMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderInfo_ios = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderInfo_ios'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderInfo_ios&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderDetail_ios = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderDetail_ios'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderDetail_ios&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderFinance = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderFinance'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderFinance&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderFinance_ios = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderFinance_ios'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderFinance_ios&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderProcess_ios = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderProcess_ios'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderProcess_ios&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderStatus_ios = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderStatus_ios'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderStatus_ios&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_GetAllColors = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_GetAllColors'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/GetAllColors&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_SaveCustomerOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_SaveCustomerOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/SaveCustomerOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_DelCustomerOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_DelCustomerOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/DelCustomerOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_GetAllCustOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_GetAllCustOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/GetAllCustOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_GetCustOrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_GetCustOrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/GetCustOrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_AllMfrOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_AllMfrOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/AllMfrOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_OrderDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_OrderDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/OrderDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_CustDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_CustDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/CustDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_DeliveryDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_DeliveryDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/DeliveryDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileOrder_UploadPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileOrder_UploadPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileOrder/UploadPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileProduct_Warehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileProduct_Warehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileProduct/Warehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileProduct_Delivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileProduct_Delivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileProduct/Delivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileProduct_DeliveryOrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileProduct_DeliveryOrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileProduct/DeliveryOrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileProduct_UploadDeliveryPic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileProduct_UploadDeliveryPic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileProduct/UploadDeliveryPic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStat_ProStat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStat_ProStat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStat/ProStat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStat_OrderStat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStat_OrderStat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStat/OrderStat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStat_ProfitStat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStat_ProfitStat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStat/ProfitStat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_CustomerSales = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_CustomerSales'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/CustomerSales&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_CustomerArea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_CustomerArea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/CustomerArea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Salesman = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Salesman'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Salesman&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_MonthMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_MonthMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/MonthMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Products = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Products'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Products&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_ProductColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_ProductColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/ProductColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_ProductProfit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_ProductProfit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/ProductProfit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Reconciliation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Reconciliation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Reconciliation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Preferential = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Preferential'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Preferential&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_CustomerProfit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_CustomerProfit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/CustomerProfit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_MoneyRecovery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_MoneyRecovery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/MoneyRecovery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Inventory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Inventory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Inventory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Purchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Purchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Purchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_Loss = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_Loss'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/Loss&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_ProfitCalculation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_ProfitCalculation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/ProfitCalculation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileStatistics_ProfitDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileStatistics_ProfitDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileStatistics/ProfitDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileVisit_FindById = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileVisit_FindById'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileVisit/FindById&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileVisit_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileVisit_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileVisit/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileVisit_GetByVisitor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileVisit_GetByVisitor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileVisit/GetByVisitor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWarn_WarnOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWarn_WarnOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWarn/WarnOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWarn_WarnBuy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWarn_WarnBuy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWarn/WarnBuy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWarn_WarnStuff = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWarn_WarnStuff'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWarn/WarnStuff&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_Arranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_Arranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/Arranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_ArrangedSearch = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_ArrangedSearch'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/ArrangedSearch&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_ArrangedScan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_ArrangedScan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/ArrangedScan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_UnSet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_UnSet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/UnSet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_UnProduce = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_UnProduce'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/UnProduce&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_DayProduce = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_DayProduce'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/DayProduce&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.MobileWork_Worker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.MobileWork_Worker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=MobileWork/Worker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveVarItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveVarItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveVarItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelScriptMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelScriptMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelScriptMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_LoadScriptMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_LoadScriptMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/LoadScriptMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveDefaultMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveDefaultMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveDefaultMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Swing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Swing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Swing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelSwing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelSwing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelSwing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelSwings = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelSwings'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelSwings&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SwingList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SwingList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SwingList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SwingUrl = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SwingUrl'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SwingUrl&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_UseDefaultMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_UseDefaultMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/UseDefaultMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveTagSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveTagSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveTagSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelTagSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelTagSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelTagSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveValidation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveValidation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveValidation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelValidation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelValidation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelValidation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SavePinTag = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SavePinTag'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SavePinTag&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_PinTag = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_PinTag'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/PinTag&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_AllPinTag = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_AllPinTag'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/AllPinTag&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Multiphoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Multiphoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Multiphoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ExtraPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ExtraPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ExtraPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelExtraPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelExtraPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelExtraPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ExtraPhotoPrintCondition = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ExtraPhotoPrintCondition'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ExtraPhotoPrintCondition&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareVarRow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareVarRow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareVarRow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareVar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareVar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareVar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareTag = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareTag'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareTag&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareValidation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareValidation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareValidation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_LoadCatelogInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_LoadCatelogInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/LoadCatelogInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveTbVar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveTbVar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveTbVar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_TabVar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_TabVar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/TabVar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelTbVal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelTbVal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelTbVal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Merge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Merge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Merge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Split = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Split'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Split&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_AddMultiVar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_AddMultiVar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/AddMultiVar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_AddMatrixVar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_AddMatrixVar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/AddMatrixVar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_QuoteRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_QuoteRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/QuoteRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareMorepic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareMorepic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareMorepic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ShareRuleItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ShareRuleItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ShareRuleItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SearchPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SearchPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SearchPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetOrderFormats = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetOrderFormats'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetOrderFormats&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetOrderFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetOrderFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetOrderFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_MultiPicList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_MultiPicList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/MultiPicList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_MultiUpload = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_MultiUpload'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/MultiUpload&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelMultiPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelMultiPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelMultiPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetPicSrc = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetPicSrc'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetPicSrc&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetMorePhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetMorePhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetMorePhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_RenderParamRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_RenderParamRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/RenderParamRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Select = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Select'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Select&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetDoorFlower = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetDoorFlower'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetDoorFlower&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveFlower = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveFlower'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveFlower&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelDoorFlower = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelDoorFlower'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelDoorFlower&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Lock = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Lock'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Lock&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_Unlock = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_Unlock'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/Unlock&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetScriptOrderFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetScriptOrderFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetScriptOrderFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GlobalFormatList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GlobalFormatList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GlobalFormatList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GlobalFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GlobalFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GlobalFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_LoadGlobalFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_LoadGlobalFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/LoadGlobalFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveScriptGlobalFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveScriptGlobalFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveScriptGlobalFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveGlobalFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveGlobalFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveGlobalFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelGlobalFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelGlobalFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelGlobalFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveSort = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveSort'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveSort&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_LoadChain = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_LoadChain'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/LoadChain&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveChain = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveChain'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveChain&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_DelChain = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_DelChain'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/DelChain&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ResetChain = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ResetChain'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ResetChain&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_LoadSettingForChain = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_LoadSettingForChain'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/LoadSettingForChain&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ChainRow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ChainRow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ChainRow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_ChainHeader = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_ChainHeader'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/ChainHeader&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetPriceTblVarName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetPriceTblVarName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetPriceTblVarName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_GetVarList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_GetVarList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/GetVarList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_SaveVars = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_SaveVars'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/SaveVars&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_AddWoodScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_AddWoodScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/AddWoodScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Script22_CloneWoodScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Script22_CloneWoodScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Script22/CloneWoodScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_Design = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_Design'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/Design&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_Suite = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_Suite'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/Suite&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_Paste = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_Paste'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/Paste&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_Clone = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_Clone'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/Clone&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SavePoly = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SavePoly'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SavePoly&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptPoly = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptPoly'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptPoly&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveDoor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveDoor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveDoor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SavePanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SavePanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SavePanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveFabric = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveFabric'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveFabric&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SaveOutbuy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SaveOutbuy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SaveOutbuy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SavePos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SavePos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SavePos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptPanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptPanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptPanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptFabric = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptFabric'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptFabric&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptOutbuy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptOutbuy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptOutbuy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelScriptPos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelScriptPos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelScriptPos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ScriptBackupInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ScriptBackupInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ScriptBackupInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_BackupScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_BackupScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/BackupScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ExportScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ExportScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ExportScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_UploadScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_UploadScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/UploadScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ReductionScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ReductionScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ReductionScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_StockBomList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_StockBomList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/StockBomList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_StockAddonList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_StockAddonList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/StockAddonList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShowOutItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShowOutItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShowOutItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShowAddonOutItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShowAddonOutItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShowAddonOutItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_StockGlassList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_StockGlassList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/StockGlassList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_StockPanelList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_StockPanelList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/StockPanelList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareDoor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareDoor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareDoor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SharePanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SharePanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SharePanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareFabric = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareFabric'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareFabric&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareOutbuy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareOutbuy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareOutbuy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareBomItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareBomItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareBomItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareAddonItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareAddonItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareAddonItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareGlassItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareGlassItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareGlassItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SharePanelItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SharePanelItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SharePanelItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareFabricItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareFabricItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareFabricItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareOutbuyItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareOutbuyItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareOutbuyItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SharePos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SharePos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SharePos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_ShareScriptPiece = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_ShareScriptPiece'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/ShareScriptPiece&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SharePoly = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SharePoly'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SharePoly&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_GetSeparator = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_GetSeparator'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/GetSeparator&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_UploadScriptPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_UploadScriptPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/UploadScriptPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_SelectName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_SelectName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/SelectName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_BatchAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_BatchAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/BatchAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_EditCombox = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_EditCombox'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/EditCombox&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_AddFormatRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_AddFormatRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/AddFormatRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_RulesSort = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_RulesSort'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/RulesSort&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptAlum_DelRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptAlum_DelRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptAlum/DelRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_AddGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_AddGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/AddGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_DelGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_DelGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/DelGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_Rename = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_Rename'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/Rename&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_OtherGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_OtherGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/OtherGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_ChangeGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_ChangeGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/ChangeGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_AddChild = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_AddChild'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/AddChild&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_GroupList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_GroupList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/GroupList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptGroup_DelSuiteGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptGroup_DelSuiteGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptGroup/DelSuiteGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_Design = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_Design'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/Design&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_GetOtherGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_GetOtherGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/GetOtherGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_AddScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_AddScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/AddScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_ImportScript = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_ImportScript'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/ImportScript&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptPool_OtherGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptPool_OtherGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptPool/OtherGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_SavePos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_SavePos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/SavePos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_DelPos = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_DelPos'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/DelPos&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_Format = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_Format'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/Format&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_OrderAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_OrderAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/OrderAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_SaveSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_SaveSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/SaveSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_BatchSaveSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_BatchSaveSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/BatchSaveSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_Setting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_Setting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/Setting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_List = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_List'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/List&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_CopySeparator = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_CopySeparator'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/CopySeparator&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSeparator_PasteSeparator = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSeparator_PasteSeparator'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSeparator/PasteSeparator&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_AddGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_AddGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/AddGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_DelGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_DelGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/DelGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_Rename = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_Rename'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/Rename&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_OtherGroups = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_OtherGroups'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/OtherGroups&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_ChangeGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_ChangeGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/ChangeGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_AddChild = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_AddChild'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/AddChild&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.ScriptSuiteGroup_GroupList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.ScriptSuiteGroup_GroupList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=ScriptSuiteGroup/GroupList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Search_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Search_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Search/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.SearchOrderData_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.SearchOrderData_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=SearchOrderData/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.SearchOrderData_Export = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.SearchOrderData_Export'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=SearchOrderData/Export&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.SearchOrderData_UploadPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.SearchOrderData_UploadPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=SearchOrderData/UploadPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.SearchOrderData_Confirm = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.SearchOrderData_Confirm'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=SearchOrderData/Confirm&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerOrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerOrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerOrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerMonthColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerMonthColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerMonthColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProvinceCity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProvinceCity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProvinceCity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProvinceDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProvinceDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProvinceDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SalesMan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SalesMan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SalesMan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SalesManMonthColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SalesManMonthColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SalesManMonthColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SalesManProvince = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SalesManProvince'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SalesManProvince&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SalesManOrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SalesManOrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SalesManOrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SalesManMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SalesManMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SalesManMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_PinPai = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_PinPai'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/PinPai&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Category = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Category'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Category&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CategoryColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CategoryColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CategoryColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CategoryDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CategoryDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CategoryDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Type = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Type'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Type&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_TypeColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_TypeColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/TypeColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_TypeDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_TypeDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/TypeDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SpecialOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SpecialOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SpecialOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SpecialAttrOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SpecialAttrOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SpecialAttrOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_MonthMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_MonthMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/MonthMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_CustomerServices = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_CustomerServices'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/CustomerServices&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_MonthMoneyChar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_MonthMoneyChar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/MonthMoneyChar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Products = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Products'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Products&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductCompare = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductCompare'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductCompare&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductCompareDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductCompareDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductCompareDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductYearCompare = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductYearCompare'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductYearCompare&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductsCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductsCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductsCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_productsQuota = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_productsQuota'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/productsQuota&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_customerIncrement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_customerIncrement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/customerIncrement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductsColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductsColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductsColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductMonthIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductMonthIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductMonthIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductSize = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductSize'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductSize&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductSizeColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductSizeColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductSizeColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductProfit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductProfit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductProfit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductNew = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductNew'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductNew&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductNewDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductNewDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductNewDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Finance = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Finance'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Finance&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceDiscount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceDiscount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceDiscount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceDiscountMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceDiscountMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceDiscountMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceDiscountDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceDiscountDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceDiscountDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinancePreferentialDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinancePreferentialDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinancePreferentialDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceProfit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceProfit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceProfit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceProfitMonth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceProfitMonth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceProfitMonth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProfitCalculation = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProfitCalculation'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProfitCalculation&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProfitDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProfitDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProfitDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_FinanceReceipt = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_FinanceReceipt'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/FinanceReceipt&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_financeSalesman = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_financeSalesman'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/financeSalesman&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_financeSalesmanDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_financeSalesmanDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/financeSalesmanDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_StepProgress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_StepProgress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/StepProgress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProgressOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProgressOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProgressOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Vertime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Vertime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Vertime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Process = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Process'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Process&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Product = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Product'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Product&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_ProductOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_ProductOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/ProductOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Library = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Library'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Library&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_LibraryOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_LibraryOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/LibraryOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Delivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Delivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Delivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_DeliveryOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_DeliveryOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/DeliveryOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Inventory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Inventory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Inventory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Purchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Purchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Purchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Loss = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Loss'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Loss&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_Sell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_Sell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/Sell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Statistics_SellDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Statistics_SellDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Statistics/SellDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_In = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_In'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/In&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SelectSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SelectSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SelectSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Out = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Out'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Out&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SelectReceiver = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SelectReceiver'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SelectReceiver&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveStockIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveStockIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveStockIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveStockOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveStockOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveStockOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_DoStockOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_DoStockOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/DoStockOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveStockOutOfFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveStockOutOfFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveStockOutOfFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveStockInOfFast = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveStockInOfFast'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveStockInOfFast&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_LoadExtraInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_LoadExtraInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/LoadExtraInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetSpecInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetSpecInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetSpecInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveBatch = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveBatch'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveBatch&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_AddItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_AddItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/AddItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_AddWh = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_AddWh'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/AddWh&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_LeatherCodeAjax = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_LeatherCodeAjax'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/LeatherCodeAjax&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetOrderItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetOrderItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetOrderItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Sell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Sell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Sell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SelectDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SelectDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SelectDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveSellOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveSellOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveSellOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Search = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Search'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Search&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SearchSelect = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SearchSelect'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SearchSelect&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SearchSelectBySell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SearchSelectBySell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SearchSelectBySell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_DelSell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_DelSell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/DelSell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetSellItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetSellItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetSellItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetSell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetSell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetSell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetSellByCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetSellByCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetSellByCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_AddSellPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_AddSellPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/AddSellPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_PayInfoBySell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_PayInfoBySell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/PayInfoBySell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SetDueDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SetDueDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SetDueDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SendGoods = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SendGoods'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SendGoods&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Purchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Purchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Purchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SavePurchaseOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SavePurchaseOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SavePurchaseOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetPurchaseItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetPurchaseItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetPurchaseItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_DelPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_DelPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/DelPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_AddPurchasePay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_AddPurchasePay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/AddPurchasePay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_PayInfoByPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_PayInfoByPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/PayInfoByPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_DelPayByPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_DelPayByPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/DelPayByPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SetTakeDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SetTakeDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SetTakeDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_TakeGoods = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_TakeGoods'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/TakeGoods&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_CheckGoods = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_CheckGoods'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/CheckGoods&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetThingsById = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetThingsById'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetThingsById&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_CancelStockOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_CancelStockOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/CancelStockOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SaveCutDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SaveCutDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SaveCutDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_AddCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_AddCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/AddCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_Check = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_Check'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/Check&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetCheckItem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetCheckItem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetCheckItem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_LoadCustomerMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_LoadCustomerMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/LoadCustomerMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_UpdateStockInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_UpdateStockInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/UpdateStockInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetSupplierCname = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetSupplierCname'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetSupplierCname&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_SetOtherCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_SetOtherCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/SetOtherCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_CancelAlias = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_CancelAlias'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/CancelAlias&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_GetInOutDetailById = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_GetInOutDetailById'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/GetInOutDetailById&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.StockFabric_warehouseEntry = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.StockFabric_warehouseEntry'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=StockFabric/warehouseEntry&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SaveSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SaveSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SaveSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_DelSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_DelSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/DelSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_Filter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_Filter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/Filter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_GetInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_GetInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/GetInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SupplierRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SupplierRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SupplierRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_GetAllSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_GetAllSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/GetAllSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_GetSupplierBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_GetSupplierBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/GetSupplierBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_GetAllBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_GetAllBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/GetAllBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SupplierBarList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SupplierBarList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SupplierBarList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SupplierAddonList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SupplierAddonList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SupplierAddonList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SupplierGlassList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SupplierGlassList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SupplierGlassList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_SupplierPanelList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_SupplierPanelList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/SupplierPanelList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_AddBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_AddBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/AddBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_UpdateBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_UpdateBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/UpdateBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Supplier2_DeleteBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Supplier2_DeleteBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Supplier2/DeleteBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Zero = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Zero'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Zero&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ZeroSet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ZeroSet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ZeroSet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Param = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Param'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Param&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderCodeName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderCodeName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderCodeName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderCodeMonthVal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderCodeMonthVal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderCodeMonthVal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderGroupCodeName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderGroupCodeName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderGroupCodeName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetOrderThingSize = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetOrderThingSize'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetOrderThingSize&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Message = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Message'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Message&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SaveMessageSetting = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SaveMessageSetting'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SaveMessageSetting&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Software = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Software'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Software&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_CleanUp = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_CleanUp'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/CleanUp&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearDynamic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearDynamic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearDynamic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearAllData = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearAllData'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearAllData&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Print = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Print'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Print&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ReportPrintSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ReportPrintSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ReportPrintSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SavePrefix = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SavePrefix'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SavePrefix&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SavePrintRole = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SavePrintRole'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SavePrintRole&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SelectPrintPermissions = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SelectPrintPermissions'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SelectPrintPermissions&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ConfirmSave = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ConfirmSave'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ConfirmSave&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_CanPrint = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_CanPrint'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/CanPrint&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SavePrintColor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SavePrintColor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SavePrintColor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetDueDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetDueDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetDueDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetDueDongDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetDueDongDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetDueDongDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_orderStartTime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_orderStartTime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/orderStartTime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SonOrderStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SonOrderStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SonOrderStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetOrderMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetOrderMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetOrderMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetOrderArea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetOrderArea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetOrderArea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetFormulaUnit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetFormulaUnit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetFormulaUnit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_PagerCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_PagerCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/PagerCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FontSize = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FontSize'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FontSize&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderFontSize = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderFontSize'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderFontSize&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_CustomerDiscount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_CustomerDiscount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/CustomerDiscount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SelectScriptOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SelectScriptOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SelectScriptOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_LimitCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_LimitCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/LimitCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_LimitSellCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_LimitSellCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/LimitSellCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WarningDay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WarningDay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WarningDay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SequentialMode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SequentialMode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SequentialMode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ScannerNewResult = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ScannerNewResult'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ScannerNewResult&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_StartDateType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_StartDateType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/StartDateType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderWuliuEditable = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderWuliuEditable'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderWuliuEditable&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderWithAgent = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderWithAgent'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderWithAgent&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WorkshopArrangedSingleMode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WorkshopArrangedSingleMode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WorkshopArrangedSingleMode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_Hworder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_Hworder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/Hworder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DescOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DescOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DescOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DateTime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DateTime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DateTime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_CheckRepeat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_CheckRepeat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/CheckRepeat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderFinanceGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderFinanceGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderFinanceGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderCustomerLogistics = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderCustomerLogistics'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderCustomerLogistics&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WorkshopCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WorkshopCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WorkshopCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DeliveryGroupcount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DeliveryGroupcount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DeliveryGroupcount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WarehouseCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WarehouseCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WarehouseCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_StatisticsShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_StatisticsShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/StatisticsShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DescStatisticOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DescStatisticOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DescStatisticOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SavePrintSort = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SavePrintSort'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SavePrintSort&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ConfigJsSave = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ConfigJsSave'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ConfigJsSave&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ParamJsSave = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ParamJsSave'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ParamJsSave&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MaterialMultSelect = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MaterialMultSelect'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MaterialMultSelect&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MaterialRepeatAdd = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MaterialRepeatAdd'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MaterialRepeatAdd&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_BarSellCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_BarSellCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/BarSellCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MaterialDropNum = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MaterialDropNum'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MaterialDropNum&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_UpgradeVersion = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_UpgradeVersion'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/UpgradeVersion&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WhOrderShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WhOrderShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WhOrderShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WhProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WhProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WhProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetMoneyLeft = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetMoneyLeft'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetMoneyLeft&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ProductCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ProductCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ProductCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DeliveryOrderCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DeliveryOrderCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DeliveryOrderCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MaterialMultBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MaterialMultBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MaterialMultBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FloatMultBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FloatMultBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FloatMultBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MaterialMultPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MaterialMultPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MaterialMultPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SeDog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SeDog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SeDog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_PlanCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_PlanCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/PlanCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_PlanCodeName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_PlanCodeName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/PlanCodeName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearAppointOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearAppointOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearAppointOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_LoginInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_LoginInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/LoginInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_BackUpInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_BackUpInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/BackUpInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetPurchaseAccept = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetPurchaseAccept'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetPurchaseAccept&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetPurchaseCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetPurchaseCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetPurchaseCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetSellAccept = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetSellAccept'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetSellAccept&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetSellCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetSellCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetSellCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetFinanceCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetFinanceCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetFinanceCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetCustomCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetCustomCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetCustomCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_setFinanceCheckWarn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_setFinanceCheckWarn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/setFinanceCheckWarn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WorkPlanShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WorkPlanShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WorkPlanShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WorkProcessShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WorkProcessShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WorkProcessShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WhCostAverage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WhCostAverage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WhCostAverage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_WeightAverage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_WeightAverage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/WeightAverage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SellAutoGross = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SellAutoGross'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SellAutoGross&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SupplierPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SupplierPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SupplierPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetAutoOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetAutoOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetAutoOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_QrCodes = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_QrCodes'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/QrCodes&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetQrCompany = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetQrCompany'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetQrCompany&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MsgApp = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MsgApp'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MsgApp&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FinanceDeliveryGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FinanceDeliveryGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FinanceDeliveryGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FinanceIsDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FinanceIsDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FinanceIsDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FinanceIsPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FinanceIsPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FinanceIsPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FinanceTransfer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FinanceTransfer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FinanceTransfer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_BasicTime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_BasicTime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/BasicTime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderGroupCodeGet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderGroupCodeGet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderGroupCodeGet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearLicheTable = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearLicheTable'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearLicheTable&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_LogInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_LogInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/LogInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetPhotoOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetPhotoOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetPhotoOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearScriptGarbage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearScriptGarbage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearScriptGarbage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ClearOrderGarbage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ClearOrderGarbage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ClearOrderGarbage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_XcopyCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_XcopyCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/XcopyCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_arrearsWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_arrearsWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/arrearsWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ScriptTwoShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ScriptTwoShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ScriptTwoShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ScriptVarsShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ScriptVarsShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ScriptVarsShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ScriptSuiteOpen = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ScriptSuiteOpen'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ScriptSuiteOpen&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_DeliveryMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_DeliveryMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/DeliveryMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_FinanceDateSelect = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_FinanceDateSelect'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/FinanceDateSelect&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ProgressTime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ProgressTime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ProgressTime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_StatisticsTime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_StatisticsTime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/StatisticsTime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_OrderCodeCc = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_OrderCodeCc'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/OrderCodeCc&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_MoneyPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_MoneyPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/MoneyPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_EditConfigJS = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_EditConfigJS'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/EditConfigJS&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_SetParamValu = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_SetParamValu'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/SetParamValu&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.System_ParamSet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.System_ParamSet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=System/ParamSet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_TaskOrderRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_TaskOrderRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/TaskOrderRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_TaskOrderLine = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_TaskOrderLine'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/TaskOrderLine&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_AddTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_AddTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/AddTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_EditTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_EditTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/EditTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_DelTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_DelTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/DelTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_PlanTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_PlanTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/PlanTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Task_GetTaskRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Task_GetTaskRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Task/GetTaskRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Test_Manage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Test_Manage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Test/Manage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Test_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Test_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Test/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Test_Detail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Test_Detail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Test/Detail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.TimeOut_Check = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.TimeOut_Check'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=TimeOut/Check&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.TimeOut_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.TimeOut_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=TimeOut/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.TimeOut_Break = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.TimeOut_Break'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=TimeOut/Break&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.TimeOut_License = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.TimeOut_License'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=TimeOut/License&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.TimeOut_GetVer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.TimeOut_GetVer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=TimeOut/GetVer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_AddOrderPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_AddOrderPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/AddOrderPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_AddPurchaseOrderAndPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_AddPurchaseOrderAndPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/AddPurchaseOrderAndPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_Receive = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_Receive'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/Receive&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_AddAccountMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_AddAccountMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/AddAccountMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_PayPurchaseBackMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_PayPurchaseBackMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/PayPurchaseBackMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_LoadPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_LoadPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/LoadPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_LoadSellPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_LoadSellPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/LoadSellPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_LoadPurchasePay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_LoadPurchasePay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/LoadPurchasePay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_CheckRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_CheckRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/CheckRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_AddPurchasePay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_AddPurchasePay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/AddPurchasePay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_UpdatePayNote = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_UpdatePayNote'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/UpdatePayNote&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Trade_TradeIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Trade_TradeIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Trade/TradeIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_OrderListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_OrderListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/OrderListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveOrderColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveOrderColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveOrderColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_InitOrderColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_InitOrderColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/InitOrderColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelFormatColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelFormatColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelFormatColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_LoadRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_LoadRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/LoadRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_GetRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_GetRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/GetRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_PurListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_PurListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/PurListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SavePurColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SavePurColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SavePurColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SellListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SellListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SellListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveSellColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveSellColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveSellColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_InoutListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_InoutListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/InoutListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveInoutColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveInoutColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveInoutColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_FinanceOrderFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_FinanceOrderFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/FinanceOrderFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveFinanceOrderColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveFinanceOrderColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveFinanceOrderColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelFinanceFormatColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelFinanceFormatColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelFinanceFormatColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_OrderExport = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_OrderExport'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/OrderExport&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveOrderExport = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveOrderExport'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveOrderExport&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelOrderExportColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelOrderExportColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelOrderExportColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopProcessIndexFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopProcessIndexFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopProcessIndexFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopProcessIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopProcessIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopProcessIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopProcessIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopProcessIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopProcessIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopIndexColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopIndexColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopIndexColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopDetailColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopDetailColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopDetailColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopDetailColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopDetailColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopDetailColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopDetailColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopDetailColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopDetailColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopPlanColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopPlanColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopPlanColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopPlanColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopPlanColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopPlanColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopPlanColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopPlanColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopPlanColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopProgressColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopProgressColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopProgressColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopProgressColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopProgressColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopProgressColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopProgressColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopProgressColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopProgressColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_ProductColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_ProductColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/ProductColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DeliveryColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DeliveryColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DeliveryColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveProductColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveProductColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveProductColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveDeliveryColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveDeliveryColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveDeliveryColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelProductColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelProductColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelProductColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelDeliveryColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelDeliveryColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelDeliveryColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveMainColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveMainColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveMainColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveMainColumnShow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveMainColumnShow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveMainColumnShow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WorkshopArrangedColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WorkshopArrangedColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WorkshopArrangedColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWorkshopArrangedColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWorkshopArrangedColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWorkshopArrangedColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelWorkshopArrangedColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelWorkshopArrangedColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelWorkshopArrangedColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_CustomerColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_CustomerColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/CustomerColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveCustomerColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveCustomerColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveCustomerColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_WhListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_WhListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/WhListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveWhColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveWhColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveWhColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DeliverySet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DeliverySet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DeliverySet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveDeliverySetColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveDeliverySetColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveDeliverySetColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_ProductOvertimeColumnFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_ProductOvertimeColumnFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/ProductOvertimeColumnFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveProductOvertimeColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveProductOvertimeColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveProductOvertimeColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelProductOvertimeColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelProductOvertimeColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelProductOvertimeColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveAfterSalesSurveyColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveAfterSalesSurveyColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveAfterSalesSurveyColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_DelAfterSalesSurveyColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_DelAfterSalesSurveyColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/DelAfterSalesSurveyColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_FinanceIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_FinanceIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/FinanceIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_FinanceSellTotalColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_FinanceSellTotalColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/FinanceSellTotalColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveFinanceSellTotalColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveFinanceSellTotalColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveFinanceSellTotalColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Uisetting_SaveFinanceIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Uisetting_SaveFinanceIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Uisetting/SaveFinanceIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_Version11 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_Version11'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/Version11&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_RepairPrivilege = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_RepairPrivilege'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/RepairPrivilege&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_DropColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_DropColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/DropColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_AddInvisibleUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_AddInvisibleUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/AddInvisibleUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_Indexes = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_Indexes'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/Indexes&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_InsertParam = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_InsertParam'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/InsertParam&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_RepairDB = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_RepairDB'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/RepairDB&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_ClearMaintainLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_ClearMaintainLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/ClearMaintainLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_UpdateTable = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_UpdateTable'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/UpdateTable&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_CheckParam = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_CheckParam'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/CheckParam&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_ClearTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_ClearTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/ClearTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_FinanceRepair = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_FinanceRepair'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/FinanceRepair&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_AlterTableEngine = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_AlterTableEngine'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/AlterTableEngine&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_WhListSon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_WhListSon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/WhListSon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_upgradeNewSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_upgradeNewSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/upgradeNewSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_MoveConfigToDb = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_MoveConfigToDb'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/MoveConfigToDb&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_Photo2db = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_Photo2db'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/Photo2db&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade_GetPhotoDirFiles = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade_GetPhotoDirFiles'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade/GetPhotoDirFiles&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Upgrade2015_RunSql = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade2015_RunSql'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade2015/RunSql&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end


czynet.Upgrade2015_ClearMaintainLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Upgrade2015_ClearMaintainLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Upgrade2015/ClearMaintainLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_RunConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_RunConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/RunConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_UpgradeOrderColumnConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_UpgradeOrderColumnConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/UpgradeOrderColumnConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_workshopDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_workshopDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/workshopDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_UpgradeCustotanceColumnConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_UpgradeCustotanceColumnConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/UpgradeCustotanceColumnConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_UpgradeFinantanceColumnConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_UpgradeFinantanceColumnConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/UpgradeFinantanceColumnConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_UpgradePayColumnConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_UpgradePayColumnConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/UpgradePayColumnConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_FinanceOrderColumnConfig = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_FinanceOrderColumnConfig'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/FinanceOrderColumnConfig&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end


czynet.UpgradeColumnConfig_DeliveryOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_DeliveryOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/DeliveryOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductOvertime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductOvertime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductOvertime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AfterSalesSurvey = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AfterSalesSurvey'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AfterSalesSurvey&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductFollow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductFollow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductFollow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductTodayFollow = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductTodayFollow'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductTodayFollow&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductShipping = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductShipping'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductShipping&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_ProductSales = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_ProductSales'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/ProductSales&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AddWorkshopIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AddWorkshopIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AddWorkshopIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AddWorkshopProcessIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AddWorkshopProcessIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AddWorkshopProcessIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AddWorkshopPlan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AddWorkshopPlan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AddWorkshopPlan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AddWorkshopProgress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AddWorkshopProgress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AddWorkshopProgress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_statisticOrderListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_statisticOrderListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/statisticOrderListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_WhBarListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_WhBarListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/WhBarListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_WhGlassListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_WhGlassListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/WhGlassListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_WhPanelListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_WhPanelListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/WhPanelListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_WhAddonListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_WhAddonListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/WhAddonListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_MainListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_MainListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/MainListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_AddWorkshopArranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_AddWorkshopArranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/AddWorkshopArranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_CustomerListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_CustomerListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/CustomerListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_PurBarListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_PurBarListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/PurBarListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_PurGlassListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_PurGlassListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/PurGlassListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_PurPanelListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_PurPanelListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/PurPanelListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_PurAddonListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_PurAddonListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/PurAddonListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_InoutBarListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_InoutBarListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/InoutBarListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_InoutGlassListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_InoutGlassListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/InoutGlassListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_InoutPanelListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_InoutPanelListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/InoutPanelListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_InoutAddonListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_InoutAddonListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/InoutAddonListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_SellBarListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_SellBarListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/SellBarListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_SellGlassListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_SellGlassListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/SellGlassListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_SellPanelListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_SellPanelListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/SellPanelListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_SellAddonListFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_SellAddonListFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/SellAddonListFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_DeliverySet = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_DeliverySet'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/DeliverySet&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_FinanceIndexColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_FinanceIndexColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/FinanceIndexColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UpgradeColumnConfig_FinanceSellTotalColumn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UpgradeColumnConfig_FinanceSellTotalColumn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UpgradeColumnConfig/FinanceSellTotalColumn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportProduct = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportProduct'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportProduct&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportOrdersGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportOrdersGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportOrdersGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportOrdersAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportOrdersAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportOrdersAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_MoneyDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_MoneyDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/MoneyDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportPieces = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportPieces'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportPieces&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportCommissions = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportCommissions'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportCommissions&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportSellOrderCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportSellOrderCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportSellOrderCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportWage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportWage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportWage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportStatisticThings = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportStatisticThings'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportStatisticThings&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportOutitem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportOutitem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportOutitem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportTradeRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportTradeRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportTradeRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_Unlink = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_Unlink'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/Unlink&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByStatMouth = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByStatMouth'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByStatMouth&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByStatCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByStatCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByStatCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByStatArea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByStatArea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByStatArea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByStatCarea = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByStatCarea'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByStatCarea&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportByOutitem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportByOutitem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportByOutitem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportStatisticOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportStatisticOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportStatisticOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportBarcodes = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportBarcodes'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportBarcodes&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportWorkeres = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportWorkeres'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportWorkeres&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportOrdersOutitem = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportOrdersOutitem'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportOrdersOutitem&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_PurcaseExcel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_PurcaseExcel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/PurcaseExcel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcel_ExportThings = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcel_ExportThings'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcel/ExportThings&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_UploadByWhAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_UploadByWhAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/UploadByWhAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportByWhAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportByWhAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportByWhAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_UploadByWhBar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_UploadByWhBar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/UploadByWhBar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportByWhBar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportByWhBar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportByWhBar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportByWhGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportByWhGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportByWhGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_UploadByWhGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_UploadByWhGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/UploadByWhGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportByWhPanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportByWhPanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportByWhPanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportStockFabric = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportStockFabric'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportStockFabric&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_UploadByWhPanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_UploadByWhPanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/UploadByWhPanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportTradeRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportTradeRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportTradeRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportStatistic = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportStatistic'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportStatistic&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportInOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportInOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportInOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportHadDelivery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportHadDelivery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportHadDelivery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportMarket = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportMarket'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportMarket&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportMonthRelativeRatio = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportMonthRelativeRatio'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportMonthRelativeRatio&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportFinanceOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportFinanceOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportFinanceOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportLogisticsOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportLogisticsOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportLogisticsOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportNopurchaseInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportNopurchaseInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportNopurchaseInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportPurchaseInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportPurchaseInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportPurchaseInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportArranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportArranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportArranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportStatisticThing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportStatisticThing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportStatisticThing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_UploadByCustomer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_UploadByCustomer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/UploadByCustomer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportExcel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportExcel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportExcel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportWhsell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportWhsell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportWhsell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_OverTimeExport = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_OverTimeExport'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/OverTimeExport&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.UploadExcelNew_ExportInPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.UploadExcelNew_ExportInPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=UploadExcelNew/ExportInPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_CheckUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_CheckUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/CheckUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_ModefyPasswd = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_ModefyPasswd'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/ModefyPasswd&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_ModefyUser = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_ModefyUser'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/ModefyUser&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Query = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Query'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Query&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Reset = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Reset'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Reset&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_Offline = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_Offline'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/Offline&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_SaveMesssageFilter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_SaveMesssageFilter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/SaveMesssageFilter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_LoadMessageFilter = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_LoadMessageFilter'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/LoadMessageFilter&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.User_EditPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.User_EditPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=User/EditPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveListName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveListName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveListName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_DelListName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_DelListName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/DelListName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SortGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SortGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SortGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveWarehouseList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveWarehouseList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveWarehouseList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_DelWarehouseList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_DelWarehouseList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/DelWarehouseList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_InOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_InOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/InOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_InOutCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_InOutCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/InOutCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_LoadList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_LoadList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/LoadList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_LoadInput = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_LoadInput'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/LoadInput&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_ProcessInOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_ProcessInOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/ProcessInOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_GetBomSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_GetBomSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/GetBomSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SettingSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SettingSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SettingSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_DelSupplier = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_DelSupplier'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/DelSupplier&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_GetWarehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_GetWarehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/GetWarehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SetWarehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SetWarehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SetWarehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_Upload = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_Upload'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/Upload&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_PurchaseIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_PurchaseIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/PurchaseIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_WhPurchaseIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_WhPurchaseIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/WhPurchaseIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SavePurchaseIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SavePurchaseIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SavePurchaseIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_PurchaseInAll = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_PurchaseInAll'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/PurchaseInAll&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_PurchaseInDetails = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_PurchaseInDetails'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/PurchaseInDetails&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SellOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SellOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SellOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_WhSellOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_WhSellOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/WhSellOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveSell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveSell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveSell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SellOutAll = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SellOutAll'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SellOutAll&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SellOutDetails = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SellOutDetails'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SellOutDetails&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SellBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SellBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SellBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_AddSellBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_AddSellBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/AddSellBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_FocusSellCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_FocusSellCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/FocusSellCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_GetSellDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_GetSellDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/GetSellDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveSellBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveSellBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveSellBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SellBackDetails = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SellBackDetails'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SellBackDetails&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_PurchaseBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_PurchaseBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/PurchaseBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_AddPurchaseBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_AddPurchaseBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/AddPurchaseBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_FocusPurchaseCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_FocusPurchaseCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/FocusPurchaseCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_GetPurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_GetPurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/GetPurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SavePurchaseBack = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SavePurchaseBack'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SavePurchaseBack&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_PurchaseBackDetails = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_PurchaseBackDetails'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/PurchaseBackDetails&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_GetWhTatchType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_GetWhTatchType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/GetWhTatchType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveBatchType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveBatchType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveBatchType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_DelBatchType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_DelBatchType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/DelBatchType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_Cart = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_Cart'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/Cart&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_Delcart = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_Delcart'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/Delcart&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_CartAlready = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_CartAlready'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/CartAlready&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_UpdateNameGroup = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_UpdateNameGroup'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/UpdateNameGroup&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveAddMerge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveAddMerge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveAddMerge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_Addmark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_Addmark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/Addmark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_SaveComponent = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_SaveComponent'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/SaveComponent&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_ComponentList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_ComponentList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/ComponentList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Warehouse_DelComponent = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Warehouse_DelComponent'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Warehouse/DelComponent&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_ModifyProperty = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_ModifyProperty'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/ModifyProperty&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_SaveClone = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_SaveClone'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/SaveClone&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_AddBomAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_AddBomAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/AddBomAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_InOutDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_InOutDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/InOutDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_PurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_PurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/PurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_ModifyRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_ModifyRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/ModifyRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_ModifyLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_ModifyLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/ModifyLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_BatchRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_BatchRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/BatchRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_BatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_BatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/BatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_AddMerge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_AddMerge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/AddMerge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_BatchDetailed = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_BatchDetailed'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/BatchDetailed&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_SaveBatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_SaveBatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/SaveBatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_FilterAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_FilterAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/FilterAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_FilterComponentAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_FilterComponentAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/FilterComponentAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_WhSummary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_WhSummary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/WhSummary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_WhWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_WhWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/WhWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_WhPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_WhPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/WhPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_EnterStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_EnterStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/EnterStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_ExitStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_ExitStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/ExitStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_CheckStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_CheckStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/CheckStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_LoadAddonPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_LoadAddonPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/LoadAddonPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseAddon_AddAddonPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseAddon_AddAddonPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseAddon/AddAddonPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_ModifyProperty = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_ModifyProperty'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/ModifyProperty&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_LoadBarPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_LoadBarPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/LoadBarPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_AddBarPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_AddBarPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/AddBarPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_InOutDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_InOutDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/InOutDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_PurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_PurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/PurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_ModifyRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_ModifyRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/ModifyRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_ModifyLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_ModifyLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/ModifyLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_BatchRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_BatchRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/BatchRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_BatchDetailed = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_BatchDetailed'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/BatchDetailed&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_BatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_BatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/BatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_AddMerge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_AddMerge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/AddMerge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_SaveBatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_SaveBatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/SaveBatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_FilterBar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_FilterBar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/FilterBar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_GetFirstCategoryList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_GetFirstCategoryList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/GetFirstCategoryList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_WhSummary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_WhSummary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/WhSummary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_WhWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_WhWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/WhWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_WhPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_WhPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/WhPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_EnterStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_EnterStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/EnterStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_ExitStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_ExitStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/ExitStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseBar_CheckStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseBar_CheckStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseBar/CheckStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_WhCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_WhCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/WhCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_SaveInventory = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_SaveInventory'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/SaveInventory&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_InOutBar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_InOutBar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/InOutBar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_InOutAddon = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_InOutAddon'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/InOutAddon&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_InOutGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_InOutGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/InOutGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_InOutPanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_InOutPanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/InOutPanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_SaveBatchBarOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_SaveBatchBarOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/SaveBatchBarOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_ApiSaveStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_ApiSaveStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/ApiSaveStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_ApiGetWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_ApiGetWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/ApiGetWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_ApiGetStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_ApiGetStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/ApiGetStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseCheck_MovePrint = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseCheck_MovePrint'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseCheck/MovePrint&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_ModifyProperty = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_ModifyProperty'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/ModifyProperty&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_SaveCloneGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_SaveCloneGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/SaveCloneGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_AddBomAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_AddBomAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/AddBomAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_BatchRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_BatchRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/BatchRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_BatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_BatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/BatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_AddMerge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_AddMerge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/AddMerge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_BatchDetailed = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_BatchDetailed'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/BatchDetailed&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_FilterGlass = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_FilterGlass'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/FilterGlass&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_SaveBatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_SaveBatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/SaveBatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_InOutDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_InOutDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/InOutDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_ModifyRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_ModifyRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/ModifyRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_ModifyLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_ModifyLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/ModifyLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_WhSummary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_WhSummary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/WhSummary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_WhWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_WhWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/WhWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_WhPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_WhPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/WhPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_EnterStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_EnterStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/EnterStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_ExitStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_ExitStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/ExitStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_CheckStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_CheckStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/CheckStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_LoadGlassPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_LoadGlassPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/LoadGlassPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseGlass_AddGlassPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseGlass_AddGlassPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseGlass/AddGlassPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_Add = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_Add'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/Add&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_DelThing = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_DelThing'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/DelThing&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_DelOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_DelOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/DelOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_Edit = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_Edit'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/Edit&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseOrder_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseOrder_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseOrder/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_Addmark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_Addmark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/Addmark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_CancelMark = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_CancelMark'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/CancelMark&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_ModifyProperty = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_ModifyProperty'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/ModifyProperty&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_SaveClonePanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_SaveClonePanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/SaveClonePanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_Del = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_Del'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/Del&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_AddBomAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_AddBomAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/AddBomAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_BatchRecords = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_BatchRecords'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/BatchRecords&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_BatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_BatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/BatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_AddMerge = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_AddMerge'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/AddMerge&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_BatchDetailed = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_BatchDetailed'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/BatchDetailed&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_FilterPanel = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_FilterPanel'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/FilterPanel&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_SaveBatchManagement = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_SaveBatchManagement'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/SaveBatchManagement&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_InOutDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_InOutDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/InOutDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_ModifyRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_ModifyRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/ModifyRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_ModifyLog = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_ModifyLog'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/ModifyLog&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_LoadInput = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_LoadInput'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/LoadInput&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_WhSummary = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_WhSummary'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/WhSummary&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_WhWarning = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_WhWarning'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/WhWarning&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_WhPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_WhPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/WhPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_EnterStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_EnterStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/EnterStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_ExitStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_ExitStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/ExitStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_CheckStorage = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_CheckStorage'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/CheckStorage&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_LoadPanelPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_LoadPanelPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/LoadPanelPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePanel_AddPanelPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePanel_AddPanelPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePanel/AddPanelPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_AddWhProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_AddWhProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/AddWhProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_ProcessDetailed = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_ProcessDetailed'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/ProcessDetailed&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_FilterBar = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_FilterBar'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/FilterBar&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_LoadInput = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_LoadInput'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/LoadInput&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_SelectProcessName = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_SelectProcessName'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/SelectProcessName&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_SaveBatchProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_SaveBatchProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/SaveBatchProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.warehouseProcess_Select = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.warehouseProcess_Select'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=warehouseProcess/Select&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_Orders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_Orders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/Orders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_Confirm = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_Confirm'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/Confirm&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_LockMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_LockMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/LockMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_ChangeStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_ChangeStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/ChangeStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_DelPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_DelPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/DelPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_GetPurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_GetPurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/GetPurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_AddPurchase = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_AddPurchase'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/AddPurchase&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_GetCusBom = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_GetCusBom'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/GetCusBom&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_PurchaseDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_PurchaseDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/PurchaseDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_SyncMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_SyncMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/SyncMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_AddPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_AddPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/AddPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_PayInfoBy = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_PayInfoBy'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/PayInfoBy&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_GetTingPriceList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_GetTingPriceList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/GetTingPriceList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_GetMultPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_GetMultPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/GetMultPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_GetPurchaseQuantity = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_GetPurchaseQuantity'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/GetPurchaseQuantity&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehousePurchase_PurchaseUnIn = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehousePurchase_PurchaseUnIn'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehousePurchase/PurchaseUnIn&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_SellRecord = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_SellRecord'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/SellRecord&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_Confirm = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_Confirm'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/Confirm&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_LockMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_LockMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/LockMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_ChangeStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_ChangeStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/ChangeStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_DelSell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_DelSell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/DelSell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_GetSellDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_GetSellDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/GetSellDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_PayInfoBySell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_PayInfoBySell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/PayInfoBySell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_AddPay = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_AddPay'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/AddPay&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_AddSell = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_AddSell'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/AddSell&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_GetTingPriceList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_GetTingPriceList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/GetTingPriceList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_Save = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_Save'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/Save&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_SellDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_SellDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/SellDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_SyncMoney = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_SyncMoney'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/SyncMoney&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WarehouseSell_GetCusPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WarehouseSell_GetCusPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WarehouseSell/GetCusPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WccApi_FinCheck = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WccApi_FinCheck'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WccApi/FinCheck&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WccApi_Scripts = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WccApi_Scripts'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WccApi/Scripts&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_Login'
				
	if tb == nil then
		local tb = {}
    tb.username = ''
    tb.password = ''
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_CustomerOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_CustomerOrder'
				
	if tb == nil then
		local tb = {}
    tb.cid = ''
    tb.keyword = ''
    tb.choose_date = ''
    tb.show_start = ''
    tb.order_id = ''
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/CustomerOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_OrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_OrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.oid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/OrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_GetStatus = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_GetStatus'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/GetStatus&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_LoadOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_LoadOrders'
				
	if tb == nil then
		local tb = {}
    tb.oids = ''
    tb.names = ''
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/LoadOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_GetProgress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_GetProgress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/GetProgress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_Bill = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_Bill'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/Bill&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_LoadRules = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_LoadRules'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/LoadRules&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_LoadInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_LoadInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/LoadInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_GetPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_GetPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/GetPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_GetLogo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_GetLogo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/GetLogo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WebServiceMini_GetKaiShan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WebServiceMini_GetKaiShan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WebServiceMini/GetKaiShan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Export = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Export'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Export&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_UploadPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_UploadPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/UploadPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Confirm = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Confirm'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Confirm&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Customer = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Customer'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Customer&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_SetCall = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_SetCall'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/SetCall&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Power = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Power'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Power&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_SetPower = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_SetPower'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/SetPower&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_Message = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_Message'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/Message&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_GetCustomers = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_GetCustomers'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/GetCustomers&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_MsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_MsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/MsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_SaveMsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_SaveMsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/SaveMsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_delMsgTemplate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_delMsgTemplate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/delMsgTemplate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_AddWeixinMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_AddWeixinMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/AddWeixinMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_MsgList = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_MsgList'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/MsgList&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinCenter_DelMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinCenter_DelMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinCenter/DelMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinclientFormat_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinclientFormat_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinclientFormat/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinclientFormat_SaveRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinclientFormat_SaveRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinclientFormat/SaveRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinclientFormat_DelRule = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinclientFormat_DelRule'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinclientFormat/DelRule&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_Login = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_Login'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/Login&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_CallUs = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_CallUs'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/CallUs&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_OrderDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_OrderDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/OrderDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_Orders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_Orders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/Orders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_OrderAttr = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_OrderAttr'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/OrderAttr&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_Account = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_Account'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/Account&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_GroupOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_GroupOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/GroupOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_Bill = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_Bill'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/Bill&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_GetPhoto = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_GetPhoto'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/GetPhoto&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_GetMsg = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_GetMsg'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/GetMsg&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WeixinMini_WeixinFormat = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WeixinMini_WeixinFormat'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WeixinMini/WeixinFormat&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SavePlanNote = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SavePlanNote'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SavePlanNote&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetProcessTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetProcessTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetProcessTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Plan = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Plan'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Plan&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SaveTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SaveTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SaveTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DelTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DelTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DelTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Progress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Progress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Progress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ExpiredOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ExpiredOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ExpiredOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ExpiredProcess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ExpiredProcess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ExpiredProcess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_OvertimeCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_OvertimeCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/OvertimeCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Overtime = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Overtime'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Overtime&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_MissionQuery = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_MissionQuery'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/MissionQuery&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetProcessInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetProcessInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetProcessInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetProcessIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetProcessIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetProcessIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetProcessIndexTotal = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetProcessIndexTotal'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetProcessIndexTotal&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Config = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Config'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Config&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SaveStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SaveStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SaveStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ChangeStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ChangeStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ChangeStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_IsFinish = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_IsFinish'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/IsFinish&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Worker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Worker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Worker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_CheckWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_CheckWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/CheckWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_AddWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_AddWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/AddWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DelWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DelWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DelWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_AddStepPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_AddStepPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/AddStepPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetStepPrice = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetStepPrice'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetStepPrice&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_MadeCode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_MadeCode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/MadeCode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetStepInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetStepInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetStepInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_UpdateStepInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_UpdateStepInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/UpdateStepInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_AddStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_AddStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/AddStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DelStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DelStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DelStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ForbidStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ForbidStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ForbidStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ResetStep = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ResetStep'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ResetStep&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DelLine = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DelLine'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DelLine&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SetMadeDate = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SetMadeDate'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SetMadeDate&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_BackPlanOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_BackPlanOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/BackPlanOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_StepSort = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_StepSort'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/StepSort&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ReSetWorker = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ReSetWorker'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ReSetWorker&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Warehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Warehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Warehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Addwarehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Addwarehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Addwarehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Delwarehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Delwarehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Delwarehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_WType = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_WType'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/WType&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Updatewarehouse = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Updatewarehouse'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Updatewarehouse&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_GetWarehouseCount = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_GetWarehouseCount'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/GetWarehouseCount&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_BackFinanceOrder = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_BackFinanceOrder'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/BackFinanceOrder&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ArrangeTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ArrangeTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ArrangeTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ProcessTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ProcessTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ProcessTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Arranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Arranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Arranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_BackOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_BackOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/BackOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DescWorkshopIndex = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DescWorkshopIndex'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DescWorkshopIndex&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DescWorkshopProgress = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DescWorkshopProgress'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DescWorkshopProgress&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DescWorkshopDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DescWorkshopDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DescWorkshopDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DescWorkshopArranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DescWorkshopArranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DescWorkshopArranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_BarSeo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_BarSeo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/BarSeo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_AddonOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_AddonOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/AddonOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_Reprocess = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_Reprocess'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/Reprocess&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_MatchDetails = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_MatchDetails'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/MatchDetails&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SaveDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SaveDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SaveDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_DelDetail = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_DelDetail'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/DelDetail&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ArrangedSingleMode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ArrangedSingleMode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ArrangedSingleMode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_ArrangeTask2 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_ArrangeTask2'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/ArrangeTask2&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Workshop_SaveGroupDoor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Workshop_SaveGroupDoor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Workshop/SaveGroupDoor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopGroup_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopGroup_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopGroup/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopGroup_Arranged = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopGroup_Arranged'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopGroup/Arranged&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopGroup_ArrangedSingleMode = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopGroup_ArrangedSingleMode'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopGroup/ArrangedSingleMode&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopGroup_ArrangeTask2 = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopGroup_ArrangeTask2'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopGroup/ArrangeTask2&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopGroup_SaveGroupDoor = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopGroup_SaveGroupDoor'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopGroup/SaveGroupDoor&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopSeo_BarSeo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopSeo_BarSeo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopSeo/BarSeo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopSeo_GlassSeo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopSeo_GlassSeo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopSeo/GlassSeo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopSeo_SaveBarSeo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopSeo_SaveBarSeo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopSeo/SaveBarSeo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopSeo_SaveAddonOut = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopSeo_SaveAddonOut'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopSeo/SaveAddonOut&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopTv_ProcessOverdue = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopTv_ProcessOverdue'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopTv/ProcessOverdue&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopTv_ProcessOverdueOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopTv_ProcessOverdueOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopTv/ProcessOverdueOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopTv_UrgentOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopTv_UrgentOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopTv/UrgentOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopTv_GetUrgentOrders = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopTv_GetUrgentOrders'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopTv/GetUrgentOrders&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.WorkshopTv_OrderTask = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.WorkshopTv_OrderTask'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=WorkshopTv/OrderTask&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.Xcopy_XCopyMini = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.Xcopy_XCopyMini'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=Xcopy/XCopyMini&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.afterSaleAsErectProduct_Index = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.afterSaleAsErectProduct_Index'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/Index&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.afterSaleAsErectProduct_ErectDone = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.afterSaleAsErectProduct_ErectDone'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/ErectDone&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end

czynet.afterSaleAsErectProduct_SaveErectInfo = function(self,tb)

	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.afterSaleAsErectProduct_SaveErectInfo'
				
	if tb == nil then
		local tb = {}
		tb.gid 	= '0'
		return top.table,callbackey,tb
	end
	
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then
							
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)	
					
	return self.table,callbackey	
				
end


-----------------------------------------------------------------------------------------------------------------------------------

czynet.cgfordermodify = function(self,tb)
	local top = self
	local callbackey = 'czynet.cgfordermodify'	
	self.table = 'czy_script_groups'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgforderlist = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfordermodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfusermodify = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfordermodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfscriptpost = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfscriptpost'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfcustomerdetail = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfcgfordermodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfcustomeritem = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfcustomeritem'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfscriptmodify = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfscriptmodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfscriptitem = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfscriptitem'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfcustomerlist = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfcustomerlist'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=customer/index&ajax=all&prj='..g_mainModule ,function(netdata)
		table.print(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfuserlist = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfuserlist'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfloginform = function(self,tb)		
	return self:login(tb)
end

czynet.cgfscriptlist = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfscriptlist'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgforderdetail = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgforderdetail'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfuserpost = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfuserpost'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfcustomerpost = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfcgfordermodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfcustomermodify = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfcustomermodify'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfuseritem = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfuseritem'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfuserdetail = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfuserdetail'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgforderitem = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgforderitem'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgforderpost = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgforderpost'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

czynet.cgfscriptdetail = function(self,tb)
	local top = self
	self.table = 'czy_script_groups'	
	local callbackey = 'czynet.cgfscriptdetail'	
	if tb == nil then
		local tb = {}
		return top.table,callbackey,tb
	end
	gxo_curl(self.base..'r=afterSaleAsErectProduct/SaveErectInfo&ajax=all&prj='..g_mainModule ,function(netdata)
		local data = netdata['value']
		if data ~= nil and table.size(data) > 0 then			
		end	
		top:SetDirty(true)
		top:handle_callback(callbackey,top.tablename,tb,netdata)				
	end,tb)			
	return self.table,callbackey	
end

