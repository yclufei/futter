
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsforumforummgr = inherit(gm_chayegongsi.mforumforummgr):name("clsforumforummgr")


clsforumforummgr.instance = nil


clsforumforummgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsforumforummgr.instance == nil then
		gm_chayegongsi.clsforumforummgr.instance = gm_chayegongsi.clsforumforummgr(pagecount)
		gm_chayegongsi.clsforumforummgr.instance:init_table()
	end
	return gm_chayegongsi.clsforumforummgr.instance
end





clsforumforummgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mforumforummgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforumforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	