
gr_module("GmBase")

ursconciseArea = inherit(GmCtrl.ControlBase):name("ursconciseArea")

ursconciseArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"ursconcisearea")
	

	self:set_click(function(self)
		top.hostWindow:addNavFrame("urscenterFrame")
	end)
	
	
end