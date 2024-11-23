
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsusermgr = inherit(gm_chayegongsi.musermgr):name("clsusermgr")


clsusermgr.instance = nil


clsusermgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsusermgr.instance == nil then
		gm_chayegongsi.clsusermgr.instance = gm_chayegongsi.clsusermgr(pagecount)
		gm_chayegongsi.clsusermgr.instance:init_table()
	end
	return gm_chayegongsi.clsusermgr.instance
end





clsusermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.musermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	