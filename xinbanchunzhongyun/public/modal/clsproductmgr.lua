
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsproductmgr = inherit(gm_xinbanchunzhongyun.mproductmgr):name("clsproductmgr")


clsproductmgr.instance = nil


clsproductmgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsproductmgr.instance == nil then
		gm_xinbanchunzhongyun.clsproductmgr.instance = gm_xinbanchunzhongyun.clsproductmgr(pagecount)
		gm_xinbanchunzhongyun.clsproductmgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsproductmgr.instance
end





clsproductmgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mproductmgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsproductmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	