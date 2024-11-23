
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clscustomermgr = inherit(gm_xinbanchunzhongyun.mcustomermgr):name("clscustomermgr")


clscustomermgr.instance = nil


clscustomermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clscustomermgr.instance == nil then
		gm_xinbanchunzhongyun.clscustomermgr.instance = gm_xinbanchunzhongyun.clscustomermgr(pagecount)
		gm_xinbanchunzhongyun.clscustomermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clscustomermgr.instance
end





clscustomermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mcustomermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clscustomermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	