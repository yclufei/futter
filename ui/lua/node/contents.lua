		
gr_module("GmUINode")

contents_node = inherit(GmBase.Node):name("contents_node")

contents_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"contents")	
												
	self.content0 = GmUI.content0_ctrl(self)

	self.content1 = GmUI.content1_ctrl(self)

	self.content2 = GmUI.content2_ctrl(self)

	self.content3 = GmUI.content3_ctrl(self)

	self.content4 = GmUI.content4_ctrl(self)

end