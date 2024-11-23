
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsprofilemgr = inherit(gm_ruanjianwaibaojiaoyisuo.mprofilemgr):name("clsprofilemgr")


clsprofilemgr.instance = nil


clsprofilemgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsprofilemgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsprofilemgr.instance = gm_ruanjianwaibaojiaoyisuo.clsprofilemgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsprofilemgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsprofilemgr.instance
end





clsprofilemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mprofilemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsprofilemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end
