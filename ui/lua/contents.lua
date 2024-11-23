		
gr_module("GmUI")

contents_ctrl = inherit(GmUINode.contents_node):name("contents_ctrl")

contents_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.contents_node.init(self,parent)	
					
	self.panel = {}
	self.panel[0] = self.content0
	self.panel[1] = self.content1
	self.panel[2] = self.content2
	self.panel[3] = self.content3
	self.panel[4] = self.content4
	
	self.lastpanel = self.panel[2]
	
								
end


contents_ctrl.show_content = function(self,idx)
	self.lastpanel:set_visible(false)
	self.panel[idx]:set_visible(true)
	self.lastpanel = self.panel[idx]
end

