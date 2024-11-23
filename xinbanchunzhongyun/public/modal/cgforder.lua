

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_xinbanchunzhongyun")

mcgforder = inherit(GmSql.list,GmBase.CallBack):name("mcgforder")

mcgforder.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_order')
	GmBase.CallBack.init(self)
	

	
end 



	