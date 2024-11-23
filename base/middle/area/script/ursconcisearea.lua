
gr_module("GmBase")

ursconciseArea = inherit(GmCtrl.ControlBase):name("ursconciseArea")

ursconciseArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"ursconcisearea")
	
	self:set_visible(false)
end