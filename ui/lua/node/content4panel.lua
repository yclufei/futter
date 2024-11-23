		
gr_module("GmUINode")

content4panel_node = inherit(GmBase.Node):name("content4panel_node")

content4panel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content4panel")	
	
									
end