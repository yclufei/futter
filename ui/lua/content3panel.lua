		
gr_module("GmUI")

content3panel_ctrl = inherit(GmUINode.content3panel_node):name("content3panel_ctrl")

content3panel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content3panel_node.init(self,parent)	
						
	self.dock1.on_pop_window_move = self.hostWindow.showDockParent
	self.dock2.on_pop_window_move = self.hostWindow.showDockParent						
end