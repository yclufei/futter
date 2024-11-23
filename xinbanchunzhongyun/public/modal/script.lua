

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mscript = inherit(GmSql.list,GmBase.CallBack):name("mscript")

mscript.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'script')
	GmBase.CallBack.init(self)
	

	
end 



	