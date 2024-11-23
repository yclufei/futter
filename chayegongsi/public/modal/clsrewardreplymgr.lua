
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_chayegongsi")


clsrewardreplymgr = inherit(gm_chayegongsi.mrewardreplymgr):name("clsrewardreplymgr")


clsrewardreplymgr.instance = nil


clsrewardreplymgr.get_instance = function(pagecount)
	if gm_chayegongsi.clsrewardreplymgr.instance == nil then
		gm_chayegongsi.clsrewardreplymgr.instance = gm_chayegongsi.clsrewardreplymgr(pagecount)
		gm_chayegongsi.clsrewardreplymgr.instance:init_table()
	end
	return gm_chayegongsi.clsrewardreplymgr.instance
end





clsrewardreplymgr.init = function (self,pagecount)

	local top = self
	
	
	gm_chayegongsi.mrewardreplymgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsrewardreplymgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end

	

	