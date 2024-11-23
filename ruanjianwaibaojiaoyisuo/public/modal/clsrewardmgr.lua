
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsrewardmgr = inherit(gm_ruanjianwaibaojiaoyisuo.mrewardmgr):name("clsrewardmgr")


clsrewardmgr.instance = nil


clsrewardmgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.instance = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.instance
end





clsrewardmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mrewardmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsrewardmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	