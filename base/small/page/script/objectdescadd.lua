
-- Ìû×ÓÁÐ±í
gr_module("GmBase")

objectdescaddFrame = inherit(GmBase.FrameBase):name("objectdescaddFrame")

objectdescaddFrame.init = function (self,hostWindow,frameid,mainmenu)
	local top = self
	local win = hostWindow
	local fid = frameid or "templete_objectdescaddFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)
end
