
					
-- default searchnav
					
gr_module("gm_minjieyingshi")

searchnavArea = inherit(GmCtrl.ControlBase):name("searchnavArea")

searchnavArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "searchnavArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
end
