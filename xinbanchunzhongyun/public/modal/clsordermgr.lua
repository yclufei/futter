
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsordermgr = inherit(gm_xinbanchunzhongyun.mordermgr):name("clsordermgr")


clsordermgr.instance = nil


clsordermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsordermgr.instance == nil then
		gm_xinbanchunzhongyun.clsordermgr.instance = gm_xinbanchunzhongyun.clsordermgr(pagecount)
		gm_xinbanchunzhongyun.clsordermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsordermgr.instance
end





clsordermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mordermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsordermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	