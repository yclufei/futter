		
gr_module("GmUINode")

righttabmenu_node = inherit(GmBase.Node):name("righttabmenu_node")

righttabmenu_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"righttabmenu")	
												
	self.tab = self:get_child('tab')

end