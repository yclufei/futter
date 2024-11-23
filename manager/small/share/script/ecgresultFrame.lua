
-- 发表帖子
gr_module("GmManager")

ecgresultFrame = inherit(GmBase.FrameBase):name("ecgresultFrame")

ecgresultFrame.init = function (self,hostWindow,freamename,hasmainmenu)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_ecgresultFrame")

  
end
  
