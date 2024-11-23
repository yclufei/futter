
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsthreadtypemgr = inherit(gm_chayegongsi.mthreadtypemgr):name("clsthreadtypemgr")


clsthreadtypemgr.instance = nil


clsthreadtypemgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsthreadtypemgr.instance == nil then
		gm_chayegongsi.clsthreadtypemgr.instance = gm_chayegongsi.clsthreadtypemgr(pagecount)
		gm_chayegongsi.clsthreadtypemgr.instance:init_table()
	end
	return gm_chayegongsi.clsthreadtypemgr.instance
end





clsthreadtypemgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mthreadtypemgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsthreadtypemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	