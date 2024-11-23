		
gr_module("GmUI")

content0panel_ctrl = inherit(GmUINode.content0panel_node):name("content0panel_ctrl")

content0panel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content0panel_node.init(self,parent)	
	
		
end