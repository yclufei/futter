
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsranklistmgr = inherit(gm_ruanjianwaibaojiaoyisuo.mranklistmgr):name("clsranklistmgr")


clsranklistmgr.instance = nil


clsranklistmgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsranklistmgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsranklistmgr.instance = gm_ruanjianwaibaojiaoyisuo.clsranklistmgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsranklistmgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsranklistmgr.instance
end





clsranklistmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mranklistmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsranklistmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	