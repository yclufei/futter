
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsforumcommentmgr = inherit(gm_chayegongsi.mforumcommentmgr):name("clsforumcommentmgr")


clsforumcommentmgr.instance = nil


clsforumcommentmgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsforumcommentmgr.instance == nil then
		gm_chayegongsi.clsforumcommentmgr.instance = gm_chayegongsi.clsforumcommentmgr(pagecount)
		gm_chayegongsi.clsforumcommentmgr.instance:init_table()
	end
	return gm_chayegongsi.clsforumcommentmgr.instance
end





clsforumcommentmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mforumcommentmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforumcommentmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	