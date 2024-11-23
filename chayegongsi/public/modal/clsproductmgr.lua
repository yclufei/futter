
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsproductmgr = inherit(gm_chayegongsi.mproductmgr):name("clsproductmgr")


clsproductmgr.instance = nil


clsproductmgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsproductmgr.instance == nil then
		gm_chayegongsi.clsproductmgr.instance = gm_chayegongsi.clsproductmgr(pagecount)
		gm_chayegongsi.clsproductmgr.instance:init_table()
	end
	return gm_chayegongsi.clsproductmgr.instance
end





clsproductmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mproductmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsproductmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	