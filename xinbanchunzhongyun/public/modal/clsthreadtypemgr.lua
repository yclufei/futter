
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_xinbanchunzhongyun")


clsthreadtypemgr = inherit(gm_xinbanchunzhongyun.mthreadtypemgr):name("clsthreadtypemgr")


clsthreadtypemgr.instance = nil


clsthreadtypemgr.get_instance = function(pagecount)
	if gm_xinbanchunzhongyun.clsthreadtypemgr.instance == nil then
		gm_xinbanchunzhongyun.clsthreadtypemgr.instance = gm_xinbanchunzhongyun.clsthreadtypemgr(pagecount)
		gm_xinbanchunzhongyun.clsthreadtypemgr.instance:init_table()
	end
	return gm_xinbanchunzhongyun.clsthreadtypemgr.instance
end





clsthreadtypemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_xinbanchunzhongyun.mthreadtypemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsthreadtypemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	