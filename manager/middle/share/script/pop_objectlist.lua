-- treelist
gr_module("GmBase")

popobjectlistFrame = inherit(GmBase.FrameBase):name("popobjectlistFrame")

popobjectlistFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	
	GmBase.FrameBase.init(self,hostWindow,"pop_objectlistFrame")

	------------------------------------------------------------------------------------- tree_list
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"

	self.listctrl = GmCtrl.ListBase(self,"tree_list",urls)

	self.listctrl.new_item = function(self)
		if table.size(self.hideItem) > 0 then
			for a,b in pairs(self.hideItem) do
				b:set_visible(true)
				self.hideItem[a] = nil
				return b
			end
		end
		local item = self.initItem:copy()
		item["title"] = item:get_child("title")
		item["title"]:set_click( function(self)
																	top.objectdesclistctrl:set_data(self.data['id'])	
																	top:updatetick()	
																end	)
		return item																					
	end	
	
	self.listctrl.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["title"].data = data	
		item["ctrl"]:set_parent(self.listParent)
		item["ctrl"]:set_childs_inner_text(data)
		top:updatetick()
		return item
	end
	self.listctrl.ondatacallback = function(self)
--		print("self.listctrl.ondatacallback = function(self)")
		self.childs.scrollcontainer:set_scroll_pos(-1,0)
		top:updatetick()
	end

	--------------------------------------------------------------------------------------------- objectdesccontent

	
	local urls = {}	
	urls["get"] = g_serverAddress.."objectdesc/objects/page/%d/pagecount/%d/clsid/%d/withattr/1/withrel/1/"
	urls["del"] = g_serverAddress.."objectdesc/delete/id/%d"	
	
	self.objectdesclistctrl = GmCtrl.ListBase(self,"objectdesc_list",urls)

	self.objectdesclistctrl.new_item = function(self)
--		print("self.objectdesclistctrl.new_item 1")
		if table.size(self.hideItem) > 0 then
			for a,b in pairs(self.hideItem) do
				self.hideItem[a] = nil
				return b
			end
		end
		local item = self.initItem:copy()
		item["objecttitle"] = item:get_child("objecttitle")		
		item["objecttitle"]:set_click( function(self)
																	top.hostWindow:hide_popup()
																	top:callback(self.data)
																	self:updatetick()
																end	)
		return item
	end
	
	self.objectdesclistctrl.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["objecttitle"].data = data
		item["ctrl"]:set_childs_inner_text(data)	
		item["ctrl"]:set_parent(self.listParent)
--		print("self.objectdesclistctrl.setitem 1")
		return item
	end


	self.objectdesclistctrl.ondatacallback = function(self)
		self.childs.scrollcontainer:set_scroll_pos(-1,0)
		top:updatetick()
	end

	self:set_visible(false)
 
end




popobjectlistFrame.callback = function(self,data)
end



popobjectlistFrame.set_data = function(self,id)
	if id then	
		self.id = id		
		self.listctrl:clear()		
		if tonumber(id) == 0 then
			self.listctrl:set_data("1")
			self.listctrl:set_visible(true)
		else
			self.listctrl:set_data(id)
			self.listctrl:set_visible(false)
		end		
		self.objectdesclistctrl:set_data(id)		
	end	
end
  

  
