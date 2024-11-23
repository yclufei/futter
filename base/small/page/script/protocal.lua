

-- 用户协议
gr_module("GmBase")
protocalFrame = inherit(GmBase.FrameBase):name("protocalFrame")
protocalFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_protocalFrame")

	self:init_back_button()

  
 
   	
	-- protocalcontent	
	self.scrollcontainer = self:get_child("scrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
 
  
 
end

  
