

-- D:\GOA\reslibrary\templete\res\modal\modal.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

mprofile = inherit(GmSql.list,GmBase.CallBack):name("mprofile")

mprofile.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_profile')
	GmBase.CallBack.init(self)
	

	
end 



	