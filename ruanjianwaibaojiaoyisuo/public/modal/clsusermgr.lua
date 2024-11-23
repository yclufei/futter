
		

-- D:\GOA\reslibrary\templete\res\modal\clsmodalmgr.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")


clsusermgr = inherit(gm_ruanjianwaibaojiaoyisuo.musermgr):name("clsusermgr")


clsusermgr.instance = nil


clsusermgr.get_instance = function(pagecount)
	if gm_ruanjianwaibaojiaoyisuo.clsusermgr.instance == nil then
		gm_ruanjianwaibaojiaoyisuo.clsusermgr.instance = gm_ruanjianwaibaojiaoyisuo.clsusermgr(pagecount)
		gm_ruanjianwaibaojiaoyisuo.clsusermgr.instance:init_table()
	end
	return gm_ruanjianwaibaojiaoyisuo.clsusermgr.instance
end





clsusermgr.init = function (self,pagecount)

	local top = self
	
	
	gm_ruanjianwaibaojiaoyisuo.musermgr.init(self,pagecount)
	
	self.uis = {}
	
end 


clsusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end


-- 需要删除
clsusermgr.has_session1 = function(self,key)
	return true
end
	