		
gr_module("GmUI")

panel_object_mgr_ctrl = inherit(GmUINode.panel_object_mgr_node):name("panel_object_mgr_ctrl")

panel_object_mgr_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.panel_object_mgr_node.init(self,parent)	
												
end