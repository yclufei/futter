
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsproductmgr = inherit(gm_ruanjianwaibaojiaoyisuo.mproductmgr):name("clsproductmgr")


clsproductmgr.instance = nil


clsproductmgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsproductmgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsproductmgr.instance = gm_ruanjianwaibaojiaoyisuo.clsproductmgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsproductmgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsproductmgr.instance
end





clsproductmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mproductmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsproductmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	