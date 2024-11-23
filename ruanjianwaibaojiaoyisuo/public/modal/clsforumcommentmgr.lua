
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsforumcommentmgr = inherit(gm_ruanjianwaibaojiaoyisuo.mforumcommentmgr):name("clsforumcommentmgr")


clsforumcommentmgr.instance = nil


clsforumcommentmgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr.instance = gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr.instance
end





clsforumcommentmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mforumcommentmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforumcommentmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	