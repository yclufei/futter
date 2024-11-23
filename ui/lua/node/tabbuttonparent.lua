		
gr_module("GmUINode")

tabbuttonparent_node = inherit(GmBase.Node):name("tabbuttonparent_node")

tabbuttonparent_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tabbuttonparent")	
												
	self.tabuttons = GmCtrl.MenuBase(self,'tab','tab','tabmenu_2',20,true)

end