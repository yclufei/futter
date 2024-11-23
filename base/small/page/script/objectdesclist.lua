
-- 帖子列表
gr_module("GmBase")

objectdesclistFrame = inherit(GmBase.FrameBase):name("objectdesclistFrame")

objectdesclistFrame.init = function (self,hostWindow,frameid,mainmenu)
	local top = self
	local win = hostWindow
	local fid = frameid or "templete_objectdesclistFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)


	self.subnav = GmBase.subnavArea(self)
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)
																		
																		
																		--[[
	self.subnav:set_right("NavTDWidth searchNavTD",function(self)
																				local frame = top.hostWindow:popup("objectsearchFrame")
																				frame:set_clsid(top.listctrl.clsid)
																				frame:set_data(top.data)
																			end)
																			]]
				
							

	self.searcharea = self:get_child("searcharea")
	self.searcharea.content = self.searcharea:get_child("content")
	self.searcharea.visible = false
	self.searcharea.showArea = function(self,bl)
		if not bl then
			if self.visible then
				self:set_visible(false)
				self:updatetick()
				self.visible = false
			end
		else
			if not self.visible then
				self:set_visible(true)
				self:updatetick()
				self.visible = true
			end
		end
	end
	self.btsearch = self:get_child("btsearch")
	self.btsearch:set_click(function(button) 
														top.searcharea:showArea(not top.searcharea.visible)
													end)
													
										
--print("objectdesclistFrame.init",3)


	self.catogaryctrl = GmBase.categarylistArea(self,true)
	self.catogaryctrl:set_click_func(	function(obj)
																			top:set_inner_data(obj.data)	 
		 										 						end)
		 										 						
--print("objectdesclistFrame.init",3,1)

	self.listctrl = GmBase.objectdesclistArea(self)
--print("objectdesclistFrame.init",3,2,self.listctrl.set_click_func)

	if self.listctrl.set_click_func then
		self.listctrl:set_click_func(	function(self) 
																		self.parent:delitem(self.data['id'])
																	end,
																	function(self)
																		local frame = top.hostWindow:addNavFrame("objectdetailFrame")
																		frame:set_data(self.data)
																	end,
																	function(self) 
																		local frame = top.hostWindow:addNavFrame("objectupdateFrame")
																		frame:set_data(self.data)
																	end )
	end
	
--print("objectdesclistFrame.init",4)

	if mainmenu == true then
		self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
	end
	
--print("objectdesclistFrame.init",5)

	self.clsid = -1
	self.searchItem = nil
	
	self.needhidesearch = true
		
--print("objectdesclistFrame.init",1)

end


objectdesclistFrame.hideSearchButton = function(self)
	self.btsearch:set_visible(false)
end


objectdesclistFrame.hideSearchArea = function(self)
	self.searcharea:showArea(false)
end



objectdesclistFrame.show_mainmenu = function(self,bl)

end



objectdesclistFrame.set_data = function(self,data)

	self.data = data
	
	-- 类型目录
	self.catogaryctrl:set_data(data)
	
	self.clsid = self.listctrl:set_tree_rel_clsid(data)

	local url = self:set_inner_data(data)
	
	
	-- 是否隐藏搜索
	if curl_data_getAttr(data,"hidesearch") then
		self:hideSearchButton()		
		self.needhidesearch = true
	else		
		self.needhidesearch = false
	end
	
	-- 搜索面板
	if not self.needhidesearch and self.searchItem == nil then
		local fname = "searchPanel"..data['id'] -- 创建的名称	
		self.searchItem = self.hostWindow:getSearchPanelTemplete(self.clsid,self.searcharea.content,fname)
		if self.seatchItem then
			self.searchItem:set_frame(self)
			local clsdata = gApp:get_class_define_by_id(self.clsid)
			self.searchItem:set_data(data)
		end
	end
	
	return url

end


objectdesclistFrame.hideBackButton = function(self)
	self.subnav:set_left()
end

objectdesclistFrame.set_inner_data = function(self,data)

	local tb = {}
	tb.attr = {}
	
	-- 分类下的
	if self.data.id ~= data.id then -- 这里只发送子节点的id
		tb.rel = {}
		local reltb = {}
		reltb.childcid = data.clsid
		reltb.childoid = data.id
		reltb.parentcid = self.clsid
		reltb.target = 'parentoid'
		table.insert(tb.rel,reltb)
	else
		-- todo
		-- 这里需要判断是否父节点，如果是则需要把所有子节点ID送过去。
	end

	--对象列表
	local url = nil
	if self.clsid ~= -1 then
		url = self.listctrl:set_data(self.clsid,tb)
	else
		url = self.listctrl:set_data(data["id"],tb)
	end
	
	
	self.subnav:set_title(data.title) -- 标题
	
	self:updatetick()
	
	return url
	
end
