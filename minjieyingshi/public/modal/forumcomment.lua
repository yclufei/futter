

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_minjieyingshi")

mforumcomment = inherit(GmSql.list,GmBase.CallBack):name("mforumcomment")

mforumcomment.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_thread')
	GmBase.CallBack.init(self)
	

	
end 



	