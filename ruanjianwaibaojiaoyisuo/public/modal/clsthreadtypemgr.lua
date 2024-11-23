
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsthreadtypemgr = inherit(gm_ruanjianwaibaojiaoyisuo.mthreadtypemgr):name("clsthreadtypemgr")


clsthreadtypemgr.instance = nil


clsthreadtypemgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.instance = gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.instance
end





clsthreadtypemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mthreadtypemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsthreadtypemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	