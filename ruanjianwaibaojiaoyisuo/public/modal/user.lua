

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

muser = inherit(GmSql.list,GmBase.CallBack):name("muser")

muser.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_member')
	GmBase.CallBack.init(self)
	

	
end 



	