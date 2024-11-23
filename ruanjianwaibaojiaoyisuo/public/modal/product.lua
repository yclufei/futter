

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

mproduct = inherit(GmSql.list,GmBase.CallBack):name("mproduct")

mproduct.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_thread')
	GmBase.CallBack.init(self)
	

	
end 



	