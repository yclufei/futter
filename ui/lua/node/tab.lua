		
gr_module("GmUINode")

tab_node = inherit(GmBase.Node):name("tab_node")

tab_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tab")	
												
end