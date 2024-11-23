
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsusermgr = inherit(gm_xinbanchunzhongyun.musermgr):name("clsusermgr")


clsusermgr.instance = nil


clsusermgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsusermgr.instance == nil then
		gm_xinbanchunzhongyun.clsusermgr.instance = gm_xinbanchunzhongyun.clsusermgr(pagecount)
		gm_xinbanchunzhongyun.clsusermgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsusermgr.instance
end





clsusermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.musermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	