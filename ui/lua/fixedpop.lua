		
gr_module("GmUI")

fixedpop_ctrl = inherit(GmUINode.fixedpop_node):name("fixedpop_ctrl")

fixedpop_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.fixedpop_node.init(self,parent)	
				
	self.on_pop_window_move = self.hostWindow.showDockParent
		
	self:set_mousemove(function(self,x,y)
		print('fixedpop_ctrl mousemove',x,y)	
	end)
				
end