		
gr_module("GmUINode")

panel_object_list_node = inherit(GmBase.Node):name("panel_object_list_node")

panel_object_list_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"panel_object_list")	
												
end