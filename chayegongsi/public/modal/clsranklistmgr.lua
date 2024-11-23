
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsranklistmgr = inherit(gm_chayegongsi.mranklistmgr):name("clsranklistmgr")


clsranklistmgr.instance = nil


clsranklistmgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsranklistmgr.instance == nil then
		gm_chayegongsi.clsranklistmgr.instance = gm_chayegongsi.clsranklistmgr(pagecount)
		gm_chayegongsi.clsranklistmgr.instance:init_table()
	end
	return gm_chayegongsi.clsranklistmgr.instance
end





clsranklistmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mranklistmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsranklistmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	