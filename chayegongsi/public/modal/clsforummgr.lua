
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsforummgr = inherit(gm_chayegongsi.mforummgr):name("clsforummgr")


clsforummgr.instance = nil


clsforummgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsforummgr.instance == nil then
		gm_chayegongsi.clsforummgr.instance = gm_chayegongsi.clsforummgr(pagecount)
		gm_chayegongsi.clsforummgr.instance:init_table()
	end
	return gm_chayegongsi.clsforummgr.instance
end





clsforummgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mforummgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	