

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mcgfscript = inherit(GmSql.list,GmBase.CallBack):name("mcgfscript")

mcgfscript.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_script')
	GmBase.CallBack.init(self)
	

	
end 



	