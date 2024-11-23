		
gr_module("GmUINode")

tm1_node = inherit(GmBase.Node):name("tm1_node")

tm1_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"tm1")	
												
	self.mm0 = self:get_child('mm0')

	self.mm3 = self:get_child('mm3')

	self.mm1 = self:get_child('mm1')

	self.mm2 = self:get_child('mm2')

	self.mm0.lnk = self.mm0:get_child('lnk')

	self.mm3.lnk = self.mm3:get_child('lnk')

	self.mm1.lnk = self.mm1:get_child('lnk')

	self.mm2.lnk = self.mm2:get_child('lnk')

end