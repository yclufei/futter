



gr_module("GmBase")

poptreelistFrame = inherit(GmBase.FrameBase):name("poptreelistFrame")

poptreelistFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	
	GmBase.FrameBase.init(self,hostWindow,"pop_treelistFrame")

	------------------------------------------------------------------------------------- tree_list
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"

	self.listctrl = {}
	
	for i = 1,5 do
	
		self.listctrl[i] = GmCtrl.ListBase(self,"tree_list_"..i,urls)
		
		self.listctrl[i].level = i
	
		self.listctrl[i].new_item = function(self)
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
																top.listctrl[self.level + 1]:set_data(object.data['id'])
															end	)	
			item["title"]:set_dblclick(function(object) 
																top.hostWindow:hide_popup()
																top:callback(object.data)
																self:updatetick()
															end	)
			return item																					
		end	
		
		self.listctrl[i].setitem = function(self,id,data)
			local item = self.idlist[id]
			item["data"] = data
			item["ctrl"]["title"].data = data
			item["ctrl"]:set_childs_inner_text(data)
			return item
		end
	

	end

	self.listctrl[1].ondatacallback = function(self)
		if tonumber(top.id) == 0 then
			
			
			local item = self.initItem:copy()
			item["title"] = item:get_child("title")
			item["title"]:set_click(function(object) 
																top.listctrl[2]:set_data(object.data['id'])
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



poptreelistFrame.callback = function(self,data)
end


poptreelistFrame.set_data = function(self,id)
	for i = 2,5 do
		self.listctrl[i]:clear()
	end

	if id ~= self.id then
		local top = self
		self.id = id	
		self.listctrl[1]:set_data(id)		
	end
end
