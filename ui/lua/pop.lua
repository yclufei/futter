		
gr_module("GmUI")

pop_ctrl = inherit(GmUINode.pop_node):name("pop_ctrl")

pop_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.pop_node.init(self,parent)	
	
	self.on_pop_window_move = self.hostWindow.showDockParent	
	
	self.height = 100
	
	self.visible = false
						
end

pop_ctrl.set_height = function(self,h)
	self.height = h
	if self.visible then
		self:set_visible(true)
	end
end

pop_ctrl.set_visible = function(self,bl,update)
	self.visible = bl
	if bl then
		local style = string.format('height:%dpx;display:block;',self.height)
		print('pop_ctrl.set_visible',style)
		self:set_style(style)
	else
		GmUINode.pop_node.set_visible(self,bl,update)
	end
end