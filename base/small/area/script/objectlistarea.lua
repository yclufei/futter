 		
--[[

数据用本地 sqlite clientid 隐含方式排序：
接收网络数据时根据网络数据列表排序插入sqlite
,获得自增 clientid, 取 sqlite 时则根据 
clientid 排序显示.这样对于不同的网络数据获
取方式能很好排序显示。

html元素顺序：
 self[objectlistarea] => 
 scrollcontainer[scrolllist] => 
 scrollTable[scrollTable] => 
 listheight[listheight] => 
 itemParent[itemparent]
 
]]

gr_module("GmBase")

objectlistArea = inherit(GmBase.objectlistData):name("objectlistArea")

objectlistArea.init = function(self,parent,sorkey,totalItemCount,movecount,desc,ctrlkey)

	local top = self
	self.parent = parent
	
	GmBase.objectlistData.init(self,parent,ctrlkey or "objectlistarea",sorkey,desc)
	
	self.scrollcontainer 	= self:get_child("scrolllist")
	self.scrollTable 			= self.scrollcontainer:get_child("scrollTable")
	self.listheight 			= self.scrollTable:get_child("listheight")
	self.itemParent 			= self.listheight:get_child("itemparent")
	self.hiddenparent 		= self:get_child("hiddenparent")	
	self.initItem 				= self.hiddenparent:get_child("inititem")

	if not (self:is_init() and self.scrollcontainer:is_init() and self.scrollTable:is_init() and self.listheight:is_init() and self.itemParent:is_init() and self.hiddenparent:is_init() and self.initItem:is_init() ) then
		print('************************************************************** objectlistArea init error ')
		print('objectlistArea ',self:is_init())
		print('objectlistArea scrollcontainer',self.scrollcontainer:is_init())
		print('objectlistArea scrollTable',self.scrollTable:is_init())
		print('objectlistArea listheight',self.listheight:is_init())
		print('objectlistArea itemParent',self.itemParent:is_init())
		print('objectlistArea hiddenparent',self.hiddenparent:is_init())
		print('objectlistArea initItem',self.initItem:is_init())
		print('**************************************************************')
		--pause()
	end
	
	self.linkmove = self:get_child("linkmove")
	
	if g_screenType ~= "pc" then
		self.scrollcontainer:set_scroll_container(true)
	end
	
	self.scrollcontainer.on_scroll_top = function(self,w,h,x,y) top:on_scroll_top(w,h,x,y) end
	self.scrollcontainer.on_scroll_bottom = function(self,w,h,x,y) top:on_scroll_bottom(w,h,x,y) end
	self.scrollcontainer.on_scroll_stop = function(self,w,h,x,y) top:on_scroll_stop(w,h,x,y) end

	self.scrollcontainer:add_scroll_item_parent(self.itemParent)

	self.topload = self:get_child("topload")	
	self.toploading = GmCtrl.LoadingCtrl(self.topload)
	self.toploading:set_word("正在刷新")
	
	self.nocontent = self:get_child('nocontent')
	
	self.listbottominfo =  self:get_child('listbottominfo')
	self.bottomloadgif =  self:get_child('bottomloadgif')
	
	self._deletecallback = function(d)
		top:deletecallback(d)
	end
	
	self.totalItemCount = totalItemCount or 10

	self.movecount = movecount or 5
	
	self.firstIdx = 1
	self.lastIdx = 1

	self:init_item(self.totalItemCount)
	
	self.page = 0
	
	self.mMarginTop = 0
	
end



objectlistArea.set_attr = function(self,key,value)
	self.mgr:SetAttr(key,value)
	self:SetAttrDirect(key,value)
end
	
	


