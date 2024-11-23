
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsrewardmgr = inherit(gm_chayegongsi.mrewardmgr):name("clsrewardmgr")


clsrewardmgr.instance = nil


clsrewardmgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsrewardmgr.instance == nil then
		gm_chayegongsi.clsrewardmgr.instance = gm_chayegongsi.clsrewardmgr(pagecount)
		gm_chayegongsi.clsrewardmgr.instance:init_table()
	end
	return gm_chayegongsi.clsrewardmgr.instance
end





clsrewardmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mrewardmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsrewardmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	