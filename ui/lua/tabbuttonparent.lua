		
gr_module("GmUI")

tabbuttonparent_ctrl = inherit(GmUINode.tabbuttonparent_node):name("tabbuttonparent_ctrl")

tabbuttonparent_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.tabbuttonparent_node.init(self,parent)	
												
end