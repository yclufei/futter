		
gr_module("GmUI")

content1_ctrl = inherit(GmUINode.content1_node):name("content1_ctrl")

content1_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.content1_node.init(self,parent)
	
					
					

end

