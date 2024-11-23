		
gr_module("GmUINode")

content1panel_node = inherit(GmBase.Node):name("content1panel_node")

content1panel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content1panel")	
	

end