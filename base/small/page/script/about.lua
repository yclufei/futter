-- 关于
gr_module("GmBase")

aboutFrame = inherit(GmBase.FrameBase):name("aboutFrame")

aboutFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_aboutFrame")


	self.subnav = GmBase.subnavArea(self,nil,"关于我们")
	self.subnav:set_left('NavTDWidth navbackbtn centerbg',function() top.hostWindow:delTopNavFrame() end)


 
end

  
