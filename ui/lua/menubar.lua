		
gr_module("GmUI")

menubar_ctrl = inherit(GmUINode.menubar_node):name("menubar_ctrl")

menubar_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.menubar_node.init(self,parent)	
	
	self.selectmm = function(link)	
		print("selectmm")
		if top.lastpanel ~= nil then
			top.lastpanel:set_class("divcenter mainMenuItem fa "..top.lastpanel.ico)
		end
		link:set_class("divcenter mainMenuItemSelected fa "..link.ico)
		top.hostWindow:on_main_menu(link.idx)
		top.lastpanel = link
	end
	
					
	self.panel = {}
	self.panel[0] = self.mm1
	self.panel[1] = self.mm2
	self.panel[2] = self.mm3
	self.panel[3] = self.mm4
	self.panel[4] = self.mm5
	
	
	self.panel[0].ico = 'fa1'
	self.panel[0].idx = 0	
	self.panel[0]:set_click(function(lnk) 
		print('==================================================')
		top.hostWindow:on_main_menu(0)
	end)
	
	self.panel[1].ico = 'fa2'
	self.panel[1].idx = 2
	self.panel[1]:set_click(self.selectmm)
	self.panel[1].lnk:set_click(function(lnk) 
		top.selectmm(lnk.parent) 
	end)
	
	self.panel[2].ico = 'fa3'
	self.panel[2].idx = 1
	self.panel[2]:set_click(self.selectmm)
	self.panel[2].lnk:set_click(function(lnk) 
		top.selectmm(lnk.parent) 
	end)
	
	self.panel[3].ico = 'fa4'
	self.panel[3].idx = 3
	self.panel[3]:set_click(self.selectmm)
	self.panel[3].lnk:set_click(function(lnk) 
		top.selectmm(lnk.parent) 
	end)
	
	self.panel[4].ico = 'fa5'
	self.panel[4].idx = 4
	self.panel[4]:set_click(self.selectmm)
	self.panel[4].lnk:set_click(function(lnk) 
		top.selectmm(lnk.parent) 
	end)
	
	
	
	self.lastpanel = self.panel[2]
								
end

