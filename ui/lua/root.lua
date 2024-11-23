		
gr_module("GmUI")

root_ctrl = inherit(GmUINode.root_node):name("root_ctrl")

root_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.root_node.init(self,parent)	
	
	self.titlebar:set_drag_window(true)
	self.titlebar:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
	
	self.menubar:set_drag_window(true)
	self.menubar:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
												
end