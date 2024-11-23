		
gr_module("GmUI")

content4panel_ctrl = inherit(GmUINode.content4panel_node):name("content4panel_ctrl")

content4panel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content4panel_node.init(self,parent)	
						
	self.dock1.on_pop_window_move = self.hostWindow.showDockParent
	self.dock2.on_pop_window_move = self.hostWindow.showDockParent						
end