
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsrewardreplymgr = inherit(gm_ruanjianwaibaojiaoyisuo.mrewardreplymgr):name("clsrewardreplymgr")


clsrewardreplymgr.instance = nil


clsrewardreplymgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr.instance = gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr.instance
end





clsrewardreplymgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.mrewardreplymgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsrewardreplymgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	