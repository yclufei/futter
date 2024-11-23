gr_module("GmBase")

Window = inherit(gscriptwindow,GmBase.FrameMgr):name("Window")

Window.list = {}

Window.init = function (self,html,framemgr)

	self:init_window(html)
	
	self.body = GmBase.Node(self)
	self:_get_body_element(self.body[0])
	
	self.hostWindow = self
	
	if framemgr == nil then
		GmBase.FrameMgr.init(self,self:get_child("ScrollViewParent"),self:get_child("frametemplete"))
	end
	
	
	self.actionmask = self.body:get_child("actionmask")
	
	if self.actionmask:is_init() then
		self.actionmask.timerun = false
		self.actionmask.on_timeout = function(am)
			am.timerun = false
			am:set_style("display:none")
		end
		
		self.actionmask.actionmaskclick = self.actionmask:get_child("actionmaskclick")
		if self.actionmask.actionmaskclick:is_init() then
			self.actionmask.actionmaskclick:set_mousedown(function(am)
				print("actionmask mousedown")
			end)
		end
	else
		--debug.pause()
	end
	
	self.plugins = {}
	
	return self
end


Window.cpp_call = function(self,fkey)
	print('cpp_call',self,fkey)
	if fkey == 'showuiedit' then			
		self:showFrame('uiedit')	
	end
end



Window.centerWindow2 = function(self,w,h)
	self:set_size(w,h)
	self:set_pos( ( gInfo.screenwidth - w ) / 2 , ( gInfo.screenheight - h ) / 2 - 30 )
	print(gInfo.screenwidth , w , gInfo.screenheight , h)
end


Window.centerWindow = function(self)
	local w , h = self:get_size()
	self:set_pos( ( gInfo.screenwidth - w ) / 2 , ( gInfo.screenheight - h ) / 2 - 10 )
    print('--------centerWindow',w , h , gInfo.screenwidth, gInfo.screenheight)
end





Window.init_child_whith_click = function(self,cname,func)
	local ctrl = self:get_child(cname)
	ctrl.func = func
	ctrl:set_mousedown(ctrl.func)
	return ctrl
end


Window.set_parent = function(self,parent)
	self:_set_parent(parent[0])
end



Window.hideAllPlugin = function(self)
	for a,b in pairs(self.plugins) do
		if b.set_visible then
			b:set_visible(false)
		end
	end
end


--[[
22.186519390059
111.76557662041
]]
Window.on_location = function(self,x,y)
--	print("notimpl Window.on_location",x,y)
end


--[[
]]
Window.on_timeout = function(self)
	self.actionmask:set_style("display:none")
end

Window.showActionMask = function(self,bl)
	if self.actionmask:is_init() then
		if bl then
			self.actionmask:set_style("display:block")
		else
			self.actionmask:set_style("display:none")
		end
		if not self.actionmask.timerun then
			self.actionmask.timerun = true
		end
	else
		print('Window.showActionMask error self.actionmask:is_init() == false')
	end
end
------------------------------------------------------------------------------------------------

Window.addAreaTemplete = function(self,fname,createtunc)
	self.areatemplete[fname] = createtunc(self.frametempleteContainer)
	self.areacreate[fname] = createtunc
end


Window.has_area = function(self,fname)
	return ( fname and self.areatemplete[fname] )
end

Window.init_area = function(self,aname)
	local area = self:make_area(self.frametempleteContainer,"init"..aname,aname)
	if area and area:is_init() then
		self.areas["init"..aname] = area
	else
		print("Window.init_area error 1")
	end
	--print("Window.init_area end")
end

Window.on_voice_result = function(self,str)
--	aprint("Window.on_voice_result "..str)
end



Window.on_command = function(self,data)
--	table.print(data)
end




Window.make_area = function(self,parent,fname,ftemplete)
	if self.areas[fname] then
		return self.areas[fname]
	end
	if fname and ftemplete and self.areatemplete[ftemplete] then
		if parent.ctrls[fname] == nil then
			if fname == ftemplete then
				parent.ctrls[fname] = self.areacreate[ftemplete](parent)
			else
				local node = self.areatemplete[ftemplete]:copy()
				if node:is_init() then 
					node:set_attr("id",fname)
					node:set_visible(true)
					node:set_parent(parent)
					node:releaseRef()
					if self.areacreate[ftemplete] then
						parent.ctrls[fname] = self.areacreate[ftemplete](parent,fname)
						if node:is_init() then 
							parent.ctrls[fname]:set_visible(true)
						else
							print("Window.make_area error 1")
						end
					else
						print("Window.make_area error 2")
					end
				else
					print("Window.make_area error 3")
				end
			end
		end
		return parent.ctrls[fname]
	else
		print('Window.make_area error',parent,fname,ftemplete)
	end
end



Window.showWindow = function(self)
	self:set_visible(true)
	return self
end

Window.hideWindow = function(self)
	self:set_visible(false)
	return self
end

Window.on_loaded = function(self)
--	print("Window.on_loaded")
	return self
end

Window.on_drag_file = function(self,...)
--	table.print(arg)
end

Window.on_keypress = function(self,c,a,s,k)
--	print("Window.on_keyup",c,a,s,k)
end

Window.get_element_by_id = function(self,id)
    local child = GmBase.Node(self)
    local success = self:_get_child(child[0],id)
    if not success then    	
			--print(debug.traceback())
    end        
    return child
end


Window.set_node_inner_text = function(self,id,txt)
	local node = GmBase.Node(self,id)
	node:set_inner_text(txt)
	return self
end


Window.get_child = function(self,id)
    local child = GmBase.Node(self)
    local success = self:_get_child(child[0],id)
    if not success then
    --[[
    	local s = debug.getinfo(2)
--    	table.print(s)
			print(debug.traceback())
			local a = 1
	    while true do
	        local name,value = debug.getlocal(1,a)
	        if not name then break end
	        print(name,value)
	        a = a + 1
	    end
	    ]]
    end        
    return child
end


Window.init_sys_button = function(self)
	local top = self
	self.sysclose = GmBase.Node(self,"sysclose")
	self.sysclose:set_click( function(self)
															top:set_visible(false)
													  end)

	self.sysmaxbox = GmBase.Node(self,"sysmaxbox")
	self.sysmaxbox:set_click( function(self)
															top:maxbox()
													  end)

	self.sysminbox = GmBase.Node(self,"sysminbox")
	self.sysminbox:set_click(function(self)
															top:minbox()
													  end)
	return self
end


Window.on_load = function(self)
	-- aprint("Window.on_load")
  return self
end
