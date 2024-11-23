
gr_module("GmBase")

FrameBase = inherit(GmCtrl.ControlBase):name("FrameBase")

FrameBase.init = function(self,hostWindow,eid,show)
	self.eid = eid
	--print('FrameBase init',self,hostWindow.mScrollViewParent,eid,show)
	GmCtrl.ControlBase.init(self,hostWindow.body,eid)
	self.frameid = eid
	self.subareas = {}
	self.subarealinks = {}	
	self.clsid = -1
	self.callback_func = nil
	self.visible = false
	if show then
		self:set_visible(true)	
	else
		self:set_visible(false)	
	end
end

FrameBase.init_by_parent = function(self,parent,eid,show)
	self.eid = eid
	
	GmCtrl.ControlBase.init(self,parent,eid)
	
	---print('FrameBase init',self,self.hostWindow.mScrollViewParent,eid,show)
	
	
	self.frameid = eid
	self.subareas = {}
	self.subarealinks = {}	
	self.clsid = -1
	self.callback_func = nil
	self.visible = false
	
end

FrameBase.on_show = function(self,t)
	--print("FrameBase.on_show")
end

FrameBase.on_hide = function(self,t)
	--print("FrameBase.on_hide")
end

FrameBase.set_mousedown = function(self,func)
	if self.base_list and self.base_list[1] then
		self.base_list[1].base_list[1]['on_mousedown'] = func
	end
	self:add_event_callback("mousedown")
	return self
end


FrameBase.on_mousedown = function(self,c,a,s,k)
--	print("FrameBase.on_mousedown",c,a,s,k,self.classname)
end


FrameBase.set_click = function(self,func)
	if self.base_list and self.base_list[1] then
		self.base_list[1].base_list[1]['on_click'] = func
	end
	self:add_event_callback("click")
	return self
end
FrameBase.on_click = function(self,func)
--	aprint("FrameBase.on_click")
end



FrameBase.on_back_key = function(self,k)
	aprint("FrameBase.on_back_key",self.framename,self.frameid)
end



FrameBase.set_callback = function(self,func)
	self.callback_func = func
end


FrameBase.on_callback = function(self,param)
--	aprint( "(FrameBase.callback )" )
	if self.callback_func then
		self:callback_func(param)
	end
end

FrameBase.on_view_size_change = function(self,left,right,top,bottom)
	print( "(FrameBase.on_view_size_change )",self.ID ,left,right,top,bottom )
end


FrameBase.set_clsid = function(self,clsid)
	self.clsid = clsid
end


FrameBase.init_mainmenu = function(self,hasmainmenu)
	if self.subareas then
		if hasmainmenu then
			if self.subareas["initmainmenu"] == nil then
				self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
			end
		else
			self.subareas["initmainmenu"] = nil
		end
	else
		print("FrameBase.init_mainmenu no subareas",self.subareas)
	end
end


FrameBase.init_back_button = function(self)
	local top = self
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
end


FrameBase.hideBackButton = function(self)
	if self.jumpback then
		self.jumpback:set_click(function(self) end)
		self.jumpback:set_class("emptyNavTD")
	end
end


--初始化
FrameBase.init_with_parent = function(self,parent,eid)
	GmBase.Node.init(self,parent.hostWindow)	

  local success = parent:_get_child(self[0],eid)	
  if not success then    	
		print(debug.traceback())
  end 
    	
	self.ctrls = {}	
	self.subareas = {}
	self.subarealinks = {}	
	self:set_visible(false)	
end


-- 设置面板主数据
FrameBase.set_data = function(self,data)
	self.data = data
end





-- 添加跳转链接
FrameBase.addJumpLink = function(self,ename,data)	
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		top.hostWindow:addNavFrame(ename)
	end)
end



FrameBase.addJumpLink2 = function(self,framename,ename,data)	
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		top.hostWindow:addNavFrame(framename)
	end)
end



-- 添加显示链接
FrameBase.addShowLink = function(self,ename,func)
	local top = self
	local pfunc = func
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		--print("addShowLink",ename,pfunc)
		local f = top.hostWindow:showFrame(ename)
		if func then
			func(f)
		end
	end)
end



-- 显示面板
FrameBase.show = function(self,show,nottemp,pos)
	if nottemp then
		local style = "margin-left:" .. tostring(pos).. "%%;top:0px;z-index:"..tostring(pos)
		self:set_style(style)	
	else
		self:set_style("position:absolute;z-index:1;top:-200%%;")
	end
	self.visible = show
	return self	
end



-- 显示面板
FrameBase.show2 = function(self,show,nottemp,pos)
	if nottemp then
		local style = "margin-left:" .. tostring(pos).. "%%;z-index:"..tostring(pos)
		self:set_style(style)	
	else
		self:set_style("z-index:1;top:-200%%;")
	end
	self.visible = show
	return self	
end
