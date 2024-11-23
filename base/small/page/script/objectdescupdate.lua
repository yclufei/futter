
-- Ìû×ÓÁÐ±í
gr_module("GmBase")

objectdescupdateFrame = inherit(GmBase.FrameBase):name("objectdescupdateFrame")

objectdescupdateFrame.init = function (self,hostWindow,frameid,mainmenu)
	local top = self
	local win = hostWindow
	local fid = frameid or "templete_objectdescupdateFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)
end
