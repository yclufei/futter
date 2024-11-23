



gr_module("GmBase")

poplistFrame = inherit(GmBase.FrameBase):name("poplistFrame")

poplistFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	
	GmBase.FrameBase.init(self,hostWindow,"pop_listFrame")

	------------------------------------------------------------------------------------- tree_list
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"

	
	
		self.listctrl = GmCtrl.ListBase(self,"tree_list",urls)
		
		self.listctrl.level = i
	
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
			item["title"]:set_click(function(object) 
																table.print(object.data )
																top.hostWindow:hide_popup()
																top:callback(object.data)
																self:updatetick()
															end	)	
			item["title"]:set_dblclick(function(object) 
																top.hostWindow:hide_popup()
																top:callback(object.data)
																self:updatetick()
															end	)
			return item																					
		end	
		
		self.listctrl.setitem = function(self,id,data)
			local item = self.idlist[id]
			item["data"] = data
			item["ctrl"]["title"].data = data
			item["ctrl"]:set_childs_inner_text(data)
			return item
		end
	
 

	self.listctrl.ondatacallback = function(self)
		if tonumber(top.id) == 0 then
			
			
			local item = self.initItem:copy()
			item["title"] = item:get_child("title")
			item["title"]:set_click(function(object) 
																top.hostWindow:hide_popup()
																top:callback(object.data)
																self:updatetick()
															end	)	
			item["title"]:set_dblclick(function(object) 
																top.hostWindow:hide_popup()
																top:callback(object.data)
																self:updatetick()
															end	)
			local mydata = {}		
			mydata['parent_id'] = "0"
			mydata['title'] = "树节点"
			mydata['id'] = "0"
			

			local dataitem = {}
			dataitem["ctrl"] = item
			dataitem["ctrl"]["title"].data = mydata
			dataitem["ctrl"]["data"] = mydata
			dataitem["data"] = mydata
			dataitem["ctrl"]:set_childs_inner_text(dataitem["ctrl"]["title"].data)			
			dataitem["ctrl"]:set_parent(self.listParent)
			self.idlist["0"] = dataitem
		end	
		self:updatetick()
	end
	--------------------------------------------------------------------------------------------- objectdesccontent

 	self:set_visible(false)
 	
end



poplistFrame.callback = function(self,data)
--	table.print(data)
end


poplistFrame.set_data = function(self,data) 
	self.listctrl:clear()
	local newtb = {}
	newtb['success'] = true
	newtb['data'] = {}
	for a,b in pairs(data) do
			newtb['data'][a] = {}
			newtb['data'][a]['id'] = a
			newtb['data'][a]['title'] = b
	end
	self.listctrl:datacallback(newtb)
end
