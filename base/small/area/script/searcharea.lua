
gr_module("GmBase")

searchArea = inherit(GmCtrl.ControlBase):name("searchArea")

searchArea.init = function(self,parent,fname,ptitle)

	local top = self

	local fid = fname or "searchArea"
	GmCtrl.ControlBase.init(self,parent,fid)
	
end


