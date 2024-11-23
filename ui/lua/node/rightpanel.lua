		
gr_module("GmUINode")

rightpanel_node = inherit(GmBase.Node):name("rightpanel_node")

rightpanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"rightpanel")	
												
	self.tab = GmUI.tab_ctrl(self)

	self.righttabmenu = GmUI.righttabmenu_ctrl(self)

end