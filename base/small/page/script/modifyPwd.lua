
gr_module("GmBase")

modifyPwdFrame = inherit(GmBase.FrameBase):name("modifyPwdFrame")

modifyPwdFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "templete_modifyPwdFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)

	self.subnav = GmBase.subnavArea(self,nil,"ÐÞ¸ÄÃÜÂë")
	self.subnav:set_left("NavTDWidth backNavTD")
	
	
	self.scrollcontainer = self:get_child("scrollcontent")
	self.scrollcontainer:set_style("margin-top:-100px;")
end

