		
gr_module("GmUINode")

panel_template_list_node = inherit(GmBase.Node):name("panel_template_list_node")

panel_template_list_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"panel_template_list")	
												
end