
gr_module("GmBase")

PopInputFrame = inherit(GmCtrl.ControlBase):name("PopInputFrame")

PopInputFrame.init = function (self,parent)

	local top = self
	local win = parent.hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_inputFrame")
	
	
	self:set_visible(false)
	
end
  

  
