

-- 用户资料
gr_module("GmBase")
ursinfoFrame = inherit(GmBase.FrameBase):name("ursinfoFrame")
ursinfoFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_ursinfoFrame")


	self.subnav = GmBase.subnavArea(self,nil,"用户资料")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)

	
	
   
	self:addJumpLink("loginFrame")
	self:addJumpLink("registerFrame")
	self:addJumpLink("modifyPwdFrame")

  
 
  
 
end

  
