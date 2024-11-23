
			
gr_module("gm_ruanjianwaibaojiaoyisuo")

advmulbigArea = inherit(GmBase.advmulBigArea):name("advmulbigArea")

advmulbigArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "advmulbigArea"
	GmBase.advmulBigArea.init(self,parent,fid )


end

advmulbigArea.on_select = function(self,data)
	self.hostWindow:exec_action(self ,'switch', data)
end

	