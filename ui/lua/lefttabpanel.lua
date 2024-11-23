		
gr_module("GmUI")

lefttabpanel_ctrl = inherit(GmUINode.lefttabpanel_node):name("lefttabpanel_ctrl")

lefttabpanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.lefttabpanel_node.init(self,parent)	
												
end