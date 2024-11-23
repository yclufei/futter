
		


gr_module("GmBase")


city58net = inherit(GmSql.list,GmBase.CallBack):name("city58net")


city58net.instance = nil


city58net.get_instance = function(pagecount)
	if GmBase.city58net.instance == nil then
		GmBase.city58net.instance = GmBase.city58net(pagecount)
		GmBase.city58net.instance:init_table()
	end
	return GmBase.city58net.instance
end

city58net.init_table = function(self)

end



city58net.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'appserver/public/'
	
end

city58net.product_list = function(self,page,per_page,callback)
	local p = {}
	p['page'] = page
	p['per_page'] = per_page
	gxo_curl(self.base..'v2/ecapi.product.list',callback,p)
end
		
		