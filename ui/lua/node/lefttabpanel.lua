		
gr_module("GmUINode")

lefttabpanel_node = inherit(GmBase.Node):name("lefttabpanel_node")

lefttabpanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"lefttabpanel")	
												
	self.fixedpop = GmUI.fixedpop_ctrl(self)

	self.tabbuttonparent = GmUI.tabbuttonparent_ctrl(self)

end