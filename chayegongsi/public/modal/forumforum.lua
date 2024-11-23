

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_chayegongsi")

mforumforum = inherit(GmSql.list,GmBase.CallBack):name("mforumforum")

mforumforum.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_forum')
	GmBase.CallBack.init(self)
	

	
end 



	