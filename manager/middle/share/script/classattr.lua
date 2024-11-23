
-- 类属性
gr_module("GmManager")

classattrFrame = inherit(GmBase.FrameBase):name("classattrFrame")

classattrFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	
	GmBase.FrameBase.init(self,hostWindow,"classattrFrame")


	----------------------------------------------------------------- tree_update
	-- 节点信息
	local updatectrl = self:get_child("tree_update")
	updatectrl.childs = {}		
	
	self.treetype = nil
	self.treesubtype = nil
		
	updatectrl.childs["itemsubtype"] = updatectrl:get_child("itemsubtype")
	updatectrl.childs["itemsubtype"]:set_click(function(self) 
																					local frame = top.hostWindow:show_popup("poplistFrame",CONST_TREE_SUBTYPE) 
																					frame.callback = function(frame,data)
																						top.treesubtype = data
																						self:set_text(data['title'])
																						top:updatetick(true)
																					end
																				end)
	
	updatectrl.childs["itemtype"] = updatectrl:get_child("itemtype")
	updatectrl.childs["itemtype"]:set_click(function(self) 
																					local frame = top.hostWindow:show_popup("poplistFrame",CONST_TREE_TYPE) 
																					frame.callback = function(frame,data)
																						top.treetype = data
																						self:set_text(data['title'])
																						top:updatetick(true)
																					end
																				end)
																				
	
	updatectrl.childs["parent_id"] = updatectrl:get_child("parent_id")
	updatectrl.childs["parent_id"]:set_click(function(self) 
	print("#############")
																					local frame = top.hostWindow:show_popup("poptreelistFrame","0") 
																					frame.callback = function(frame,data)
																						self:set_text(data['id'])
																					end
																				end)
			
	updatectrl.childs["sort"] = updatectrl:get_child("sort")		
	
																							
	updatectrl.childs["title"] = updatectrl:get_child("title")		
	updatectrl.childs["id"] = updatectrl:get_child("id")		
	updatectrl.childs["name"] = updatectrl:get_child("name")

	updatectrl.ssfuncupdate = function(a)
		if a ~= nil then
			local data = a["data"]
			updatectrl:set_childs_inner_text(data)	
				
			local k = data["itemtype"]
			top.treetype = {}
			top.treetype.id = k
			top.ctrls["treeinfo"].childs["itemtype"]:set_text(CONST_TREE_TYPE[k])
			
			local k2 = data["itemsubtype"]
			top.treesubtype = {}
			top.treesubtype.id = k2
			top.ctrls["treeinfo"].childs["itemsubtype"]:set_text(CONST_TREE_SUBTYPE[k2])
