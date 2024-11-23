
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsscriptmgr = inherit(gm_xinbanchunzhongyun.mscriptmgr):name("clsscriptmgr")


clsscriptmgr.instance = nil


clsscriptmgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsscriptmgr.instance == nil then
		gm_xinbanchunzhongyun.clsscriptmgr.instance = gm_xinbanchunzhongyun.clsscriptmgr(pagecount)
		gm_xinbanchunzhongyun.clsscriptmgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsscriptmgr.instance
end





clsscriptmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mscriptmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsscriptmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	