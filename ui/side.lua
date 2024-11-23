
gr_module("GmUI")

uiside = inherit(GmBase.Window):name("uiside")

uiside.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"ui/side.html")
	
	self:set_top_win()
	self:set_tool_win()
	
	self.mScrollViewParent:set_drag_window(true)
	self.mScrollViewParent.on_drag = function(ctrl)	
		top:on_drag()
	end
	self.mScrollViewParent:set_mousedown(function(ctrl)	
		print('uiside mousedown')
	end)
	self.mScrollViewParent:set_mouseup(function(ctrl)	
		print('uiside mouseup')
		top:set_visible(false)
	end)
	self.mScrollViewParent:set_mousemove(function(ctrl)	
		print('uiside mousemove')
	end)


	self:set_transparent(2)
			
	self:set_size(1000,1000)
			
end


uiside.set_direct = function(self,dir)
	if dir then
		self.mScrollViewParent:set_style('cursor:s-resize')
	else
		self.mScrollViewParent:set_style('cursor:w-resize')
	end
end


uiside.set_notify_node = function(self,node)
	self.notify_node = node
end


uiside.on_pos_changing = function(self,x,y,w,h)	
	-- 开始移动 dock 离开窗体
	print('uiside on_pos_changing',self.src_x,self.src_y,x,y,w,h)
	if self.notify_node and self.src_x and self.src_y and self.src_x > 0 and self.src_y > 0 then
		self.notify_node:on_side_notify(  self.src_x ,  self.src_y , x , y )
	else
		cerror('uiside on_pos_changing error', self.notify_node, self.src_x, self.src_y, x, y, w, h )
	end
	self.src_x = x
	self.src_y = y
end


uiside.on_drag = function(self)	
	-- 开始移动 dock 离开窗体
	print('todo uiside on_drag')
	self.src_x = 0
	self.src_y = 0
end


uiside.on_activate = function(self,act)
	print('uiside on_activate',act)
	if act == false then
		self:set_visible(false)
	end
	self.src_x = 0
	self.src_y = 0
end


uiside.on_mouse_leave = function(self)
	print('uiside on_mouse_leave',act)
	self:set_visible(false)
	self.src_x = 0
	self.src_y = 0
end

