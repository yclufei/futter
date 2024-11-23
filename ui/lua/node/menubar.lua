		
gr_module("GmUINode")

menubar_node = inherit(GmBase.Node):name("menubar_node")

menubar_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"menubar")	
												
	self.mm3 = self:get_child('mm3')

	self.mm1 = self:get_child('mm1')

	self.mm2 = self:get_child('mm2')

	self.mm5 = self:get_child('mm5')

	self.mm4 = self:get_child('mm4')
	

	self.mm1.lnk = self.mm1:get_child('lnk')

	self.mm3.lnk = self.mm3:get_child('lnk')

	self.mm2.lnk = self.mm2:get_child('lnk')

	self.mm5.lnk = self.mm5:get_child('lnk')

	self.mm4.lnk = self.mm4:get_child('lnk')

end