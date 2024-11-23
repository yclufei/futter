
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_minjieyingshi")


clsvideomgr = inherit(gm_minjieyingshi.mvideomgr):name("clsvideomgr")


clsvideomgr.instance = nil


clsvideomgr.get_instance = function(pagecount)
	if gm_minjieyingshi.clsvideomgr.instance == nil then
		gm_minjieyingshi.clsvideomgr.instance = gm_minjieyingshi.clsvideomgr(pagecount)
		gm_minjieyingshi.clsvideomgr.instance:init_table()
	end
	return gm_minjieyingshi.clsvideomgr.instance
end





clsvideomgr.init = function (self,pagecount)

	local top = self
	
	
	gm_minjieyingshi.mvideomgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsvideomgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	