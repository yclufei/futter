		
gr_module("GmUI")

tm4_ctrl = inherit(GmUINode.tm4_node):name("tm4_ctrl")

tm4_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tm4_node.init(self,parent)	
												
end