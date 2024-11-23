		
gr_module("GmUINode")

content2panel_node = inherit(GmBase.Node):name("content2panel_node")

content2panel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content2panel")	
	
									
end