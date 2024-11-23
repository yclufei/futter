
-- 控件基类
gr_module("GmCtrl")

ControlBase = inherit(GmBase.Node,GmSql.list):name("ControlBase")

ControlBase.init = function(self,parent,elename)	

	local top = self	
	self.parent = parent
	self.hostWindow = parent.hostWindow	
		
	GmBase.Node.init_by_parent(self,parent,elename)
	GmSql.list.init(self,g_local_db_name)	
	
	self.childs = {}		
	
	self.clsid = nil
	self._order = ''
	self.movecount = 5
	
end


ControlBase.init_by_host = function(self,host,elename)	
	local top = self	
	self.parent = host
	self.hostWindow = host	
	GmBase.Node.init(self,host,elename)
	GmSql.sql.init(self)	
	self.childs = {}		
	self.clsid = nil
	self._order = ''
	self.movecount = 5
end


ControlBase.set_data = function(self,data)
	cerror('ERROR : ',self._ID,'need impletion set_data')
end

-- 子控件被点击或者选择的执行函数
ControlBase.on_select = function(self,data)
	if data and data.action then
		self.hostWindow:exec_action(self,data.action,data)
	else
		cerror('ControlBase.on_select error',self._ID)
		--table.print(data)
	end
end	

-- 初始化控件，主要设置list_source属性为控件ID，之后设置初始化数据
ControlBase.init_control = function(self,tbname,orderstr, net,netmethon,count,dontinit)
	local top = self
	if string.len(tbname) > 1 then	
	
		-- 设置list_source属性为控件ID
		if self._ID == 'objectlistarea' then
			self:SetAttrDirect('list_source',self.parent._ID)
		else
			self:SetAttrDirect('list_source',self.parent._ID..'_'..self._ID)
		end

		print('init_control',self.parent._ID,self._ID)
			
		self._order = orderstr
		self.movecount = count
		self.net = net
		self.netmethon = netmethon
		self.tablename = tbname	
		
		--设置初始化数据
		if dontinit ~= nil then
			local dbsql = self:GetDBWhereChildSql()
			if dbsql ~= nil then
				dbsql = " where "..dbsql
			end
			local status, msg = xpcall(function ()
	        top:init_item_data(nil , dbsql, orderstr,0,count)
	    end, __G__TRACKBACK__)
		end
		
	else
		cerror('## ControlBase.init_control ERROR ',tbname,orderstr, net,netmethon,count)
	end
end

-- 回调函数
ControlBase.callback = function(self,callbackey,tbname,postparam,data)

	if self.net.classname..'.'..self.netmethon == callbackey then
		
		-- 设置list_source属性为控件ID	
		if self._ID == 'objectlistarea' then
			self:SetAttrDirect('list_source',self.parent._ID)
		else
			self:SetAttrDirect('list_source',self.parent.parent._ID..'_'..self._ID)
		end
		
		local attrs = self:GetAttrs()
		
		for k,v in pairs(attrs) do
			if postparam[k] ~= v then
				--print('ControlBase.callback quit',k, postparam[k] , v)
				return
			end
		end
		
		local page = 0
		if data['pageinfo'] then
			page = data['pageinfo'].page - 1
		end
		local dbsql = self:GetDBWhereChildSql()
		
		--print('ControlBase.callback'," where "..dbsql , self._order,page,self.movecount)
		--设置数据
		self:init_item_data(self.tablename ," where "..dbsql , self._order,page,self.movecount)
		
		return true,false
	end
	return false,true
end


