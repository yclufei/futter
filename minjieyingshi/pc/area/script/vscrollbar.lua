
					
					
gr_module("gm_minjieyingshi")

vscrollbarArea = inherit(GmBase.vscrollbarArea):name("vscrollbarArea")

vscrollbarArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "vscrollbarArea"
	GmBase.vscrollbarArea.init(self,parent,fid )

	self.itemcount = 20
	
end

	
	