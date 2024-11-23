		
gr_module("GmUI")

tabpanel_ctrl = inherit(GmUINode.tabpanel_node):name("tabpanel_ctrl")

tabpanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tabpanel_node.init(self,parent)	
												
end