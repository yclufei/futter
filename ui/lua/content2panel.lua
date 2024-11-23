		
gr_module("GmUI")

content2panel_ctrl = inherit(GmUINode.content2panel_node):name("content2panel_ctrl")

content2panel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content2panel_node.init(self,parent)	
						
	self.dock1.on_pop_window_move = self.hostWindow.showDockParent
	self.dock2.on_pop_window_move = self.hostWindow.showDockParent						
end