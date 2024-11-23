
gr_module("GmUI")

uipop = inherit(GmBase.Window):name("uipop")

uipop.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"ui/pop.html")
	
	self:set_top_win()
	self:set_tool_win()
	
	self.mScrollViewParent:set_drag_window(true)
	self.mScrollViewParent.on_drag = function(ctrl)	
			top:on_drag()
	end

	self.initnode = true

	self.mainnode = nil
	
	self:set_transparent(2)
			
	self:set_size(1000,1000)
			
end



uipop.on_drag = function(self)	
	-- 开始移动 dock 离开窗体
			print('uipop on_drag',self.initnode == false and self.mainnode ~= nil)
		if self.initnode == false and self.mainnode ~= nil then
			if self.mainnode.dockparent and self.mainnode.dockparent.remove_panel then
				self.mainnode.dockparent:remove_panel(self.mainnode)
			end
			self.mainnode:set_inpop(true)
			self:set_size(900,900)
			self.mainnode:set_parent(self.mScrollViewParent)
			self.mainnode:set_style('display:block;width:100%;height:100%;')
			self:set_size(self.mainnode.width,self.mainnode.height)
			self:set_transparent(250)
			self.mainnode:updatetick(true)
			self:updatetick(true)
			self.initnode = true
			self.mainnode.dockparent:print_outer_html()
		end
end


uipop.on_activate = function(self,act)
	if act == 0 and self.initnode == false then
		self:set_visible(false)
	end
end


uipop.on_mouse_leave = function(self)
	if self.initnode == false then
		self:set_visible(false)
	end
end


uipop.set_main_node = function(self,node)
	self.initnode = false
	self.mainnode = node	
	print('######################################################### uipop set_main_node',self.mainnode)
end

