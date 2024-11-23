		
gr_module("GmUI")

contentpanel_ctrl = inherit(GmUINode.contentpanel_node):name("contentpanel_ctrl")

contentpanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.contentpanel_node.init(self,parent)	
						
	self.dock1.on_pop_window_move = self.hostWindow.showDockParent
	self.dock2.on_pop_window_move = self.hostWindow.showDockParent
		
end


contentpanel_ctrl.set_child_panel = function(self,isleft,txt,panel)
	if isleft then
		self.dock1.DockPanel:set_child_panel(txt,panel)	
	else
		self.dock2.DockPanel:set_child_panel(txt,panel)
	end
end

contentpanel_ctrl.add_item = function(self,txt)
	self.tabuttons:add_item(txt)
end