-- objectlistArea 有自己的 init_item_data 函数
ControlBase.init_item_data = function(self,tb,where,order,page,count)

	local top = self
	self.tablename = tb or self.tablename
	self._where = where or self._where
	self._order = order or self._order
	self._page = page or self._page or 0
	self._count = count or self._count
	
	
	
	if self.tablename ~= nil and string.len(self.tablename) > 0 and self._count > 0 then
	
		local resrc = g_datasource(self.tablename , self._where , self._order , self._page, self._count)
			
		-- 转换服务器数据格式为控件可以接受的数据格式
		
		--print('ControlBase.init_item_data ',self.tablename , self._where , self._order , self._page, self._count)
		--table.print(resrc)
		
		if resrc then
			local bl,re = g_translate_array(self._ID,self.tablename,resrc)
			if bl and table.size(re) > 0 then
				local ret = table.size(re)
				for a,b in pairs(resrc) do
					for k,v in pairs(b) do
						if re[a][k] == nil then
							re[a][k] = v
						end
					end
				end
				self:set_data(re)
				return ret
			else
				cerror('ControlBase.init_item_data g_translate_array error',bl,re,self._ID,self.tablename,resrc)
				--print(debug.traceback())
				--table.print(re)
			end	
			
		else
			cerror('ControlBase.init_item_data g_datasource error',resrc)
			print(debug.traceback())
		end
		return table.size(re)
	else
		cerror('ERROR : ControlBase.init_item_data',self._ID, self.tablename , self._where , self._order , self._page, self._count)
		print(debug.traceback())
	end
	return 0
end


-- 从服务器拿数据初始化item
ControlBase.init_net_data = function(self)

	print('###########ControlBase.init_net_data',self.net, self.netmethon )
			
	if self.net ~= nil and self.netmethon ~= nil and self.net[self.netmethon] ~= nil then
		-- 设置请求参数
		
			print('ControlBase.init_net_data',self.net, self.netmethon , self.net[self.netmethon] )
	
			local tbname,key,postparam = self.net[self.netmethon](self.net)
			
			--[[
			if self._ID == 'objectlistarea' then
				self:SetAttrDirect('list_source',self.parent._ID)
			else
				self:SetAttrDirect('list_source',self.parent.parent._ID..'_'..self._ID)
			end
			]]
			
			local attrs = self:GetAttrs()
			
			for k,v in pairs(attrs) do
				postparam[k] = v
			end
			table.print(postparam)
			
			-- 添加回调
			self.net:add_callback(self.net.classname..'.'..self.netmethon,self)
			
			-- 正式请求
			self.net[self.netmethon](self.net,postparam)
			
	else
		cerror('ControlBase.init_net_data error',self._ID,self.parent._ID,self.net,self.netmethon)
	end
end
	

ControlBase.on_load = function(self)
	print("ControlBase.on_load")
end


-- 添加跳转链接
ControlBase.addJumpLink = function(self,ename,data)	
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		top.hostWindow:addNavFrame(ename)
	end)
end


ControlBase.addJumpLink2 = function(self,framename,ename,data)	
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		top.hostWindow:addNavFrame(framename)
	end)
end


-- 添加显示链接
ControlBase.addShowLink = function(self,ename)
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
		top.hostWindow:showFrame(ename)
	end)
end


ControlBase.set_tree_rel_clsid = function(self,treeitem)
	attr = curl_data_getAttr(treeitem,'clsid')
	if attr then
		return self:set_clsid(tonumber(attr['title']))
	end
	return -1
end


ControlBase.set_clsid = function(self,clsid)
	self.clsid = clsid
	return self.clsid
end


ControlBase.jump_list = function(self,data,innerdata)
	local top = self
	local framename = data['name']
	if self.hostWindow:has_frame_templete(framename) then
		local framename = "frame"..data['id']
		ftempletename = data['name']																				
		local frame = self.hostWindow:showFrame("frame"..data['id'],function(win)
																												local frame = win:make_frame(framename,ftempletename,false)
																												return frame
																											end)
		if frame and frame.set_data then
			frame:set_data(data)	
			if innerdata then
				frame:set_inner_data(innerdata) 
			end
		end
	else
		local frame = top.hostWindow:addNavFrame("objectlistFrame") 
		frame:set_data(data)
		if innerdata then
			frame:set_inner_data(innerdata) 
		end
	end 
end