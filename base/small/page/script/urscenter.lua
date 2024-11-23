

-- 用户中心
gr_module("GmBase")

urscenterFrame = inherit(GmBase.FrameBase):name("urscenterFrame")

urscenterFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_urscenterFrame")
	

	self.subnav = GmBase.subnavArea(self,nil,"用户中心")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)
	
   
	self:addJumpLink("ursinfoFrame")
	--self:addJumpLink("settingFrame")

	--self.subareas["initmainmenu"] = self:get_child("subareamainmenu")

end

  
