

-- 版本更新
gr_module("GmBase")
updateFrame = inherit(GmBase.FrameBase):name("updateFrame")
updateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_updateFrame")


	self.subnav = GmBase.subnavArea(self,nil,"版本更新")
	self.subnav:set_left('NavTDWidth navbackbtn centerbg',function() top.hostWindow:delTopNavFrame() end)
  
 
end

  
