		
gr_module("GmUINode")

scrolltab_node = inherit(GmBase.Node):name("scrolltab_node")

scrolltab_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"scrolltab")	
												
end