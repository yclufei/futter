
gr_module("GmBase")

categarylistArea = inherit(GmCtrl.ListBase):name("categarylistArea")

categarylistArea.init = function(self,parent,showfirst)

	local top = self
	self.parent = parent
	
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"
		
	GmCtrl.ListBase.init(self,parent,"categarylistarea",urls)
	
	if showfirst == true then
		self.firstitem = self:get_child('firstitem')
		self.firstitem:set_click(function(obj) top:itemclick(top.data) end)
	else
		self.first = self:get_child('firstparent')
		self.first:set_visible(false)
	end
	
end


categarylistArea.datacallback = function(self,a)
	
	if a ~= nil then
		local data = a
		if data["success"] == true then
		
			self.data = data['data']
			
			if self.data then
			
				if table.size(self.idlist) > 0 then
					for a,b in pairs(self.idlist) do
						self:removeItem(b)
					end
				end			
				
				if table.size(data["data"]) > 0 then
					local ctls = {}
					for a,b in GSortedPairs(data["data"]) do
						local d = self:trans_data(b)
						local item = self:additem(a,d)					
						if item then
							table.insert( ctls , item )
						end
					end
	
					for a,b in GIDSortedPairs(ctls) do
						b["ctrl"]:set_visible(true)
					end
	
					for a,b in GSortedPairs(ctls) do
						b["ctrl"]:set_parent(self.listParent)
					end
					local pageinfo = data["pageinfo"]
					if pageinfo then
						self.curPage = pageinfo["page"]
						if self.curPage and tonumber( pageinfo["page"] ) == 1 then
							self:init_top_pos()
						end		
					end
				end
				
			end
			self:ondatacallback()	
		else
				self.data = {}
		end			
	end	
	
end	


categarylistArea.set_click_func = function(self,func)
	self.itemclick = func
end


categarylistArea.init_item = function(self,item)
	local top = self
	item.title = item:get_child('title')
	item.title:set_mousedown(self.itemclick)
end	


categarylistArea.set_data = function(self,data)
	if data.id then
		self.data = data
		GmCtrl.ListBase.set_data(self,data['id'])
	end
end


categarylistArea.setitem = function(self,id,data)
	local item = self.idlist[id]
	item["data"] = data
	item["ctrl"].title.data = data
	item["ctrl"]:set_childs_inner_text(data)
	return item
end	
