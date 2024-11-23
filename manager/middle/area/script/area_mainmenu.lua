 	

gr_module("GmManager")

mainmenuFrame = inherit(GmBase.FrameBase):name("mainmenuFrame")

mainmenuFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"mainmenu") 	
	self:addShowLink("firstFrame",function(fframe) 
		fframe:set_data(0)
	end) 
	self:addShowLink("configFrame")
	self:set_visible(true)
end

  
