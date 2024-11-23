

-- APP大全
gr_module("GmBase")

otherappFrame = inherit(GmBase.FrameBase):name("otherappFrame")

otherappFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_otherappFrame")

	self:init_back_button()

	-- otherappcontent	 

end

  