--			table.print(a)
			top:updatetick(true)
		end
	end	
	
	-- 修改按钮
	updatectrl.childs["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl.childs["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."tree/update/"		
						url = url.."itemtype/"..top.treetype.id.."/"						
						url = url.."itemsubtype/"..top.treesubtype.id.."/"							
						url = url.."sort/"..encodeURI( updatectrl.childs["sort"]:get_text() ).."/"							
						url = url.."parent_id/"..encodeURI( updatectrl.childs["parent_id"]:get_text() ).."/"							
						url = url.."title/"..encodeURI( updatectrl.childs["title"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"							
						url = url.."name/"..encodeURI( updatectrl.childs["name"]:get_text() ).."/"
						print(url)
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["treeinfo"] = updatectrl
														
	------------------------------------------------------------------------ relation_list

	-- 添加对象
  self.ctrls["jumpobjectdescadd"] = self:get_child("jumpobjectdescaddFrame")
	self.ctrls["jumpobjectdescadd"]:set_click(function(self)
																							local frame = top.hostWindow:addNavFrame("objectdescaddFrame")
																							if frame and frame.set_data then
																								-- 如果是栏目，要拿属性的clsid
																								frame:set_data(top.data)
																							end
																						end)

	------------------------------------------------------------------------ relation_list
	
	-- 关联列表
	self.relationlist = GmManager.relationListArea(self)
	
	------------------------------------------------------------------------------------- classattr_list
	
	-- 属性列表
	self.attrlist = GmManager.attributeListArea(self)
																							
	------------------------------------------------------------------------------------------------------------------
	-- 对象列表																							
	local urls = {}	
	urls["get"] = g_serverAddress.."objectdesc/objects/page/%d/pagecount/%d/clsid/%d/withattr/1/withrel/1/"
	urls["del"] = g_serverAddress.."objectdesc/delete/id/%d"	
	
	self.objectlist = GmCtrl.ListBase(self,"objectdesc_list",urls)

	self.objectlist.ondatacallback = function(self)
		self:updatetick()
	end


	self.objectlist.trans_data = function(self,b)
		if b['clsid'] == '0' then
			b['clsidstr'] = "tree"
		else
			local obj = gApp:get_object("0",b['clsid'])
			if obj then
				b['clsidstr'] = b['clsid'].." "..( obj['title'] or "")
			end
		end			
		return b
	end
	
	self.objectlist.new_item = function(self)
	
		if table.size(self.hideItem) > 0 then
			for a,b in pairs(self.hideItem) do
				self.hideItem[a] = nil
				return b
			end
		end
		
		local item = self.initItem:copy()
		
		item["deletebt"] = item:get_child("deletebt")		
		item["deletebt"]:set_click( function(button)
																	self:delitem(button.data.id)
																end	)
		item["updatebt"] = item:get_child("updatebt")		
		item["updatebt"]:set_click( function(button)
																	local frmae = top.hostWindow:get_frame('objectdescupdateFrame')
																	frmae:set_data(button.data) 
																	top.hostWindow:addNavFrame("objectdescupdateFrame" )
																end	)
		return item
	end
	
	self.objectlist.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]:set_childs_inner_text(data)	
		item["ctrl"]:set_parent(self.listParent)
		return item
	end

	self.objectlist.set_rel_data = function(self,id)	
		local tmpurl = g_serverAddress.."objectdesc/get_objects_by_tree_rel/page/%d/pagecount/%d/treeid/%d/withattr/1/withrel/1/"
		local url = string.format( tmpurl ,self.curPage,self.curPageCount,id)
		self:curl(url,function(a) self:datacallback(a) end)	
	end
	
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
	
	self.needupdate = false
		
		
		
		
---------------------------------------------------------------------



	self.tabbar = self:get_child("tabbar")
	self.tab_button_object = self:get_child("tab_button_object")
	self.tab_button_attr = self:get_child("tab_button_attr")	
	self.attr_list = self:get_child("attr_list")
	
	
	
	self.tab_button_object:set_click(function(button) 
	
		top.tab_button_object:set_style("background-color:#999999;color:#ffffff")
		top.tab_button_attr:set_style("background-color:#dddddd;color:#000000")
		
		top.objectlist:set_visible(true)
		top.attr_list:set_visible(false)
		
		top:updatetick()
	end)
	
	
	self.tab_button_attr:set_click(function(button) 
	
		top.tab_button_attr:set_style("background-color:#999999;color:#ffffff")
		top.tab_button_object:set_style("background-color:#dddddd;color:#000000")
		
		top.attr_list:set_visible(true)
		top.objectlist:set_visible(false)

		top:updatetick()
	end)
	
end


 
classattrFrame.set_data = function(self,data)
	print("classattrFrame.set_data",data)
	data['clsid'] = 0	
	self.needupdate = true
	self.data = data
	
	self.objectlist:clear()
	
	self.relationlist:clear()
	self.attrlist:clear()
	
	
	
		
	self.ctrls["treeinfo"]:set_childs_inner_text(data)
	
--	table.print(data)
	
	local k = data["itemtype"]
	self.treetype = {}
	self.treetype.id = k
	self.ctrls["treeinfo"].childs["itemtype"]:set_text(CONST_TREE_TYPE[k])
	
	
	local k2 = data["itemsubtype"]
	self.treesubtype = {}
	self.treesubtype.id = k2
	self.ctrls["treeinfo"].childs["itemsubtype"]:set_text(CONST_TREE_SUBTYPE[k2])
	
	
	
	
	self.attrlist:set_data(data)
	self.relationlist:set_data(data)
	self.tabbar:set_visible(true)
	if tonumber(data['itemtype'])== 0 then --类定义,直接取数据
		self.objectlist:set_visible(true)
		self.objectlist:set_data(data["id"])
	elseif data['itemtype'] == '1' then --栏目页面,取 clsid 再取数据
		self.objectlist:set_visible(true)
		self.objectlist:set_rel_data(data["id"])
	else --对象分类没有对象列表，得隐藏起来
		self.objectlist:set_visible(false)
		self.tabbar:set_visible(false)
	end
	
	self:updatetick(true)
end
  

  
  
