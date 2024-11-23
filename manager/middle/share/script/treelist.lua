-- treelist
gr_module("GmManager")

treelistFrame = inherit(GmBase.FrameBase):name("treelistFrame")

treelistFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"treelistFrame")

	-- subnav	    
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
														top.hostWindow:delTopNavFrame()
													end)
   	
	-- treelistcontent
	self.jumptreeadd = self:get_child("jumptreeaddFrame")
	self.jumptreeadd:set_click(	function(self)
																local ttop = top
																top.hostWindow:addNavFrame("treeaddFrame",nil,function(frame) frame:set_data(ttop.data) end)
																
															end)
  
  
	------------------------------------------------------------------------------------- tree_list
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"

	self.listctrl = GmCtrl.ListBase(self,"tree_list",urls)
	
	self.listctrl.trans_data = function(self,data)
		data['sitemtypestr'] = CONST_TREE_TYPE[ data['itemtype'] ]
		data['sitemsubtypestr'] = CONST_TREE_SUBTYPE[ data['itemsubtype'] ]	
			
		return data
	end
	
	self.listctrl.init_item = function(self,item)
		item["deletebt"] = item:get_child("deletebt")
		item["deletebt"]:set_click( function(object) 
																	self:delitem(object.data['id'])
																end	)
		item["updatebt"] = item:get_child("updatebt")
		item["updatebt"]:set_click( function(object) 
																	local frame = top.hostWindow:addNavFrame("treeupdateFrame")
																	frame:set_data(object.data)
																end	)	
		item["childbt"] = item:get_child("childbt")		
		item["childbt"]:set_click( function(self)
																	top.hostWindow:addNavFrame("treelistFrame",nil,function(frame) frame:set_data(obj.data) end)
																end	)
	end

	self.listctrl.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]["childbt"].data = data
		item["ctrl"]:set_childs_inner_text(data)
		return item
	end

	--------------------------------------------------------------------------------------------- objectdesccontent
	
  self.ctrls["jumpobjectdescadd"] = self:get_child("jumpobjectdescaddFrame")
	self.ctrls["jumpobjectdescadd"]:set_click(function(self)
																							local frame = top.hostWindow:addNavFrame("objectdescaddFrame")
																							if frame and frame.set_data then
																								frame:set_data(top.data)
																							end
																						end)

	----------------------------------------------------------------------
	
	local urls = {}	
	urls["get"] = g_serverAddress.."objectdesc/objects/page/%d/pagecount/%d/clsid/%d/withattr/1/withrel/1/"
	urls["del"] = g_serverAddress.."objectdesc/delete/id/%d"	
	
	self.objectdesclistctrl = GmCtrl.ListBase(self,"objectdesc_list",urls)

	self.objectdesclistctrl.trans_data = function(self,b)
		if b['clsid'] == '0' then
			b['clsidstr'] = "tree"
		else
			local obj = gApp:get_object("0",b['clsid'])
			if obj then
				b['clsidstr'] = obj['title']
			end
		end			
		return b
	end
	
	self.objectdesclistctrl.new_item = function(self)
		if table.size(self.hideItem) > 0 then
			for a,b in pairs(self.hideItem) do
				self.hideItem[a] = nil
				return b
			end
		end
		local item = self.initItem:copy()
		item["updatebt"] = item:get_child("updatebt")		
		item["updatebt"]:set_click( function(self)
																	(top.hostWindow:addNavFrame("objectdescupdateFrame")):set_data(self.data)
																end	)
																
																
		return item
	end
	
	self.objectdesclistctrl.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]:set_childs_inner_text(data)	
		item["ctrl"]:set_parent(self.listParent)
		return item
	end


	self.objectdesclistctrl.set_rel_data = function(self,id)	
		local tmpurl = g_serverAddress.."objectdesc/get_objects_by_tree_rel/page/%d/pagecount/%d/treeid/%d/withattr/1/withrel/1/"
		local url = string.format( tmpurl ,self.curPage,self.curPageCount,id)
		self:curl(url,function(a) self:datacallback(a) end)	
	end
		
	self.navtitle = self:get_child("navtitle")
 
end



treelistFrame.update_item = function(self,data)
--	table.print(data)
end


treelistFrame.set_data = function(self,data)

	if data and data['title'] then
		
		self.data = data		
		self.navtitle:set_inner_text(data['title'])	
		
		if data['itemtype'] == '0' then --类定义
			self.objectdesclistctrl:set_data(data["id"])
		elseif data['itemtype'] == '1' then --栏目页面
			self.objectdesclistctrl:set_rel_data(data["id"])
		else --对象分类
			self.objectdesclistctrl:set_rel_data(data["id"])
		end
		
		self.listctrl:set_data(data["id"])
				
	end
end
  

  
