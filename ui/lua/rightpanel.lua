		
gr_module("GmUI")

rightpanel_ctrl = inherit(GmUINode.rightpanel_node):name("rightpanel_ctrl")

rightpanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.rightpanel_node.init(self,parent)	
												
end


rightpanel_ctrl.show_pop = function(self,bl)
	if not bl then
	
	else
	
	end
end
