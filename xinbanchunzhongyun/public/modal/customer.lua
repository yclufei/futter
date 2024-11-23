

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mcustomer = inherit(GmSql.list,GmBase.CallBack):name("mcustomer")

mcustomer.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'customer')
	GmBase.CallBack.init(self)
	

	
end 



	