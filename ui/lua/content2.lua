		
gr_module("GmUI")

content2_ctrl = inherit(GmUINode.content2_node):name("content2_ctrl")

content2_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content2_node.init(self,parent)	
				
	self.dock1.on_pop_window_move = self.hostWindow.showDockParent	
	self.dock2.on_pop_window_move = self.hostWindow.showDockParent
	self.dock3.on_pop_window_move = self.hostWindow.showDockParent	
	self.dock4.on_pop_window_move = self.hostWindow.showDockParent
	
	
	self.dock1.DockPanel:set_child_panel(self.panel_object_mgr.sztitle,self.panel_object_mgr)
	self.dock2.DockPanel:set_child_panel(self.panel_object_list.sztitle,self.panel_object_list)
	self.dock3.DockPanel:set_child_panel(self.panel_template_mgr.sztitle,self.panel_template_mgr)
	self.dock4.DockPanel:set_child_panel(self.panel_template_list.sztitle,self.panel_template_list)

	
end