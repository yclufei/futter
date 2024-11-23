
gr_module("GmUI")

uiWindow = inherit(GmBase.Window):name("uiWindow")

uiWindow.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"ui/main.html")
	
	

	
	self.ui_templates = {}
	
	self.ui_templates['left'] = self.frametempleteContainer:get_child('leftpanel')
	self.ui_templates['right'] = self.frametempleteContainer:get_child('rightpanel')
	self.ui_templates['content'] = self.frametempleteContainer:get_child('contentpanel')
	self.ui_templates['hframe'] = self.frametempleteContainer:get_child('contentframe_h')
	self.ui_templates['vframe'] = self.frametempleteContainer:get_child('contentframe_v')
	
	self.sizenode = {}
	
	self.showDockParent = function(panel,pop,node,stop)
		--print('showNodeArea',pop,node,stop)
		if stop then
			pop.mainnode.dockparent = panel
			top:set_main_node(pop.mainnode)
			panel:set_css_item(g_css_ids.BackgroundColor,'#666666')
			top:updatetick()
		else
		--	panel:set_style('background-color:#f3d5d5;')
			panel:set_css_item(g_css_ids.BackgroundColor,'#f3d5d5')
			top:updatetick()
			panel:set_css_item(g_css_ids.BackgroundColor,'#666666')
		end
	end
												
	self.ribber = GmUI.ribber_ctrl(self)

	self.menubar = GmUI.menubar_ctrl(self)

	self.contents = GmUI.contents_ctrl(self)

	self.dockmask = GmUI.dockmask_ctrl(self)

	self.titlebar = self:get_child('titlebar')

	self.sysbutton  = GmBase.SysButton(self.hostWindow,true,true,true)
	
		
	self.titlebar:set_drag_window(true)
	self.titlebar:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
	
	self.menubar:set_drag_window(true)
	self.menubar:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
	
					
	self.dockmask:set_visible(false)
	
	self:set_window_title('窗口标题')

	self:set_size(w,h)
	
	self:centerWindow2(w * 4 / 5,h * 4 / 5)
	
	self:set_visible(true)
	
	self:on_main_menu(2)
	
end


uiWindow.on_dockmask = function(self,panel,pop,node,stop,pos)
		if self.contents.lastpanel and self.contents.lastpanel.add_dock_panel then
			return self.contents.lastpanel:add_dock_panel(panel,pop,node,stop,pos)
		end
end


uiWindow.create_template = function(self,tplkey)
	if self.ui_templates[tplkey] ~= nil then
		return self.ui_templates[tplkey]:copy()
	end
	return nil
end


uiWindow.add_size_node = function(self,node)
	table.insert(self.sizenode,node)
end

uiWindow.on_sized = function(self,w,h)
	print('uiWindow.on_sized',w,h)
	self:show_dockmask(nil,false)
	for a,b in pairs(self.sizenode) do
		if b.on_sized then
			b:on_sized(w,h)
		end
	end
end

uiWindow.show_dockmask = function(self,panel,bl)
	if bl then
		self.dockmask:set_visible(true,false)
	else
		self.dockmask:set_visible(false,false)
	end
end



uiWindow.on_pop_window_move = function(self,pop,node,stop)
	print('uiWindow.on_pop_window_move',pop,node._ID,stop)
	if self.contents.lastpanel and self.contents.lastpanel.add_dock_panel then
		if stop then
			self:show_dockmask(nil,false)
			self:updatetick(true)
		else
			self:show_dockmask(nil,true)
			if self.dockparent ~= node then
				--self:updatetick(true)
			end
		end
		self.dockparent = node
	end
end


uiWindow.set_window_title = function(self,title)
	self:set_title(title)
	self.titlebar:set_inner_text(title)
end


uiWindow.on_main_menu = function(self,idx)
	self:show_dockmask(nil,false)
	self.ribber:show_ribber(idx)
	self.contents:show_content(idx)
	self:updatetick()	
end


uiWindow.set_main_node = function(self,node)
	if node ~= nil then
		self:show_dockmask(nil,false)
		node.popwin:set_visible(false)
		node:set_visible(false)
		node:set_inpop(false)
		
		if node.dockparent.add_panel then
			node.dockparent:add_panel(node.sztitle,node)
		else
			node:set_parent(node.dockparent)
		end
		
		node:set_style('display:block;width:100%;height:100%;')
	end
end


uiWindow.on_sys_button = function(self,stype)
	self:show_dockmask(nil,false)
	if stype == "min" then
		self:minbox()
	elseif stype == "max" then
		self:maxbox()
	else
		self:set_visible(false)
		gApp:exit()
	end
	self:updatetick()
end

