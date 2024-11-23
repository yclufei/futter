
gr_module("GmBase")

ucenternet = inherit(GmSql.list,GmBase.CallBack):name("ucenternet")

ucenternet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'user')
	GmBase.CallBack.init(self)
	
	self.base = g_serverRoot..'appserver/public/'
		
end


ucenternet.instance = nil


ucenternet.get_instance = function(pagecount)
	if GmBase.ucenternet.instance == nil then
		GmBase.ucenternet.instance = GmBase.ucenternet(pagecount)
		GmBase.ucenternet.instance:init_table()
	end
	return GmBase.ucenternet.instance
end

ucenternet.init_table = function(self)

end



ucenternet.login = function(self,username,password,callback)
	local url = string.format(g_serverRoot..'root/appapi/login.php?username=%s&password=%s',username,password)
	gxo_curl(url,callback)		
end
		
ucenternet.register = function(self,username,password,password2,callback)
	local tmpstr = g_serverRoot..'root/appapi/register.php?username=%s&password=%s&password2=%s&email=%s@qq.com'
	local url = string.format(tmpstr,username,password,password2,username)
	gxo_curl(url,callback)
end