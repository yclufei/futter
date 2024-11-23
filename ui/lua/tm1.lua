		
gr_module("GmUI")

tm1_ctrl = inherit(GmUINode.tm1_node):name("tm1_ctrl")

tm1_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tm1_node.init(self,parent)	
												
end