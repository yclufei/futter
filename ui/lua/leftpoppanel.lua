		
gr_module("GmUI")

leftpoppanel_ctrl = inherit(GmUINode.leftpoppanel_node):name("leftpoppanel_ctrl")

leftpoppanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.leftpoppanel_node.init(self,parent)
	
	
	self.hostWindow:add_size_node(self)
	
	self.pop.on_node_focus_change = function(pop,bl)
		if bl then
			pop:set_visible(false,false)
		end
	end
	
end



leftpoppanel_ctrl.set_visible = function(self,bl)
	GmUINode.leftpoppanel_node.set_visible(self,bl)
	if bl then
		self:on_sized()
		self.hostWindow:set_focus_change_notify_node(self.pop[0])
	end
end


leftpoppanel_ctrl.on_sized = function(self,w,h)	
	local x1,y1,w1,h1 , x2,y2,w2,h2 , x3,y3,w3,h3 = self.parent:get_size()
	print('leftpoppanel_ctrl.on_sized',h1)
	self.pop:set_height(h1)
end


leftpoppanel_ctrl.on_item_select = function(self,idx)
	self:on_sized(100,100)
	self.parent:on_item_select(idx)
	self.pop:set_visible(true,false)
	self.hostWindow:set_focus_change_notify_node(self.pop[0])
end
