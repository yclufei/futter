
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clscgfcustomermgr = inherit(gm_xinbanchunzhongyun.mcgfcustomermgr):name("clscgfcustomermgr")


clscgfcustomermgr.instance = nil


clscgfcustomermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clscgfcustomermgr.instance == nil then
		gm_xinbanchunzhongyun.clscgfcustomermgr.instance = gm_xinbanchunzhongyun.clscgfcustomermgr(pagecount)
		gm_xinbanchunzhongyun.clscgfcustomermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clscgfcustomermgr.instance
end





clscgfcustomermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mcgfcustomermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clscgfcustomermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	