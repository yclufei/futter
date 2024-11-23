
-- 帖子列表
gr_module("GmBase")

objectdescmulsellistFrame = inherit(GmBase.FrameBase):name("objectdescmulsellistFrame")

objectdescmulsellistFrame.init = function (self,hostWindow,frameid,mainmenu)
	local top = self
	local win = hostWindow
	local fid = frameid or "templete_objectdescmulsellistFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)


	self:init_back_button()
	
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

	self.jumpobjectpublic = self:get_child("jumpobjectpublicFrame")
	self.jumpobjectpublic:set_click(function(self)
		local frame = top.hostWindow:popup("objectsearchFrame")
		frame:set_clsid(top.listctrl.clsid)
		frame:set_data(top.data)
	end)

	self.catogaryctrl = self:get_child('mulsel')
		 										 						
	self.listctrl = GmBase.objectdesclistArea(self)
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
	   
	self.navtitle = self:get_child('navtitle')

	
	if mainmenu == true then
		self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
	end
	
end

objectdescmulsellistFrame.hideSearchArea = function(self)
	self.searcharea:showArea(false)
end



objectdescmulsellistFrame.hideSearchButton = function(self)
	self.btsearch:set_visible(false)
end
  
objectdescmulsellistFrame.show_mainmenu = function(self,bl)

end



objectdescmulsellistFrame.set_data = function(self,data)
	
--	print('objectdescmulsellistFrame.set_data')
	
	if curl_data_getAttr(data,"hidesearch") then
		self:hideSearchButton()
	end
	
	local top = self	
	self.data = data	
	local c = 0
	for a,b in pairs(data['rel']) do
		if tonumber(b['reltype']) == 4 then
			c = c + 1
		end
	end
	c = c or 1
	for a,b in pairs(data['rel']) do
		if tonumber(b['reltype']) == 4 then
			local area = self.hostWindow:make_area(self.catogaryctrl,"area"..b['id'],"ctrldroplist")
			local w = 100/c
			if c > 0 and c < 100 then
				area:set_style("width:"..tostring(w).."%")
				if area.set_tree_rel_data then
					area:set_tree_rel_data(b)
				end
			end
		end
	end
	self.listctrl:init_top_pos()
	
	self.clsid = self.listctrl:set_tree_rel_clsid(data)
	self:set_inner_data(data)
	
	if not self.needhidesearch and self.searchItem == nil then
		local fname = "searchPanel"..data['id'] -- 创建的名称	
		self.searchItem = self.hostWindow:getSearchPanelTemplete(self.clsid,self.searcharea.content,fname)
		
		if self.seatchItem then
			self.searchItem:set_frame(self)
			local clsdata = gApp:get_class_define_by_id(self.clsid)
			self.searchItem:set_data(data)
		end
		
	end
end



objectdescmulsellistFrame.set_inner_data = function(self,data)
	
--	print('objectdescmulsellistFrame.set_inner_data')
	
	local tb = {}
	tb.attr = {}
	
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
	
	if self.clsid ~= -1 then
		self.listctrl:set_data(self.clsid,tb)	--对象列表
	else
		self.listctrl:set_data(data["id"],tb)	--对象列表
	end
	
	self.navtitle:set_inner_text(data.title)
	self.listctrl:init_top_pos()
	self:updatetick()
	
end