objectlistArea.callback = function(self,callbackey,tbname,postparam,data)

	--print('objectlistArea.callback',callbackey,tbname,postparam,data)
	
	if self.net.classname..'.'..self.netmethon == callbackey then
	
		self.toploading:set_loading(false)
		
		local top = self

	--[[
		if self._ID == 'objectlistarea' then
			self:SetAttrDirect('list_source',self.parent._ID)
		else
			self:SetAttrDirect('list_source',self.parent.parent._ID..'_'..self._ID)
		end
	]]
	
	
		local attrs = self:GetAttrs()

		for k,v in pairs(attrs) do
			if v ~= nil and postparam[k] ~= nil and tostring(postparam[k]) ~= tostring(v) then
				cwarn('objectlistArea.callback quit',k,v, postparam[k] )
				return false
			end
		end	
		
		self.page = 1
		
		if data['pageinfo'] and data['pageinfo'].size > 0 then
			self.page = tonumber(data['pageinfo'].page)
			-- 这页数据为空
			if data['pageinfo'].size == '0' then
				return false,true
			end
		elseif postparam['page'] then
			self.page = tonumber( postparam['page'] )
		end	
		
		
		if self.page == 1 then
		
			local status, msg = xpcall(function ()
	        top:init_item_data()
	    end, __G__TRACKBACK__)
	    
			self:updatetick(true)	
			
		else
		
			
			self.hostWindow:clear_scroll()
			
			if self.item[self.lastIdx].itemdata ~= nil then			
				local lastid = self.item[self.lastIdx].itemdata[self.sorkey]
				local ndata = self:get_next_local_data(lastid, 1)
				
				if ndata and table.size(ndata) > 0 then
					for a,b in GSortedPairs4(ndata) do
						self:append_item(b) -- append_item 回返回 item 的高度
					end
				end
			end
			
			if self.item[self.firstIdx] and self.item[self.firstIdx].itemdata then
				self.itemParent:set_css_item(1082,tostring(self.mMarginTop)..'px',true)
			end
			
		end
		
		self:calc_all_item_height()
		
		self.toploading:set_loading(false)
	
		return true,false
		
	end
	return false,true
end



objectlistArea.calc_all_item_height = function(self)

	self:layout()

	local cc = self.itemParent:get_child_count()
	
	for i = 0,cc do
		local item = self.itemParent:get_child_uinode_by_sort(i)
		if item and item.posidx ~= nil and item.itemdata ~= nil then
			-- print('calc_all_item_height cccccc' , i , item.posidx , item.itemdata['tid'] , self.mMarginTop )
			local _,_,_,iheight = item:get_scroll_pos()
			if iheight and iheight > 0 then
				item.iheight = iheight
			end
		end
	end
	
end


-- 触发顶部位置函数
objectlistArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
	--print('######################## objectlistArea on_scroll_top',pwidth,pheight,pxx,topY)
	local top = self
	self:clean() --已经包含 self:init_attrs()
	self:updatetick(true)
	self.toploading:set_word("获取数据")
	self.toploading:set_loading(true)
	self.page = 0
	local status,err = pcall(self.mgr.get_prev_page,self.mgr, self,function(key,count) end)
	if not status then
	    local code = err.code and tonumber(err.code) or 500
	    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
	    --print('@@@@ objectlistArea.on_scroll_bottom ERROR',code,msg )
	end
	self:updatetick(true)
end


-- 触发底部位置函数
objectlistArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
	--print('######################### objectlistArea on_scroll_bottom',pwidth,pheight,pxx,topY)	
	self:init_attrs()
	local status,err = pcall(self.mgr.get_next_page,self.mgr, self,function(key,count) end)
	if not status then
	    local code = err.code and tonumber(err.code) or 500
	    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
	    --print('@@@@ objectlistArea.on_scroll_bottom ERROR',code,msg )
	end	
	self:updatetick(true)
end


-- 初始化所有 item，即隐藏
objectlistArea.init_item = function(self,count)
	self.item = {}	
	for i = 1, count do
		self.item[i] = self:alloc_item_ctrl(i) -- 这里初始化item的uinode,由继承的类实现
		if not self.item[i]:is_init() then
			cerror('objectlistArea.init_item error',i)
		end
		self.item[i].itemdata = nil
		self.item[i].posidx = i
		self.item[i]:set_visible(false)
	end
end


objectlistArea.init_attrs = function(self)
	cerror("############ init_attrs error")
end
	

-- 清除所有item，重设索引
objectlistArea.clean = function(self)
	--print('################ objectlistArea.clean')
	if table.size(self.item) > 0 then
		if self.mgr then
			self.mgr:SetDirty(true)
		end
		self:init_attrs()
		self.itemParent:set_visible(false)
		for i = 1,self.totalItemCount do
			if self.item[i] then
				self.item[i].itemdata = nil	
				self.item[i]:set_visible(false,true)
				--print('################ objectlistArea set_visible',i,self.item[i],self.item[i].itemdata)
			end
		end
		self.itemParent:set_visible(true)
		self.firstIdx = 1
		self.lastIdx = 1
	end
	self.mMarginTop = 0
	self.itemParent:set_css_item(1082,'0px')
	self.nocontent:set_visible(false,true)
	self.scrollcontainer:set_scroll_pos(0,110*tonumber(gInfo['retina']))
	self:layout()
end


