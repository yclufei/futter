		
gr_module("GmUINode")

fixedpop_node = inherit(GmBase.Node):name("fixedpop_node")

fixedpop_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"fixedpop")	
												
end