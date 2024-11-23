		
gr_module("GmUI")

tm0_ctrl = inherit(GmUINode.tm0_node):name("tm0_ctrl")

tm0_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tm0_node.init(self,parent)	
												
end