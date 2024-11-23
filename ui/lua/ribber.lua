		
gr_module("GmUI")

ribber_ctrl = inherit(GmUINode.ribber_node):name("ribber_ctrl")

ribber_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.ribber_node.init(self,parent)
	
	self.panel = {}
	self.panel[0] = self.tm0
	self.panel[1] = self.tm1
	self.panel[2] = self.tm2
	self.panel[3] = self.tm3
	self.panel[4] = self.tm4
	
	self.lastpanel = self.panel[0]
	
	self:show_ribber(1)
	
												
end


ribber_ctrl.show_ribber = function(self,idx)
	self.lastpanel:set_visible(false)
	self.panel[idx]:set_visible(true)
	self.lastpanel = self.panel[idx]
end
