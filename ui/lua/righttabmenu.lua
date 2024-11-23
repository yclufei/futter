		
gr_module("GmUI")

righttabmenu_ctrl = inherit(GmUINode.righttabmenu_node):name("righttabmenu_ctrl")

righttabmenu_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.righttabmenu_node.init(self,parent)	
												
end