

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mthreadtype = inherit(GmSql.list,GmBase.CallBack):name("mthreadtype")

mthreadtype.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'cgfscript')
	GmBase.CallBack.init(self)
	

	
end 



	