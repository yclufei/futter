

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mcgfcustomer = inherit(GmSql.list,GmBase.CallBack):name("mcgfcustomer")

mcgfcustomer.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_customer')
	GmBase.CallBack.init(self)
	

	
end 



	