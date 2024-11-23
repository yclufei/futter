		
gr_module("GmUI")

content0_ctrl = inherit(GmUINode.content0_node):name("content0_ctrl")

content0_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content0_node.init(self,parent)	
												
end