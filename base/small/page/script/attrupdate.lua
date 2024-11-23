

gr_module("GmBase")

attrupdateFrame = inherit(GmBase.FrameBase):name("attrupdateFrame")

attrupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_attrupdateFrame")

	self:init_back_button()

	-- otherappcontent	 

end

  
