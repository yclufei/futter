
			
gr_module("gm_minjieyingshi")

advmulbigArea = inherit(GmBase.advmulBigArea):name("advmulbigArea")

advmulbigArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "advmulbigArea"
	GmBase.advmulBigArea.init(self,parent,fid )


end

	