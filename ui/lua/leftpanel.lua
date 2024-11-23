		
gr_module("GmUI")

leftpanel_ctrl = inherit(GmUINode.leftpanel_node):name("leftpanel_ctrl")

leftpanel_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.leftpanel_node.init(self,parent)	
	
	self.ispop = false
						
							
end


leftpanel_ctrl.on_item_select = function(self,idx)
	print('leftpanel_ctrl.on_item_select',idx)

end


leftpanel_ctrl.add_item = function(self,txt)
	self.leftpoppanel.tabuttons:add_item(txt)
	self.lefttabpanel.tabbuttonparent.tabuttons:add_item(txt)
end


leftpanel_ctrl.show_pop = function(self,bl)
	self.ispop = bl
	if not bl then
		self.leftpoppanel:set_visible(false)
		self.lefttabpanel:set_visible(true)
	else
		self.leftpoppanel:set_visible(true)
		self.leftpoppanel:on_sized()
		self.lefttabpanel:set_visible(false)
	end
end
