		
gr_module("GmUI")

tm2_ctrl = inherit(GmUINode.tm2_node):name("tm2_ctrl")

tm2_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tm2_node.init(self,parent)	
												
end