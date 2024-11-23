		
gr_module("GmUINode")

contentpanel_node = inherit(GmBase.Node):name("contentpanel_node")

contentpanel_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"contentpanel")	
	
	self.tabuttons = GmCtrl.MenuBase(self,'tab','tab','tabmenu_2',20,true)
					
				
	self.dock2 = self:get_child('dock2')

	self.dock1 = self:get_child('dock1')

	self.dock1.DockPanel  = GmUI.DockPanel(self.dock1,nil,'模板列表')

	self.dock2.DockPanel  = GmUI.DockPanel(self.dock2,nil,'对象列表')

	
end