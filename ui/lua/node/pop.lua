		
gr_module("GmUINode")

pop_node = inherit(GmBase.Node):name("pop_node")

pop_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"pop")	
												
end