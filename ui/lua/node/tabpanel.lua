		
gr_module("GmUINode")

tabpanel_node = inherit(GmBase.Node):name("tabpanel_node")

tabpanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tabpanel")	
												
	self.up = self:get_child('up')

	self.tabbuttonparent = GmUI.tabbuttonparent_ctrl(self)

end