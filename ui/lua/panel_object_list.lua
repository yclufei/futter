		
gr_module("GmUI")

panel_object_list_ctrl = inherit(GmUINode.panel_object_list_node):name("panel_object_list_ctrl")

panel_object_list_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.panel_object_list_node.init(self,parent)	
												
end