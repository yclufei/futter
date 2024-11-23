
gr_module("GmBase")


tipasknet = inherit(GmSql.list,GmBase.CallBack):name("tipasknet")



tipasknet.instance = nil


tipasknet.get_instance = function(pagecount)
	if GmBase.tipasknet.instance == nil then
		GmBase.tipasknet.instance = GmBase.tipasknet(pagecount)
		GmBase.tipasknet.instance:init_table()
	end
	return GmBase.tipasknet.instance
end



tipasknet.init_table = function(self)

end



tipasknet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	
	self.base = g_serverRoot..'appserver/qs/'
end

tipasknet.product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.product.list',callback,p)
end
		

tipasknet.home_product_list = function(self,callback)
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.home.product.list',callback)
end
		

tipasknet.category_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end


tipasknet.article_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.notice_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_notify_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_intro_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_share_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.ecapi_auth_web = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.ecapi_auth_web_callback_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.access_dns = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.access_batch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.category_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.home_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.search_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.review_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.review_product_subtotal = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.recommend_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_accessory_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_signin = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_social = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_default_signup = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_mobile_signup = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.user_profile_fields = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_mobile_verify = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_mobile_send = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_mobile_reset = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.auth_default_reset = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cardpage_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cardpage_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.config_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.article_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.brand_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.search_keyword_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.region_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.invoice_type_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.invoice_content_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.invoice_status_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.notice_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.banner_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.version_check = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.recommend_brand_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.message_system_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.message_count = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.site_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.splash_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.splash_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.theme_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.theme_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.search_category_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_reason_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.search_shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.recommend_shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shop_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.areacode_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.user_profile_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.user_profile_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.user_password_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_confirm = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_cancel = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_price = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_like = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_unlike = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_liked_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_review = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.order_subtotal = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.payment_types_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.payment_pay = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shipping_vendor_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shipping_status_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.consignee_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.consignee_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.consignee_add = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.consignee_delete = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.consignee_setDefault = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.score_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.score_history_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cashgift_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cashgift_available = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.push_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_add = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_clear = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_delete = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_checkout = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.cart_promos = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_purchase = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.product_validate = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.message_order_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shop_watch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shop_unwatch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.shop_watching_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.coupon_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.coupon_available = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.recommend_bonus_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.recommend_bonus_info = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.withdraw_submit = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.withdraw_cancel = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.withdraw_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end
tipasknet.withdraw_info = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end

tipasknet.balance_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end

tipasknet.balance_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.category.list',callback,p)
end

