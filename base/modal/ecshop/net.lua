
		


gr_module("GmBase")


ecshopnet = inherit(GmSql.list,GmBase.CallBack):name("ecshopnet")


ecshopnet.instance = nil


ecshopnet.get_instance = function(pagecount)
	if GmBase.ecshopnet.instance == nil then
		GmBase.ecshopnet.instance = GmBase.ecshopnet(pagecount)
		GmBase.ecshopnet.instance:init_table()
	end
	return GmBase.ecshopnet.instance
end

ecshopnet.init_table = function(self)

end



ecshopnet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'appserver/public/'
	
end

    
ecshopnet.auth_signin = function(self,username,password,callback)
	local p = {}
	p['username'] = username
	p['password'] = password
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.auth.signin',callback,p)
end
    

ecshopnet.product_list = function(self,page,per_page,callback)
	local url = 'http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.product.list?page=%d&per_page=%d'
	local url = string.format(url,tostring(page),tostring(per_page))
	print('####################### ecshopnet.product_list',url)
	gxo_curl(url,callback)
end
		

ecshopnet.home_product_list = function(self,callback)
	local p = {}
	p['page'] = 1
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.home.product.list',callback,p)
end


ecshopnet.banner_list = function(self,callback)
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.banner.list',callback)
end

ecshopnet.areacode_list = function(self,callback)
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.areacode.list',callback)
end


ecshopnet.category_list = function(self,page,per_page,shop,category,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	p['category'] = category
	p['shop'] = shop
	local urlbase = 'http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.category.list?page=%s&per_page=%s'
	local url = string.format(urlbase,tostring(page),tostring(per_page))
	if shop then
		url = url..'&shop='..tostring(shop)
	end
	if category then
		url = url..'&category='..tostring(category)
	end
	print('ecshopnet.category_list',url)
	gxo_curl(url,callback,p)
end

ecshopnet.brand_list = function(self,page,per_page,callback)
	local urlbase = 'http://120.24.2.101/ecmall/ecmall/appserver/public/v2/ecapi.brand.list?page=%s&per_page=%s'
	local url = string.format(urlbase,tostring(page),tostring(per_page))
	print('ecshopnet.brand_list',url)
	gxo_curl(url,callback)
end

ecshopnet.article_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.notice_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_notify_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_intro_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_share_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.ecapi_auth_web = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.ecapi_auth_web_callback_x = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.access_dns = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.access_batch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end


ecshopnet.home_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.search_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.review_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.review_product_subtotal = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.recommend_product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_accessory_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end

ecshopnet.auth_social = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_default_signup = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_mobile_signup = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.user_profile_fields = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_mobile_verify = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_mobile_send = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_mobile_reset = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.auth_default_reset = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cardpage_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cardpage_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.config_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.article_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end

ecshopnet.search_keyword_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.region_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.invoice_type_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.invoice_content_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.invoice_status_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.notice_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.banner_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.version_check = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.recommend_brand_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.message_system_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.message_count = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.site_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.splash_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.splash_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.theme_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.theme_preview = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.search_category_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_reason_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.search_shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.recommend_shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shop_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shop_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.areacode_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.user_profile_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.user_profile_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.user_password_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_confirm = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_cancel = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_price = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_like = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_unlike = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_liked_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_review = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.order_subtotal = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.payment_types_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.payment_pay = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shipping_vendor_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shipping_status_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.consignee_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.consignee_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.consignee_add = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.consignee_delete = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.consignee_setDefault = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.score_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.score_history_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cashgift_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cashgift_available = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.push_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_add = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_clear = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_delete = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_update = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_checkout = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.cart_promos = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_purchase = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.product_validate = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.message_order_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shop_watch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shop_unwatch = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.shop_watching_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.coupon_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.coupon_available = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.recommend_bonus_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.recommend_bonus_info = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.withdraw_submit = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.withdraw_cancel = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.withdraw_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end
ecshopnet.withdraw_info = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end

ecshopnet.balance_get = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end

ecshopnet.balance_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/ecmall/ecmall/appserver/public/v2//ecapi.category.list',callback,p)
end

