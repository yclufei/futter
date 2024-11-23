-- 列表类

gr_module("GmCtrl")

ListBase = inherit(GmCtrl.ControlBase):name("ListBase")

ListBase.init = function(self,parent,elename,urls,dontrepos)

	local top = self
	
	GmCtrl.ControlBase.init(self,parent,elename)
	
	self.urls = urls
	
	self.id = -1

 	self.hideItem = {}	
	self.curPage = 0
	self.curTotalPage = 0
	self.curPageCount = 10
	self.idlist = {}
	
	self.lastItem = nil
	
	self.childs.scrollcontainer = self:get_child("scrolllist")
	self.childs.scrollcontainer:set_scroll_container(true)
	self.childs.scrollcontainer.on_scroll_top = function(self,w,h,x,y) top:on_scroll_top(w,h,x,y) end
	self.childs.scrollcontainer.on_scroll_bottom = function(self,w,h,x,y) top:on_scroll_bottom(w,h,x,y) end
	self.childs.scrollcontainer.on_scroll_stop = function(self,w,h,x,y) top:on_scroll_stop(w,h,x,y) end
	
	self.listParent = self:get_child("sbwhlist")
	
	self.childs.scrollcontainer:add_scroll_item_parent(self.listParent)
	
	self.hiddenparent = self:get_child("hiddenparent")	

	self.initItem = self.hiddenparent:get_child("inititem")
	
	self._deletecallback = function(d)
		top:deletecallback(d)
	end
	
	self.set_data_callback = function(a)
		self:datacallback(a) 
	end
	
	self.listheight = self:get_child("listheight")
	
	self:init_top_pos()	
	
	self.itemcount = 0
	
	self.loading = false
	
		
end



ListBase.show_scroll_bar = function(self,bl)
	self.childs.scrollcontainer:show_scroll_bar(bl)
end

ListBase.init_scroll_content_size = function(self)
	if self.topshowword and self.topshowword:is_init() then
		self.topshowword:set_load(function() self:on_load() end)
	end
end


ListBase.on_load = function(self)
	local w,h,x,y = self:get_scroll_pos()
	local style = string.format("height:%dpx",h)
	print('!!!!!!!!!!!!!!!!!!!!!! ListBase.on_load #4 ',self.parent._ID,style)
	self.listheight:set_style(style)
	self:init_top_pos()
end


ListBase.on_scroll_top = function(self)
	--print(getGBK('刷新'))
end


ListBase.on_scroll_bottom = function(self)
	--print(getGBK('下一页'))
end



ListBase.deletecallback = function(self,d)
	local key = d["data"]
	local item = self.idlist[key]
	self:removeItem(item)
	self:updatetick()
end

ListBase.remove_item = function(self,id)
	if self.idlist[id] then
		local item = self.idlist[id]
		self:removeItem(item)
		self:updatetick()
	else
		print('没找到',id)
	end
end


ListBase.setitem = function(self,id,data)
	local item = self.idlist[id]
	item["data"] = data
	item["ctrl"].data = data
	if item["ctrl"].set_data then
		item["ctrl"]:set_data(data)
	end
	return item
end


ListBase.delitem = function(self,id)
	local top = self
	local url = string.format(self.urls["del"],id)
	top:curl(url,self._deletecallback)
end


ListBase.init_item = function(self,item)
	
end


	
ListBase.additem = function(self,id,data)		
	local item = nil	
	local id = data["id"]
	if id == nil then
		print("ListBase.additem warn 1")
		--
		id = table.size(self.idlist)
		data["id"] = id
	end
	if self.idlist[id] == nil then
		local top = self	
		item = {}
		item["ctrl"] = self:new_item(data)
		if item["ctrl"] then
			item["ctrl"]:set_attr("id","id"..id)
			self.idlist[id] = item
			--print("ListBase.additem",self.idlist,id,self.idlist[id])
			return self:setitem(id,data)	
		end
	else
		print("ListBase.additem error idlist id is not null",id)
		--table.print(data)
	end	
	return nil
end	
		
		
		
ListBase.new_templete_item = function(self,data)	
	local item = nil
	if self.clsid and tonumber( self.clsid ) > 0 and data['id'] ~= -1 then
		local fname = "frame"..data['id']
		item = self.hostWindow:getListItemTemplete(self.clsid,self.hiddenparent,fname)
	end
	if not item then
		item = self.initItem:copy()
	end
	item:set_visible(false)
	return item
end


ListBase.new_item = function(self,data)	

	if table.size(self.hideItem) > 0 then
		for a,b in pairs(self.hideItem) do
			self.hideItem[a] = nil
			return b
		end
	end
	
	if self.clsid == nil then
		if data['clsid'] and tonumber(data['clsid']) > 0 then
			self:set_clsid(data['clsid'])
		else
			if data['attr'] then
				for a,b in pairs(data['attr']) do
					if b['name'] == "clsid" then
						self:set_clsid(b['title'])
					end
				end
			end
		end
	end

	local item = self:new_templete_item(data)
	self:init_item(item)
	return item																
