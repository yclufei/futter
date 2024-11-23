		
gr_module("GmUI")

tab_ctrl = inherit(GmUINode.tab_node):name("tab_ctrl")

tab_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tab_node.init(self,parent)	
												
end