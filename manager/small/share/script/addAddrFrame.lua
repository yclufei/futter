
gr_module("GmManager")

addAddrFrame = inherit(GmBase.FrameBase):name("addAddrFrame")

addAddrFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "addAddrFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)

	self:init_back_button()
	

	self.scrollcontainer = self:get_child("scrollcontent")
	self.scrollcontainer:set_style("margin-top:-100px;")
end

