		
gr_module("GmUI")

panel_template_mgr_ctrl = inherit(GmUINode.panel_template_mgr_node):name("panel_template_mgr_ctrl")

panel_template_mgr_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.panel_template_mgr_node.init(self,parent)	
												
end