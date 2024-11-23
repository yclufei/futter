		
gr_module("GmUINode")

dockmask_node = inherit(GmBase.Node):name("dockmask_node")

dockmask_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"dockmask")	
												
	self.dockmask_top_top = self:get_child('dockmask_top_top')

	self.dockmask_top_left = self:get_child('dockmask_top_left')

	self.dockmask_top_right = self:get_child('dockmask_top_right')

	self.dockmask_top_bottom = self:get_child('dockmask_top_bottom')

end