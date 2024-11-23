		
gr_module("GmUINode")

leftpoppanel_node = inherit(GmBase.Node):name("leftpoppanel_node")

leftpoppanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"leftpoppanel")	
												
	self.pop = GmUI.pop_ctrl(self)

	self.tabuttons = GmCtrl.MenuBase(self,'scrolltab','tab','tabmenu_1',20)
	
end
