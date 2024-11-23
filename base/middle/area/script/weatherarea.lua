
gr_module("GmBase")

weatherArea = inherit(GmCtrl.ControlBase):name("weatherArea")

weatherArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"weatherarea")
	
	self:set_visible(false)
	
end