		
gr_module("GmUINode")

root_node = inherit(GmBase.Node):name("root_node")

root_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"root")	
												
	self.ribber = GmUI.ribber_ctrl(self)

	self.menubar = GmUI.menubar_ctrl(self)

	self.contents = GmUI.contents_ctrl(self)

	self.dockmask = GmUI.dockmask_ctrl(self)

	self.titlebar = self:get_child('titlebar')

	self.sysbutton  = GmBase.SysButton(self.hostWindow,true,true,true)

end