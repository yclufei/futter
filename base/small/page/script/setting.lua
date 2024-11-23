

-- 设置面板
gr_module("GmBase")
settingFrame = inherit(GmBase.FrameBase):name("settingFrame")
settingFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_settingFrame")



	self.subnav = GmBase.subnavArea(self,nil,"设置面板")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)

 
   	
	-- settingcontent	 
	
	
   
	self:addJumpLink("feedbackFrame")

   
	self:addJumpLink("otherappFrame")

   
	self:addJumpLink("updateFrame")

   
	self:addJumpLink("protocalFrame")

   
	self:addJumpLink("aboutFrame")

  
 
  
 
end

  
