
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsclientmgr = inherit(gm_xinbanchunzhongyun.mclientmgr):name("clsclientmgr")


clsclientmgr.instance = nil


clsclientmgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsclientmgr.instance == nil then
		gm_xinbanchunzhongyun.clsclientmgr.instance = gm_xinbanchunzhongyun.clsclientmgr(pagecount)
		gm_xinbanchunzhongyun.clsclientmgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsclientmgr.instance
end





clsclientmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mclientmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsclientmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	