end


ListBase.removeItem = function(self,item)
	local top = self
	local id = item['data']['id']
	item['ctrl']:set_parent(self.hiddenparent)
	item['ctrl']:set_style("display:none;")
	item['ctrl'].sc_height = nil
	table.insert(top.hideItem,item['ctrl'])
	self.idlist[id] = nil
end


ListBase.trans_data = function(self,data)
	return data
end


ListBase.set_data = function(self,id,postparam)	
	if self.loading == false and ( tonumber(id) ~= tonumber(self.id) or postparam ~= nil or table.size(self.idlist) == 0 ) then
		if self.nocontent and self.nocontent:is_init() then
			self.nocontent:set_visible(false)
		end
		self.parent.hostWindow:showActionMask(true)
		self.id = tonumber(id)
		local url = string.format(self.urls["get"] ,self.curPage,self.curPageCount,tonumber(id))
		self:curl(url,self.set_data_callback,postparam)
		self.loading = true
		return url
	else
		print("ListBase.set_data no id", self.loading, tonumber(id),self.id, postparam , self.urls["get"])
	end	
end


ListBase.clear = function(self)
	--print("ListBase.datacallback")
	if table.size(self.idlist) > 0 then	
		for a,b in pairs(self.idlist) do
			self:removeItem(b)
		end
	else
		print("ListBase.clear idlist is null",self.idlist)
		--table.print(self.idlist)
	end	

	self.curPage = 1
	self.curTotalPage = 1
	self.curPageCount = 10
	self.idlist = {}
	
	self.lastItem = nil
end



ListBase.add_single_item = function(self,b)
	if self.nocontent and self.nocontent:is_init() then
		self.nocontent:set_visible(false)
	end
	local a = b['id']
	local d = self:trans_data(b)
	local item = self:additem(a,d)
	self.itemcount = self.itemcount + 1
	item["ctrl"].itemcount = self.itemcount
	if self.lastItem == nil then		
		item["ctrl"]:set_parent(self.listParent)
	else
		item["ctrl"]:insert_before(self.lastItem)
	end
	self.lastItem = item["ctrl"]
	return item['ctrl']
end


ListBase.datacallback = function(self,data,sortfunc)
	
	print('ListBase.datacallback')
		
	if self.toploading and self.toploading:is_init() then
		self.toploading:set_loading(false)
	end

	local top = self
	
		if data["success"] == true then
			local pageinfo = data["pageinfo"]
			if pageinfo then
				self.curPage = tonumber( pageinfo["page"] )	
				self.curTotalPage = tonumber( pageinfo["totalpage"] )	
			end
			
			local _,listheight,_,_ = self:get_scroll_pos()
			
			if self.curPage == 0 or self.curPage == nil then
				local style = "height:"..tostring(listheight).."px"
				self.listheight:set_style(style)
				self:clear()
				self:init_top_pos()
				if self.nocontent and self.nocontent:is_init() and table.size(data["data"]) == 0 then
					self.nocontent:set_visible(true)
				end
			end
			
			
			if data["data"] and table.size(data["data"]) > 0 then
			
				if self.nocontent and self.nocontent:is_init() then
					self.nocontent:set_visible(false)
				end
				
				self.data = data['data']
				
				local ctls = {}
				local sfunc = GIDSortedPairs
				
				if sortfunc then
					sfunc = sortfunc
				end
				
				for a,b in sfunc(data["data"]) do
					local d = top:trans_data(b)
					local item = top:additem(a,d)						
					if item then
						table.insert( ctls , item )
					end
				end
				
				for a,b in GIDSortedPairs(ctls) do
				
					self.itemcount = self.itemcount + 1
					b["ctrl"].itemcount = self.itemcount
					
					
					if self.lastItem == nil then	
						self.lastItem = b["ctrl"]
					end
					
					b["ctrl"]:set_parent(self.listParent)
					
				end
				
				for a,b in GIDSortedPairs(ctls) do
				
					b["ctrl"]:set_visible(true)
					
				end
				
				--self:layout()
				
				local oLeft,oTop,oWidth,oHeight,cLeft,cTop,cWidth,cHeight,sLeft,sTop,sWidth,sHeight = self.listParent:get_size()
				if listheight < sHeight then
					local style = "height:"..tostring(sHeight).."px"
					self.listheight:set_style(style)
				end
				
				--self:layout()
				
			else
				print("listbase nodata!")
			end

				
			self:ondatacallback(data["data"])
			
		else
			self.data = {}			
			self:ondataerror(data)
		end	
		
	self.loading = false
	
	self:updatetick(true)

	
end	


ListBase.init_top_pos = function(self)
	--print("ListBase.init_top_pos",110 * gInfo['retina'])
	self.childs.scrollcontainer:set_scroll_pos(-1,110 * gInfo['retina'],true)
end


ListBase.ondatacallback = function(self,data)	

end


ListBase.ondataerror = function(self,data)	
	if data["msg"] then
		self.parent.hostWindow:showMsg(data["msg"])
	else
		--table.print(data)
	end
end

