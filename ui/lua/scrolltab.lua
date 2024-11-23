		
gr_module("GmUI")

scrolltab_ctrl = inherit(GmUINode.scrolltab_node):name("scrolltab_ctrl")

scrolltab_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.scrolltab_node.init(self,parent)	
												
end