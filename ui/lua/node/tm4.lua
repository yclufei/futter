		
gr_module("GmUINode")

tm4_node = inherit(GmBase.Node):name("tm4_node")

tm4_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tm4")	
												
	self.mm1 = self:get_child('mm1')

	self.mm0 = self:get_child('mm0')

	self.mm0.lnk = self.mm0:get_child('lnk')

	self.mm1.lnk = self.mm1:get_child('lnk')

end