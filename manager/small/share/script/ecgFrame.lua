
-- 发表帖子
gr_module("GmManager")

ecgFrame = inherit(GmBase.FrameBase):name("ecgFrame")

ecgFrame.init = function (self,hostWindow,freamename,hasmainmenu)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_ecgFrame")


  
end
  
