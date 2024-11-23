-- pc客户端的三个系统按钮
gr_module("GmBase")

SysButton = inherit():name("SysButton")


SysButton.init = function(self,hostWindow,min,max,close)

	self.min = hostWindow:get_child("bt_sys_min")
	if min then
		self.min:set_click(function() hostWindow:on_sys_button("min") end)
	else
		self.min:set_visible(false)
	end
	
	self.max = hostWindow:get_child("bt_sys_max")
	if max then		
		self.max:set_click(function() hostWindow:on_sys_button("max") end)
	else
		self.max:set_visible(false)
	end
	
	self.close = hostWindow:get_child("bt_sys_close")
	if close then
		self.close:set_click(function() hostWindow:on_sys_button("close") end)
	else
		self.close:set_visible(false)
	end
	
end

