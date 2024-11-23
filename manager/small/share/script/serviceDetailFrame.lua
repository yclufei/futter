
gr_module("GmManager")

serviceDetailFrame = inherit(GmBase.FrameBase):name("serviceDetailFrame")

serviceDetailFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "serviceDetailFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)

	self.scrollcontainer = self:get_child("slistscrolllist")
	
end

