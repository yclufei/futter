

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_minjieyingshi")

mranklist = inherit(GmSql.list,GmBase.CallBack):name("mranklist")

mranklist.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_ranklist')
	GmBase.CallBack.init(self)
	

	
end 



	