

g_datasource = function(tbname,where,order,page,count)
	local mgr = GmSql.list(gInfo['path']..'/'..g_local_db_name,tbname)
	local re = mgr:GetPage2({},page, count , where , order)
	return re
end
