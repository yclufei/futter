

-- 忘记密码
gr_module("GmBase")

forgetpwdFrame = inherit(GmBase.FrameBase):name("forgetpwdFrame")

forgetpwdFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_forgetPwdFrame")


	self.subnav = GmBase.subnavArea(self,nil,"忘记密码")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)

	
	
  
	self.submitbt = self:get_child("submitbt")
	self.submitbt:set_click( 	function(button) 
															--g_xmpp:user_register("lufei","5465s4","sfa@sf.com","dlfgli")		
															g_xmpp:sendmsg("admin@192.168.1.103","123456")
														end)
  
 
end

  
