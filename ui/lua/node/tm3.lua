		
gr_module("GmUINode")

tm3_node = inherit(GmBase.Node):name("tm3_node")

tm3_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tm3")	
												
	self.mm1 = self:get_child('mm1')

	self.mm0 = self:get_child('mm0')

	self.mm0.lnk = self.mm0:get_child('lnk')

	self.mm1.lnk = self.mm1:get_child('lnk')

end