		
gr_module("GmUINode")

panel_object_mgr_node = inherit(GmBase.Node):name("panel_object_mgr_node")

panel_object_mgr_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"panel_object_mgr")	
												
end