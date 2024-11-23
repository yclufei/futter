		
gr_module("GmUINode")

leftpanel_node = inherit(GmBase.Node):name("leftpanel_node")

leftpanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"leftpanel")	
												
	self.leftpoppanel = GmUI.leftpoppanel_ctrl(self)

	self.lefttabpanel = GmUI.lefttabpanel_ctrl(self)

end