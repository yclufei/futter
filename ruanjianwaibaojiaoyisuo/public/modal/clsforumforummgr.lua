
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsforumforummgr = inherit(gm_ruanjianwaibaojiaoyisuo.mforumforummgr):name("clsforumforummgr")


clsforumforummgr.instance = nil


clsforumforummgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsforumforummgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsforumforummgr.instance = gm_ruanjianwaibaojiaoyisuo.clsforumforummgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsforumforummgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsforumforummgr.instance
end





clsforumforummgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mforumforummgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforumforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	