-- 用于继承
objectlistArea.on_net_data = function(self,page,netdata)
	print('################ objectlistArea.on_net_data')
end


objectlistArea.alloc_item_ctrl = function(self,i)
	cerror('################ objectlistArea.alloc_item_ctrl error')
end


-- 计算所有 item 高度并保存，todo状态
objectlistArea.show_item_pos = function(self)
	--[[
	if table.size(self.item) > 0 then
		self:layout()
		for i = 1,self.totalItemCount do
			if self.item[i].itemdata ~= nil then
				print( i , self.item[i]:scroll_item_height(), self.item[i].itemdata[self.sorkey]	)	
			else
				print( i , self.item[i]:scroll_item_height() )	
			end
		end
		if self.item[self.firstIdx].itemdata then
			print('-------------- firstIdx',self.firstIdx,self.item[self.firstIdx].itemdata[self.sorkey])
		end
		if self.item[self.lastIdx].itemdata then
			print('--------------- lastIdx',self.lastIdx,self.item[self.lastIdx].itemdata[self.sorkey])
		end
	end
	]]
end




-- todo 计算移动的item总高度，在移动 scrolltop - 总高度
objectlistArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)

	if table.size(self.item) > 0 then
	
		local xx,yy,width,height = self.scrollTable:get_scroll_pos()	
		
		if self.lastYY == nil then
			self.lastYY = yy
		end
			
		local bottomY = height - pheight + yy
		local targetY = -yy
		
		local advHeight = 0 -- 所有item的平均高度
	
		for a,b in pairs(self.item) do
			local _,_,_,iheight = b:get_scroll_pos()	
			if advHeight == 0 then
				advHeight = iheight
			else
				advHeight = ( iheight + advHeight ) / 2
			end
		end  
	
		local toppart = topY - self.mMarginTop
		local bottompart = height - pheight - topY
		local absdispart = math.abs(toppart - bottompart)
		
		if absdispart > pheight or absdispart > advHeight then
		
			local lastFirstIdx = self.firstIdx
		
			if toppart < bottompart and self.item[self.firstIdx].itemdata then
			
				--print('################################################################ drag down',toppart, bottompart,toppart - bottompart)
				-- 最后的逻辑item索引
				local lastid = self.item[self.firstIdx].itemdata[self.sorkey]
				-- 将要显示的后续数据
				local ndata = self:get_prev_local_data(lastid,1)
				if ndata and table.size(ndata) > 0 then			
					for a,b in GSortedPairs3(ndata) do
						self:insert_item(b) -- insert_item 回返回 item 的高度
					end		
				end
					
			elseif self.item[self.lastIdx].itemdata then
			
				--print('################################################################ drag up',toppart, bottompart,toppart - bottompart)
				local lastid = self.item[self.lastIdx].itemdata[self.sorkey]
				local ndata = self:get_next_local_data(lastid, 1)
				if ndata and table.size(ndata) > 0 then
					for a,b in GSortedPairs4(ndata) do
						self:append_item(b) -- append_item 回返回 item 的高度
					end
				end
				
			end	
			
			if self.item[self.firstIdx] and self.item[self.firstIdx].itemdata then
				self.itemParent:set_css_item(1082,tostring(self.mMarginTop)..'px',true)
			end
			
		end 
		
		self:layout()
		
		self:calc_all_item_height()
		
	end  
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	return false
end



-- 用本地数据初始所有 item 数据
objectlistArea.init_item_data = function(self)

	local top = self
	local count = 0
	
	if self.sorkey == nil then
		cerror('objectlistArea.init_item_data error : self.sorkey is nil')
		print(debug.traceback())
		return 
	end
	
	local tmpwstr = self:GetDBWhereChildSql()
	if tmpwstr and string.len(tmpwstr) > 5 then
		tmpwstr = ' where '..tmpwstr..' '
	end
	
	local status, msg = xpcall(function ()

		local retdata = top.mgr:GetPage2(nil,0, top.totalItemCount ,tmpwstr, top:get_sort_order())
		
		count = table.size(retdata)	
		if count > 0 then
			top.itemParent:set_visible(false)
			for a,b in GSortedPairs4(retdata) do
				top:append_item(b)
			end
			top.itemParent:set_visible(true)
		-- 下面会引起死循环
		else
			--	top:on_scroll_top()
			top.nocontent:set_visible(true,true)
		end	
		
	end, __G__TRACKBACK__)

	self:calc_all_item_height()
	
	self.scrollcontainer:set_scroll_pos(0,110*tonumber(gInfo['retina']))
	
	return count
	
end


