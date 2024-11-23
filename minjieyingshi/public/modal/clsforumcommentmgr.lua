
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_minjieyingshi")


clsforumcommentmgr = inherit(gm_minjieyingshi.mforumcommentmgr):name("clsforumcommentmgr")


clsforumcommentmgr.instance = nil


clsforumcommentmgr.get_instance = function(pagecount)
	if gm_minjieyingshi.clsforumcommentmgr.instance == nil then
		gm_minjieyingshi.clsforumcommentmgr.instance = gm_minjieyingshi.clsforumcommentmgr(pagecount)
		gm_minjieyingshi.clsforumcommentmgr.instance:init_table()
	end
	return gm_minjieyingshi.clsforumcommentmgr.instance
end





clsforumcommentmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_minjieyingshi.mforumcommentmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsforumcommentmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	