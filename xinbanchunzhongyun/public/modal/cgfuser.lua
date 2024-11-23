

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mcgfuser = inherit(GmSql.list,GmBase.CallBack):name("mcgfuser")

mcgfuser.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_user')
	GmBase.CallBack.init(self)
	

	
end 



	