-- 在前面插入 item ,只更改位置 index 和显示数据
objectlistArea.insert_item = function(self,itemdata)
	local height = 0
	if table.size(self.item) > 0 then
	
		if self.item[self.firstIdx].itemdata == nil then
			cerror('objectlistArea.insert_item error ')
		else
		
			local firstIdx = self.firstIdx - 1
			if firstIdx < 1 then
				firstIdx = self.totalItemCount
			end
			
			if self.item[self.firstIdx].iheight then
				self.mMarginTop = self.mMarginTop - self.item[self.firstIdx].iheight
			end
			
			if firstIdx == self.lastIdx then
				self.item[firstIdx]:insert_before(self.item[self.firstIdx])
				self:_set_item_data(firstIdx,itemdata)	
				height = self.item[firstIdx]:scroll_item_height()
				self.firstIdx = firstIdx
				self.lastIdx = firstIdx - 1
				if self.lastIdx < 1 then
					self.lastIdx = self.totalItemCount
				end
			else
				self.item[firstIdx]:insert_before(self.item[self.firstIdx])
				self:_set_item_data(firstIdx,itemdata)	
				height = self.item[firstIdx]:scroll_item_height()
				self.firstIdx = firstIdx
			end	
			
		end		
	end
	return height
end


-- 在后面添加 item ,只更改位置 index 和显示数据
objectlistArea.append_item = function(self,data)
	local height = 0
	if table.size(self.item) > 0 then
		if self.item[self.lastIdx].itemdata == nil then	
			--print('objectlistArea.append_item error ')
		else
		
			self.lastIdx = self.lastIdx + 1
			
			if self.lastIdx > self.totalItemCount then
			
				self.lastIdx = 1
				self.firstIdx = 2	
				
				self.item[self.lastIdx]:move_to(self.itemParent[0])
				height = self.item[self.lastIdx]:scroll_item_height()		
					
				if self.item[self.firstIdx].iheight then
					self.mMarginTop = self.mMarginTop + self.item[self.firstIdx].iheight
					--print('----------------------------------------------------- append_item',self.mMarginTop,self.item[self.firstIdx].iheight)
				end
			
			else
			
				if self.item[self.lastIdx].itemdata == nil then		
					--print('objectlistArea.append_item error 1',self.lastIdx,self.item[self.lastIdx].itemdata)	
				else
					
					self.firstIdx = self.lastIdx + 1
					
					if self.firstIdx > self.totalItemCount then
						self.firstIdx = 1
					else
					
					end
					
					self.item[self.lastIdx]:move_to(self.itemParent[0])
					height = self.item[self.lastIdx]:scroll_item_height()					
					
					if self.item[self.firstIdx].iheight then
						self.mMarginTop = self.mMarginTop + self.item[self.firstIdx].iheight
						--print('-------------------@@@@@@@@@@@@----------------------- append_item',self.mMarginTop,self.item[self.firstIdx].iheight)
					end
					
			
				end
				
			end
			
		end	
		self:_set_item_data(self.lastIdx,data)	
	else
		cerror('objectlistArea.append_item item is null')
	end
	return height
end


-- 设置单个 item 数据
objectlistArea._set_item_data = function(self,idx,b)
	self.item[idx].itemdata = b
	if self.item[idx].set_data then
	
		local status,err = pcall(self.item[idx].set_data,self.item[idx],b) -- 把整个脚本当作函数来执行
		if not status then
		    local code = err.code and tonumber(err.code) or 500
		    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
		    print('@@@@@@@@@@@@@@@@@@ objectlistArea._set_item_data ERROR',code,msg )
		end
		
		self.item[idx]:set_visible(true)

	end
end


objectlistArea.on_show = function(self,key)

end



objectlistArea.get_prev_local_data = function(self,id,count)
	if count > 0 then
		self:init_attrs()
		local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
		local otherwherestr = self.mgr:GetWhereChildSql()
		if otherwherestr and string.len(otherwherestr) > 3 then
			wherestr = wherestr..' and '..otherwherestr
		end
		local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
		self.mgr:SetDirty(true)
		local tb =  self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
		return tb
	end
	return {}
end


objectlistArea.get_next_local_data = function(self,id,count)
	if count > 0 then
		self:init_attrs()
		local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
		local otherwherestr = self.mgr:GetWhereChildSql()
		if otherwherestr and string.len(otherwherestr) > 3 then
			wherestr = wherestr..' and '..otherwherestr
		end
		local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
		self.mgr:SetDirty(true)
		local tb =  self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
		return tb
	end
	return {}
end