
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clscgfscriptmgr = inherit(gm_xinbanchunzhongyun.mcgfscriptmgr):name("clscgfscriptmgr")


clscgfscriptmgr.instance = nil


clscgfscriptmgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clscgfscriptmgr.instance == nil then
		gm_xinbanchunzhongyun.clscgfscriptmgr.instance = gm_xinbanchunzhongyun.clscgfscriptmgr(pagecount)
		gm_xinbanchunzhongyun.clscgfscriptmgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clscgfscriptmgr.instance
end





clscgfscriptmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mcgfscriptmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clscgfscriptmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	