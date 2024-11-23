
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clscgfordermgr = inherit(gm_xinbanchunzhongyun.mcgfordermgr):name("clscgfordermgr")


clscgfordermgr.instance = nil


clscgfordermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clscgfordermgr.instance == nil then
		gm_xinbanchunzhongyun.clscgfordermgr.instance = gm_xinbanchunzhongyun.clscgfordermgr(pagecount)
		gm_xinbanchunzhongyun.clscgfordermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clscgfordermgr.instance
end





clscgfordermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mcgfordermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clscgfordermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	