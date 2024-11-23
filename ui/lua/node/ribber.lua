		
gr_module("GmUINode")

ribber_node = inherit(GmBase.Node):name("ribber_node")

ribber_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"ribber")	
												
	self.tm2 = GmUI.tm2_ctrl(self)

	self.tm0 = GmUI.tm0_ctrl(self)

	self.tm1 = GmUI.tm1_ctrl(self)

	self.tm3 = GmUI.tm3_ctrl(self)

	self.tm4 = GmUI.tm4_ctrl(self)

end