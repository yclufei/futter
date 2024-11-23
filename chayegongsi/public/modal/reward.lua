

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_chayegongsi")

mreward = inherit(GmSql.list,GmBase.CallBack):name("mreward")

mreward.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_thread')
	GmBase.CallBack.init(self)
	

	
end 



	