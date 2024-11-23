
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsservicemgr = inherit(gm_chayegongsi.mservicemgr):name("clsservicemgr")


clsservicemgr.instance = nil


clsservicemgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsservicemgr.instance == nil then
		gm_chayegongsi.clsservicemgr.instance = gm_chayegongsi.clsservicemgr(pagecount)
		gm_chayegongsi.clsservicemgr.instance:init_table()
	end
	return gm_chayegongsi.clsservicemgr.instance
end





clsservicemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mservicemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsservicemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	