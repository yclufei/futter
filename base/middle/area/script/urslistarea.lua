gr_module("GmBase")

urslistArea = inherit(GmCtrl.ControlBase):name("urslistArea")

urslistArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"urslistarea")
	
	self:set_visible(false)
	
end