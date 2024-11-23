		
gr_module("GmUI")

panel_template_list_ctrl = inherit(GmUINode.panel_template_list_node):name("panel_template_list_ctrl")

panel_template_list_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.panel_template_list_node.init(self,parent)	
												
end