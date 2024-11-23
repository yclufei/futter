
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsservicemgr = inherit(gm_ruanjianwaibaojiaoyisuo.mservicemgr):name("clsservicemgr")


clsservicemgr.instance = nil


clsservicemgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsservicemgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsservicemgr.instance = gm_ruanjianwaibaojiaoyisuo.clsservicemgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsservicemgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsservicemgr.instance
end





clsservicemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mservicemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsservicemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	