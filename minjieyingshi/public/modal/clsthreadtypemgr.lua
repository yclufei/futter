
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_minjieyingshi")


clsthreadtypemgr = inherit(gm_minjieyingshi.mthreadtypemgr):name("clsthreadtypemgr")


clsthreadtypemgr.instance = nil


clsthreadtypemgr.get_instance = function(pagecount)
	if gm_minjieyingshi.clsthreadtypemgr.instance == nil then
		gm_minjieyingshi.clsthreadtypemgr.instance = gm_minjieyingshi.clsthreadtypemgr(pagecount)
		gm_minjieyingshi.clsthreadtypemgr.instance:init_table()
	end
	return gm_minjieyingshi.clsthreadtypemgr.instance
end





clsthreadtypemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_minjieyingshi.mthreadtypemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsthreadtypemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	