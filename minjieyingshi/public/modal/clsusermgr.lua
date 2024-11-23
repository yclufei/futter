
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_minjieyingshi")


clsusermgr = inherit(gm_minjieyingshi.musermgr):name("clsusermgr")


clsusermgr.instance = nil


clsusermgr.get_instance = function(pagecount)
	if gm_minjieyingshi.clsusermgr.instance == nil then
		gm_minjieyingshi.clsusermgr.instance = gm_minjieyingshi.clsusermgr(pagecount)
		gm_minjieyingshi.clsusermgr.instance:init_table()
	end
	return gm_minjieyingshi.clsusermgr.instance
end





clsusermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_minjieyingshi.musermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	