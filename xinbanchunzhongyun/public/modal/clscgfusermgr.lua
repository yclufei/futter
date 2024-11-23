
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clscgfusermgr = inherit(gm_xinbanchunzhongyun.mcgfusermgr):name("clscgfusermgr")


clscgfusermgr.instance = nil


clscgfusermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clscgfusermgr.instance == nil then
		gm_xinbanchunzhongyun.clscgfusermgr.instance = gm_xinbanchunzhongyun.clscgfusermgr(pagecount)
		gm_xinbanchunzhongyun.clscgfusermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clscgfusermgr.instance
end





clscgfusermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mcgfusermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clscgfusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	