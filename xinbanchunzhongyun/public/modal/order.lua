

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

morder = inherit(GmSql.list,GmBase.CallBack):name("morder")

morder.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'order')
	GmBase.CallBack.init(self)
	

	
end 



	