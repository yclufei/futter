
-- 发表帖子
gr_module("GmManager")

startFrame = inherit(GmBase.FrameBase):name("startFrame")

startFrame.init = function (self,hostWindow,freamename,hasmainmenu)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_startFrame")

	self.subnav = GmBase.subnavArea(self,nil,"美安艾心")
  
end
  
