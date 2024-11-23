		
gr_module("GmUI")

tm3_ctrl = inherit(GmUINode.tm3_node):name("tm3_ctrl")

tm3_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tm3_node.init(self,parent)	
												
end