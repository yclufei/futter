
		


gr_module("GmBase")


imnet = inherit(GmSql.list,GmBase.CallBack):name("imnet")




imnet.instance = nil


imnet.get_instance = function(pagecount)
	if GmBase.imnet.instance == nil then
		GmBase.imnet.instance = GmBase.imnet(pagecount)
		GmBase.imnet.instance:init_table()
	end
	return GmBase.imnet.instance
end

imnet.init_table = function(self)

end



imnet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'appserver/public/'
end

imnet.product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.product.list',callback,p)
end
		

imnet.home_product_list = function(self,callback)
	gxo_curl('http://120.24.2.101/appserver/public/v2/ecapi.home.product.list',callback)
end
		
		