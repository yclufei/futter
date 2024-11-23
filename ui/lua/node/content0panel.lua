		
gr_module("GmUINode")

content0panel_node = inherit(GmBase.Node):name("content0panel_node")

content0panel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content0panel")	
												
end