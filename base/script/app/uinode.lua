gr_module("GmBase")

Node = inherit(gscriptuinode):name("Node")

Node.init = function (self,hostWindow,id)
	self:set_host_window(hostWindow[0])
	self.hostWindow = hostWindow
	if id then
		self._ID = id
		self:init_object(id)
		if not self:is_init() then
			print("!!!!!!!!!!!!!! Node.init node is not init",id)
		end
	end
	self.ctrls = {}
	return self
end


Node.set_inline_visible = function(self,bl,update)
	if bl then
		self:set_style('display:inline-block',update)
	else
		self:set_style('display:none',update)
	end
end


Node.init_by_parent = function (self,parent,id)
	if parent and parent.hostWindow then
		self:set_host_window(parent.hostWindow[0])
		self.hostWindow = parent.hostWindow
		self._ID = id
		if id then    
	    local success = parent:_get_child(self[0],id)
	    self.parent = parent
	    if not success then    	
				print(debug.traceback())
	    end
			if not self:is_init() then
				print("!!!!!!!!!!!!!! Node.init_by_parent node is not init",parent._ID,id)
				--pause()
			end
		end
		self.ctrls = {}
	else
		cerror('Node.init_by_parent error')
	end
	return self
end


Node.add_ctrl = function(self,ctrlname,ctrl)
	ctrl:set_parent(self)
	self.ctrls[ctrlname] = ctrl
	return table.size(self.ctrls)
end


Node.get_ctrl = function(self,ctrlname)
	return self.ctrls[ctrlname]
end


Node.init_child_whith_click = function(self,cname,func)
	local ctrl = self:get_child(cname)
	ctrl.func = func
	ctrl:set_mousedown(ctrl.func)
	return ctrl
end

	
Node.set_id = function(self,str)
	self:set_attr("id",str)
end


Node.on_timeout = function(self)
	--self:remove_timeout()
--	print("Node ontimeout")
end

Node.on_drag = function(ctrl)	
		print('Node on_drag')
end

Node.make_plugin = function(self,etype,ename)
	if etype == "flash" then
		local pp = GmBase.PluginFlash(self.hostWindow)
		pp:set_plugin_parent(self[0],ename)
		table.insert( self.hostWindow.plugins , pp )
		return pp
	elseif etype == "photoview" then
		local pp = GmBase.PluginPhotoView(self.hostWindow)
		self:set_plugin_parent(pp[0],ename)
		table.insert( self.hostWindow.plugins , pp )
		return pp
	elseif etype == "mapview" then
		local pp = GmBase.PluginMapView(self.hostWindow)
		self:set_plugin_parent(pp[0],ename)
		table.insert( self.hostWindow.plugins , pp )
		return pp
	end
	return nil
end


Node.on_step = function(self,s)
	local w,h,x,y = self:get_scroll_pos()
--	print("on_step",s+1,w,h,x,y)
end

Node.on_begin_scroll_top = function(self)
--	print("on_begin_scroll_top")
end

Node.on_begin_scroll_bottom = function(self)
--	print("on_begin_scroll_bottom")
end

Node.on_begin_scroll_left = function(self)
	print("on_begin_scroll_left")
end

Node.on_begin_scroll_right = function(self)
	print("on_begin_scroll_right")
end

Node.on_scroll_top = function(self)
--	print("on_scroll_top")
end

Node.on_scroll_bottom = function(self)
--	print("on_scroll_bottom")
end

Node.on_scroll_stop = function(self)
	print("on_scroll_stop")
end



Node.on_scroll_left = function(self)
--	print("on_scroll_left")
end

Node.on_scroll_right = function(self)
--	print("on_scroll_right")
end


Node.insert_before = function(self,node)
  self:_insert_before(node[0])
  return self
end


Node.curlfile = function(self,file,url,func)
	curlfile(file,url,_luacallbackwrap(func))	
	return self
end


Node.curl = function(self,url,func,param)
	if param then
		local cjson2 = cjson.new()
		json_text = cjson.encode(param)
		ajax(url,json_text,_luacallbackwrap(func))	
	else
		ajax(url,_luacallbackwrap(func))	
	end
	return self
end


Node.savecurl = function(self,url,func,param)
	if param then
		local cjson2 = cjson.new()
		json_text = cjson.encode(param)
		ajax(url,json_text,_luacallbackwrap(func),true)	
	else
		ajax(url,_luacallbackwrap(func),true)	
	end
	return self
end


Node.downloadurl = function(self,url,func)
	print("downloadurl")
	downloadurl(self.hostWindow[0],url,func)
	return self
end

Node.set_change = function(self,func)
	self:add_event_callback("change")
	self.on_change = func
	return self
end

Node.set_input = function(self,func)
	self:add_event_callback("input")
	self.on_input = func
	return self
end

Node.set_editablecontentchanged = function(self,func)
	self:add_event_callback("editablecontentchanged")
	self.on_editablecontentchanged = func
	return self
end

Node.set_domcharacterdatamodifiedevent = function(self,func)
	self:add_event_callback("domcharacterdatamodified")
	self.on_domcharacterdatamodifiedevent = func
	return self
end




