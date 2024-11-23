		
gr_module("GmUI")

hFrame = inherit(GmBase.Node):name("hFrame")

hFrame.init = function (self,parent)

	local top = self											
	GmBase.Node.init_by_parent(self,parent,"contentframe_h")	
	
	
	self.content = self:get_child('content')
	self.middle = self:get_child('middle')
	
	
	
	self.lefts = {}
	self.rights = {}
	
	-------------- 拉伸边缘改变大小
	
	self.on_vside_notify_top = function(ctrl,sx,sy,tx,ty)
		if sx > 0 and sy > 0 and tx > 0 and ty > 0 then
			local disy = sy - ty
			ctrl.sidesize = ctrl.sidesize - disy
			ctrl:set_inline_visible(true)
			ctrl:updatetick(true)
		end
	end
	
	
	self.on_vside_notify_bottom = function(ctrl,sx,sy,tx,ty)
		--print('on_vside_notify_bottom',sx,sy,tx,ty)
		if sx > 0 and sy > 0 and tx > 0 and ty > 0 then
			local disy = sy - ty
			ctrl.sidesize = ctrl.sidesize + disy
			ctrl:set_inline_visible(true)
			ctrl:updatetick(true)
		end
	end
	
	
	self.on_hside_notify_left = function(ctrl,sx,sy,tx,ty)
		--print('on_hside_notify_left',sx,sy,tx,ty)
		if sx > 0 and sy > 0 and tx > 0 and ty > 0 then
			local disx = sx - tx
			ctrl.sidesize = ctrl.sidesize - disx
			ctrl.parent:reset_sidesize()
			ctrl:updatetick(true)
			top:updatetick(true)
		end
	end
	
	
	self.on_hside_notify_right = function(ctrl,sx,sy,tx,ty)
		--print('on_hside_notify_right',sx,sy,tx,ty)
		if sx > 0 and sy > 0 and tx > 0 and ty > 0 then
			local disx = sx - tx
			ctrl.sidesize = ctrl.sidesize + disx
			ctrl.parent:reset_sidesize()
			ctrl:updatetick(true)
			top:updatetick(true)
		end
	end
	
	
	-------------------------------------------------
	
	-- 显示拉伸边缘窗体
	self.dragsidefunc = function(ctrl)	
		--print('dragsidefunc')
		local ttop = top
		
		local ww,hh = ctrl:get_box_size()
		local tx,ty = top.hostWindow:get_pos()		
		local sx,sy,sw,sh = ctrl:get_scroll_pos()
		local	_,_,w1,h1  = top:get_size()
			
	---print('dragsidefunc',tx+sx,tx+sx,ww,hh)
		
		ctrl.winside.src_x = tx+sx
		ctrl.winside.src_y = ty+sy
			
		ctrl.winside:set_pos(tx+sx,ty+sy)
		ctrl.winside:set_size(ww,hh)	
		ctrl.winside:set_visible(true)
			
	end
	
	
	
	-- 焦点丢失事件
	self.on_node_focus_change_func = function(ctrl,bl)
		--print('on_node_focus_change_func',ctrl._ID, ctrl.parent.popmodal)
		if ctrl.parent.popmodal and bl then
			ctrl:set_inline_visible(false,false)
			--ctrl.parent.tabmenu:clear()
		end
	end
	
	
	-- 挂靠面板添加删除自由面板
	
	self.add_panel = function(popanel,txt,panel)
		--print('add_panel',popanel._ID,txt)
		local idx = popanel.parent.tabmenu:add_item(txt)
		panel.idx = idx
		panel:set_parent(popanel)
		popanel.parent:reset_sidesize()
		popanel.parent.panels[idx] = panel
		top.menu_select(popanel.parent,idx)
		popanel.parent.tabmenu:on_select(idx)
	end
	
	
	
	self.remove_panel = function(popanel,panel)
		local idx = panel.idx
		popanel.parent.tabmenu:remove_item(idx)
		popanel.parent.panels[idx] = nil
		if table.size(popanel.parent.panels) == 0 then
			top:show_panel(popanel.parent._ID,false)
		else
			--print('remove_panel',panel.idx,table.size(popanel.parent.panels))
			for a,b in pairs(popanel.parent.panels) do
				top.menu_select(popanel.parent,a)
				break
			end
		end
		top:updatetick(true)
	end
	
	
	-------------------------------------------------
	
	-- 菜单选择
	self.menu_select = function(ctrl,idx)
		--print('menu_select set_focus_change_notify_node',ctrl._ID)
		for a,b in pairs(ctrl.panels) do
			b:set_inline_visible(false,false)
		end
		top:show_panel(ctrl._ID,true)
		
		if ctrl.popmodal then
			top:pop_panel(ctrl._ID,true)
			ctrl.popanel.on_node_focus_change = top.on_node_focus_change_func
			top.hostWindow:set_focus_change_notify_node(ctrl.popanel[0])
		end
		ctrl.panels[idx]:set_inline_visible(true,false)
	end
	
	
	

	
	---------------------------------------------------------------------------------------------------------------------------------------------------
	
	-- 0 顶部
	self.top = self:get_child('top')
	self.top.middle = self.top:get_child('middle1')
	self.top.popanel = self.top:get_child('tpopanel')
	self.top.popanel.dragside = self.top.popanel:get_child('dragside')
	self.top.tabmenu = GmCtrl.MenuBase(self.top,'tabmenu','tab','tabmenu_2',20)
	
	-- 1 变量
	self.top.popanel.sidesize = 200
	self.top.popmodal 		= true -- 弹出式
	self.top.panels = {}
	
	-- 2 菜单选择
	self.top.on_item_select = self.menu_select
	
	-- 3 重设尺寸
	self.top.reset_sidesize = function(side,sidesize)
		if sidesize then
			side.popanel.sidesize = sidesize
		end
		
		-- 中间 TD
		local style = string.format('height:%dpx;', side.popanel.sidesize + 26)
		if side.popmodal then
			style = string.format('height:%dpx;', 26)
		end
		side.middle:set_style(style)
		
		-- 弹出挂靠面板
		style = string.format('height:%dpx;margin-bottom:-%dpx;',side.popanel.sidesize, side.popanel.sidesize)
		side.popanel:set_style(style)			
		
		--拉伸边缘
		style = string.format('margin-top:%dpx;', side.popanel.sidesize - 5)
		side.popanel.dragside:set_style(style)		
	end
	
	-- 4 显示隐藏
	self.top.set_visible = function(panel,bl)
		--print('self.top.set_visible',panel._ID,bl)
		if bl then
			panel:set_style('display:table-row')
		else
			panel:set_style('display:none')
		end
		if panel.popmodal == false and bl then
			panel:reset_sidesize()
		end
		--panel:print_outer_html()
	end
	
	
	-- 5 自由面板的显示隐藏
	self.top.popanel.set_inline_visible = function(popanel ,bl ,update)
		if popanel.sidesize and bl then		
			popanel.parent:reset_sidesize()
		else
			GmBase.Node.set_inline_visible(popanel ,bl ,update)
		end		
	end
	self.top.popanel.set_visible = self.top.popanel.set_inline_visible
	
	
	
	-- 6 边缘拉伸功能
	if self.top.popanel.dragside:is_init() then
		self.top.popanel.dragside:set_mousemove(self.dragsidefunc)	
		self.top.popanel.dragside.winside = GmUI.uiside(500,500)
		self.top.popanel.dragside.winside:set_direct(true)
		self.top.popanel.dragside.winside:set_notify_node(self.top.popanel)
		self.top.popanel.on_side_notify = self.on_vside_notify_top
	else
		cerror('self.left.popanel.dragside is_init error')
	end
	
	-- 7 添加删除自由面板
	
	self.top.popanel.add_panel = self.add_panel
	self.top.popanel.remove_panel = self.remove_panel	
	self.top.popanel.on_pop_window_move = self.hostWindow.showDockParent
	
	
	
	
	-- 8 两边的 TD
	--self.lefts[1] = self.top:get_child('left1')
	--self.rights[1] = self.top:get_child('right1')
	
	
	
	----------------------------------------------------------------------------------------------------------
	
	
	-- 0 底部
	self.bottom = self:get_child('bottom')
	self.bottom.middle = self.bottom:get_child('middle3')
	self.bottom.tabmenu = GmCtrl.MenuBase(self.bottom,'tabmenu','tab','tabmenu_2',20)
	self.bottom.popanel = self.bottom:get_child('bpopanel')
	self.bottom.popanel.dragside = self.bottom.popanel:get_child('dragside')
	
	
	-- 1 变量
	self.bottom.popmodal 	= true
	self.bottom.panels = {}
	self.bottom.popanel.sidesize = 200
	
	
	
	
	-- 2 菜单选择
	self.bottom.on_item_select = self.menu_select
	
	
	-- 3 重设尺寸
	self.bottom.reset_sidesize = function(side,sidesize)	
		if sidesize then
			side.popanel.sidesize = sidesize
		end		
		-- 中间 TD
		local style = string.format('height:%dpx;vertical-align:bottom', side.popanel.sidesize + 26)
		if side.popmodal then
			style = string.format('height:%dpx;vertical-align:top;', 26)
		end
		side.middle:set_style(style)		
		-- 弹出挂靠面板
		style = string.format('height:%dpx;margin-top:-%dpx;',side.popanel.sidesize, side.popanel.sidesize)
		side.popanel:set_style(style)
		--拉伸边缘
		style = string.format('margin-bottom:%dpx;',side.popanel.sidesize - 5)
		side.popanel.dragside:set_style(style)
	end
	
	
	
	-- 4 显示隐藏
	self.bottom.set_visible = function(panel,bl)
		--print('self.bottom.set_visible',panel._ID,bl)
		if bl then
			panel:set_style('display:table-row')
		else
			panel:set_style('display:none')
		end
		if panel.popmodal == false and bl then
			panel:reset_sidesize()
		end
		--panel:print_outer_html()
	end
	
	
	-- 5 自由面板的显示隐藏
	self.bottom.popanel.set_inline_visible = function(popanel ,bl ,update)
		--print('self.bottom.popanel.set_inline_visible',popanel._ID ,bl ,update)
		if popanel.sidesize and bl then		
			popanel.parent:reset_sidesize()
		else
			GmBase.Node.set_inline_visible(popanel ,bl ,update)
		end		
		--popanel.parent:print_outer_html()
	end
	self.bottom.popanel.set_visible = self.bottom.popanel.set_inline_visible
	
	
	
	-- 6 边缘拉伸功能
	if self.bottom.popanel.dragside:is_init() then
		self.bottom.popanel.dragside:set_mousemove(self.dragsidefunc)	
		self.bottom.popanel.dragside.winside = GmUI.uiside(500,500)
		self.bottom.popanel.dragside.winside:set_direct(true)
		self.bottom.popanel.dragside.winside:set_notify_node(self.bottom.popanel)
		self.bottom.popanel.on_side_notify = self.on_vside_notify_bottom
	else
		cerror('self.bottom.popanel.dragside is_init error')
	end
	
	
	
	-- 7 添加删除自由面板
	self.bottom.popanel.add_panel = self.add_panel
	self.bottom.popanel.remove_panel = self.remove_panel	
	self.bottom.popanel.on_pop_window_move = self.hostWindow.showDockParent
	
	
	-- 8 两边的 TD
	--self.lefts[3] = self.bottom:get_child('left3')
	--self.rights[3] = self.bottom:get_child('right3')
	
	
	
	
	
	----------------------------------------------------------------------------------------------------------
	
	
	--左边
	self.left = self.middle:get_child('left')
	self.left.tabmenu = GmCtrl.MenuBase(self.left,'tabmenu','tab','tabmenu_1',20) 
	self.left.popanel = self.left:get_child('lpopanel')
	self.left.popanel.dragside = self.left.popanel:get_child('dragside')
	
	
	
	-- 1 变量
	self.left.popmodal 		= false
	self.left.panels = {}
	self.left.popanel.sidesize = 200
	
	
	-- 2 菜单选择
	self.left.on_item_select = self.menu_select
	
	self.left.set_visible = function(ctrl,bl)
		cerror('left set_visible',bl)
		for k,v in pairs(top.lefts) do
			if bl then
				if ctrl.popmodal then
					v:set_style('display:table-cell')
				else
					local style = string.format('display:table-cell;width:%dpx;',ctrl.popanel.sidesize + 26 )
					v:set_style(style)
				end
			else
				v:set_style('display:none')
			end
		end
		if bl then
			ctrl:reset_sidesize()
		else
			ctrl.popanel.dragside.winside:set_visible(false)
		end
	end
	
	-- 3 重设尺寸
	self.left.reset_sidesize = function(side,sidesize)	
		if sidesize then
			side.popanel.sidesize = sidesize
		end		
		for k,v in pairs(top.lefts) do
				if side.popmodal then
					v:set_style('display:table-cell')
				else
					local style = string.format('display:table-cell;width:%dpx;',side.popanel.sidesize + 26 )
					--print('reset_sidesize',v._ID,style)
					v:set_style(style)
				end
		end
		local style = string.format('margin-left:%dpx;',side.popanel.sidesize - 5)
		side.popanel.dragside:set_style(style)
		local style = string.format('width:%dpx;margin-right:-%dpx;',side.popanel.sidesize,side.popanel.sidesize)
		side.popanel:set_style(style)			
	end
	
	
	
	if self.left.popanel.dragside:is_init() then
		self.left.popanel.dragside:set_mousemove(self.dragsidefunc)	
		self.left.popanel.dragside.winside = GmUI.uiside(500,500)
		self.left.popanel.dragside.winside:set_direct(false)
		self.left.popanel.dragside.winside:set_notify_node(self.left.popanel)
		self.left.popanel.on_side_notify = self.on_hside_notify_left
	else
		cerror('self.left.popanel.dragside is_init error')
	end
	
	self.left.popanel.add_panel = self.add_panel	
	self.left.popanel.remove_panel = self.remove_panel	
	self.left.popanel.on_pop_window_move = self.hostWindow.showDockParent
	
	
	
	
	--自由面板的显示隐藏
	self.left.popanel.set_inline_visible = function(popanel ,bl ,update)
		if popanel.sidesize and bl then		
			local style = string.format('width:%dpx;margin-right:-%dpx;',popanel.sidesize,popanel.sidesize)
			popanel:set_style(style)			
			style = string.format('margin-left:%dpx;',popanel.sidesize - 5)
			popanel.dragside:set_style(style)			
		else
			GmBase.Node.set_inline_visible(popanel ,bl ,update)
		end		
	end
	self.left.popanel.set_visible = self.left.popanel.set_inline_visible
	
	
	
	
	----------------------------------------------------------------------------------------------------------
	-- 右边
	self.right = self.middle:get_child('right')
	self.right.tabmenu = GmCtrl.MenuBase(self.right,'tabmenu','tab','tabmenu_1',20)
	self.right.popanel = self.right:get_child('rpopanel')
	self.right.popanel.dragside = self.right.popanel:get_child('dragside')
	
	
	-- 1 变量
	self.right.popmodal 	= true
	self.right.panels = {}
	self.right.popanel.sidesize = 200
	
	
	-- 2 菜单选择
	self.right.on_item_select = self.menu_select
	
	-- 3 重设尺寸
	self.right.reset_sidesize = function(side,sidesize)	
		if sidesize then
			side.popanel.sidesize = sidesize
		end		
		for k,v in pairs(top.rights) do
				if side.popmodal then
					v:set_style('display:table-cell')
				else
					local style = string.format('display:table-cell;width:%dpx;',side.popanel.sidesize + 26 )
					--print('reset_sidesize',v._ID,style)
					v:set_style(style)
				end
		end
		local style = string.format('width:%dpx;margin-left:-%dpx;',side.popanel.sidesize,side.popanel.sidesize)
		side.popanel:set_style(style)			
		style = string.format('margin-right:%dpx;',side.popanel.sidesize - 5)
		side.popanel.dragside:set_style(style)			
	end
	
	self.right.set_visible = function(ctrl,bl)
		cerror('right set_visible',bl)
		for k,v in pairs(top.rights) do
			if bl then
				if ctrl.popmodal then
					v:set_style('display:table-cell')
				else
					local style = string.format('display:table-cell;width:%dpx;',ctrl.popanel.sidesize + 26 )
					v:set_style(style)
				end
			else
				v:set_style('display:none')
			end
		end
		if bl then
			ctrl:reset_sidesize()
		else
			ctrl.popanel.dragside.winside:set_visible(false)
		end
	end
	
	if self.right.popanel.dragside:is_init() then
		self.right.popanel.dragside:set_mousemove(self.dragsidefunc)	
		self.right.popanel.dragside.winside = GmUI.uiside(500,500)
		self.right.popanel.dragside.winside:set_direct(false)
		self.right.popanel.dragside.winside:set_notify_node(self.right.popanel)
		self.right.popanel.on_side_notify = self.on_hside_notify_right
	else
		cerror('self.right.popanel.dragside is_init error')
	end
	
	self.right.popanel.add_panel = self.add_panel
	self.right.popanel.remove_panel = self.remove_panel	
	self.right.popanel.on_pop_window_move = self.hostWindow.showDockParent
	
	self.lefts[2] = self.left 
	self.rights[2] = self.right
	
	
	
	--自由面板的显示隐藏
	self.right.popanel.set_inline_visible = function(popanel ,bl ,update)
		if popanel.sidesize and bl then		
			local style = string.format('width:%dpx;margin-left:-%dpx;',popanel.sidesize,popanel.sidesize)
			popanel:set_style(style)			
			style = string.format('margin-right:%dpx;',popanel.sidesize - 5)
			popanel.dragside:set_style(style)			
		else
			GmBase.Node.set_inline_visible(popanel ,bl ,update)
		end		
	end
	self.right.popanel.set_visible = self.right.popanel.set_inline_visible
	
	
	
	
	
	----------------------------------
	
	
	----------------------------------
	
	
	
	
	
	
	
	self.side = {}
	self.side['top'] = self.top
	self.side['bottom'] = self.bottom
	self.side['left'] = self.left
	self.side['right'] = self.right
	
	
								
end




hFrame.on_item_select = function(self,idx)
	print('hFrame.on_item_select',idx)
end

hFrame.get_panel = function(self,side)
	return self.side[side]
end

hFrame.get_last_panel = function(self,side)
	return self.lastPopanel
end

hFrame.show_panel = function(self,side,bl)
	--print('show_panel',side,bl)
	self.side[side]:set_visible(bl)
	self.lastPopanel = self.side[side]
	return self.side[side]
end


hFrame.pop_panel = function(self,side,bl)
	--print('pop_panel',side,bl)
	if self.side[side].popmodal then
		self.side[side].popanel:set_inline_visible(bl,false)		
		if bl then
			self.side[side].popanel.on_node_focus_change = self.on_node_focus_change_func
			self.hostWindow:set_focus_change_notify_node(self.side[side].popanel[0])
		end
	end
	if table.size(self.side[side].panels) == 0 and bl == false then
		self:show_panel(side,false)
	end	
	return self.side[side]
end


