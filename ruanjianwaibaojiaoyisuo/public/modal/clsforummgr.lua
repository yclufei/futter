
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsforummgr = inherit(gm_ruanjianwaibaojiaoyisuo.mforummgr):name("clsforummgr")


clsforummgr.instance = nil


clsforummgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsforummgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsforummgr.instance = gm_ruanjianwaibaojiaoyisuo.clsforummgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsforummgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsforummgr.instance
end





clsforummgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mforummgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	