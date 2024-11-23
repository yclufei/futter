
					
gr_module("GmUI")

DockPanel = inherit(GmCtrl.ControlBase):name("DockPanel")

DockPanel.init = function (self,parent,aid,title)

	local top = self
	local fid = aid or "DockPanel"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.popwin = GmUI.uipop(500,500)
	self.popwin:set_parent(self.hostWindow)
	
	self.dockparent = parent
	
	self.inpop = false
	
	self.movefunc = function(ctrl)	
		local ttop = top
		print('DockPanel dragbar.set_mousemove movefunc',ttop.inpop)
		if ttop.inpop == false then		-- 放开 pop 窗口时设置 dock 到 dockparent
			print('leave window')
			
			local ww,hh = top:get_box_size()
			local tx,ty = top.hostWindow:get_pos()		
			local sx,sy,sw,sh = top:get_scroll_pos()
			local	_,_,w1,h1 , x2,y2,w2,h2 , x3,y3,w3,h3 = top.dockparent:get_size()
			ttop.width = ww 
			ttop.height = hh 
			
			ttop.popwin:set_size(ww,hh)
			
			ttop:set_visible(false)
			
			
			ttop:updatetick(true)
			
			ttop.popwin:set_main_node(ttop)
			ttop.dragbar:updatetick(true)	
			
			ttop:set_visible(true)
			ttop.popwin:set_pos(tx+sx,ty+sy)
			ttop.popwin:set_size(ww,35)
			ttop.popwin:set_transparent(2)			
			ttop.popwin:set_visible(true)
			
			ttop.popwin:updatetick(true)
			
		else
			print('drag window')
			ttop.dragbar:set_drag_window(true)
		end
	end

			
			
	self.dragbar = self:get_child('dragbar')
	self.dragbar:set_drag_window(true)
	self.dragbar:set_mousemove(self.movefunc)
	
	self.title = self:get_child('title')
	
	self.ctxt = self:get_child('ctxt')
	
	self:set_title(title)
	
	
	
	--self.canvas = self:make_plugin('flash','flashplayer')
	--self.canvas:set_src('a.svg')
	
	
	
end

DockPanel.set_inpop = function(self,bl)
	self.inpop = bl
end


DockPanel.set_title = function(self,title)
	if title then
		self.title:set_inner_text(title)
		self.sztitle = title		
	end
end

DockPanel.set_child_panel = function(self,title,panel)
	self:set_title(title)
	panel:set_visible(true)
	panel:set_parent(self.ctxt)
end