Node.set_click = function(self,func)
	if func then
		self.on_click = func
	end
	self:add_event_callback("click")
	return self
end

Node.on_click = function(self,func)
	aprint("Node.on_click")
end



Node.set_load = function(self,func)
	if func then
		self.on_load = func
	end
	self:add_event_callback("load")
	return self
end

Node.on_load = function(self)
	print("Node.on_load")
end




Node.set_select = function(self,func)
	self:add_event_callback("select")
	self.on_select = func
	return self
end

Node.set_blur = function(self,func)
	self:add_event_callback("blur")
	self.on_blur = func
	return self
end
Node.on_blur = function(self,x,y)
--    aprint("Node.on_blur")
end


Node.set_dblclick = function(self,func)
	self:add_event_callback("dblclick")
	self.on_dblclick = func
	return self
end
Node.on_dblclick = function(self,x,y)
--    aprint("Node.on_dblclick")
end

Node.set_keydown = function(self,func)
	self:add_event_callback("keydown")
	self.on_keydown = func
	return self
end
Node.on_keydown = function(self,c,a,s,k)
--	print("Node.on_keydown",c,a,s,k)
end

Node.set_keyup = function(self,func)
	self:add_event_callback("keyup")
	self.on_keyup = func
	return self
end
Node.on_keyup = function(self,c,a,s,k)
--	print("Node.on_keyup",c,a,s,k)
end

Node.set_keypress = function(self,func)
	self:add_event_callback("keypress")
	self.on_keypress = func
	return self
end
Node.on_keypress = function(self,c,a,s,k)
--	print("Node.on_keyup",c,a,s,k)
end

Node.set_mouseout = function(self,func)
	self:add_event_callback("mouseout")
	self.on_mouseout = func
	return self
end
Node.on_mouseout = function(self,c,a,s,k)
--	print("Node.on_mouseout",c,a,s,k)
end

Node.set_mousemove = function(self,func)
	self:add_event_callback("mousemove")
	self.on_mousemove = func
	return self
end
Node.on_mousemove = function(self,c,a,s,k)
--	print("Node.on_mousemove",c,a,s,k)
end

Node.set_mousedown = function(self,func)
	self.on_mousedown = func
	if self.base_list then
		--self.base_list['on_mousedown'] = func
	end
	self:add_event_callback("mousedown")
	return self
end
Node.on_mousedown = function(self,c,a,s,k)
	print("Node.on_mousedown",c,a,s,k,self.classname)
end

Node.set_mouseup = function(self,func)
	self:add_event_callback("mouseup")
	self.on_mouseup = func
	return self
end
Node.on_mouseup = function(self,c,a,s,k)
--	print("Node.on_mouseup",c,a,s,k)
end

Node.set_focus = function(self,func)
	self:add_event_callback("focus")
	self.on_focus = func
	return self
end
Node.on_focus = function(self,c,a,s,k)
	print("Node.on_focus",c,a,s,k)
end


Node.set_contextmenu = function(self,func)
	self:add_event_callback("contextmenu")
	self.on_contextmenu = func
	return self
end
Node.on_contextmenu = function(self,c,a,s,k)
--	print("Node.on_contextmenu",c,a,s,k)
end




Node.set_parent = function(self,p)
		--print(2)
	self.parent = p
		--print(2)
  self:_set_parent(p[0])
		--print(2)
  return self
end

Node.add_scroll_item_parent = function(self,p)
  self:_add_scroll_item_parent(p[0])
  return self
end


Node.copy = function(self)
    local clonetr = GmBase.Node(self.hostWindow)
    clonetr:_copy(self[0])
    return clonetr
end


Node.get_child = function(self,id)
    local child = GmBase.Node(self.hostWindow)
    local success = self:_get_child(child[0],id)
    if not success then    	
			--print(debug.traceback())
    end    
    
    child.parent = self
    child._ID = id
    return child
end


Node.get_child_by_sort = function(self,sort)
    local child = GmBase.Node(self.hostWindow)
    self:_get_child_by_sort(child[0],sort)
    child.parent = self
    return child
end


Node.get_child_tbl_by_sort = function(self,qname,sort)
    local child = GmBase.Node(self.hostWindow)
    self:_get_child_tbl_by_sort(qname,child[0],sort)
    return child
end


Node.inner_get_child = function(self,child,id)
    local success = self:_get_child(child[0],id)
    if not success then    	
			--print(debug.traceback())
    end
    return self
end


Node.show = function(self,bl)
    if bl then
        self:animation(500,0,20,"z-index:2;top:-%dpx;",function() end)
    else
        self:animation(0,500,20,"z-index:1;top:-%dpx;",function() end)
    end
    return self
end


Node.on_view_size_change = function(self,left,right,top,bottom)
	print( "(Node.on_view_size_change )",self.ID ,left,right,top,bottom )
end


Node.on_end_animation = function(self)
	self:updatetick()
end


Node.show2 = function(self,bl)
    if bl then
        self:animation(500,0,20,"z-index:2;left:-%dpx;",function() end)
    else
        self:animation(0,500,20,"z-index:1;left:%dpx;",function() end)
    end
    return self
end
