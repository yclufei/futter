
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_minjieyingshi")


clsranklistmgr = inherit(gm_minjieyingshi.mranklistmgr):name("clsranklistmgr")


clsranklistmgr.instance = nil


clsranklistmgr.get_instance = function(pagecount)
	if gm_minjieyingshi.clsranklistmgr.instance == nil then
		gm_minjieyingshi.clsranklistmgr.instance = gm_minjieyingshi.clsranklistmgr(pagecount)
		gm_minjieyingshi.clsranklistmgr.instance:init_table()
	end
	return gm_minjieyingshi.clsranklistmgr.instance
end





clsranklistmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_minjieyingshi.mranklistmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsranklistmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	