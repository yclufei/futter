		
gr_module("GmUI")

content1panel_ctrl = inherit(GmUINode.content1panel_node):name("content1panel_ctrl")

content1panel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content1panel_node.init(self,parent)	
	
							
end


