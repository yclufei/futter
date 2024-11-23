		
gr_module("GmUI")

dockmask_ctrl = inherit(GmUINode.dockmask_node):name("dockmask_ctrl")

dockmask_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.dockmask_node.init(self,parent)	
				
	self.showAra = function(panel,pop,node,stop)
		local popanel = top.hostWindow:on_dockmask(panel,pop,node,stop,panel.pos)
		if popanel then
			popanel:on_pop_window_move(pop,node,stop)
		end
	end
								
	self.dockmask_top_top.pos = 'top'
	self.dockmask_top_top.on_pop_window_move = self.showAra	

	self.dockmask_top_left.pos = 'left'
	self.dockmask_top_left.on_pop_window_move = self.showAra	

	self.dockmask_top_right.pos = 'right'
	self.dockmask_top_right.on_pop_window_move = self.showAra	

	self.dockmask_top_bottom.pos = 'bottom'
	self.dockmask_top_bottom.on_pop_window_move = self.showAra	
							
end