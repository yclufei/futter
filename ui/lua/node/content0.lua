		
gr_module("GmUINode")

content0_node = inherit(GmBase.Node):name("content0_node")

content0_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content0")	
												
	self.content0panel = GmUI.content0panel_ctrl(self)

end