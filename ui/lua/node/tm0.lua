		
gr_module("GmUINode")

tm0_node = inherit(GmBase.Node):name("tm0_node")

tm0_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tm0")	
												
end