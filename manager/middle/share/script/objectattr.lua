

-- 对象属性
gr_module("GmManager")
objectattrFrame = inherit(GmBase.FrameBase):name("objectattrFrame")
objectattrFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectattrFrame")
	
	self.curPage = 0
	self.curPageCount = 0

	-- subnav	
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
 	
	-- objectattrcontent
	self:addJumpLink("objectattraddFrame")
   
	------------------------------------------------------------------------------------- objectattr_list
	
	
	local listctrl = self:get_child("objectattr_list")
	
	listctrl.tmpurl = g_serverAddress.."objectattr/objects/page/%d/pagecount/%d"
	
	self.curPage = 1
	self.curPageCount = 10
	listctrl.childs = {}	
	
	listctrl.childs.scrollcontainer = listctrl:get_child("scrolllist")
	
												
	listctrl.show = function(self,show,draw,pos)
		if show then
			listctrl.childs.scrollcontainer:set_scroll_pos(-1,110)
		end
		GmBase.FrameBase.show(self,show,draw,pos)
	end
	listctrl.listParent = listctrl:get_child("sbwhlist")
	listctrl.initItem = listctrl.listParent:get_child_by_sort(0)
	
	self.ssfunc = function(a)		
		if a ~= nil then
			local data = a		
			if data["success"] == true then				
				local pageinfo = data["pageinfo"]				
				if pageinfo == nil or ( pageinfo ~= nil and pageinfo["page"] == 1 ) then
					if table.size(listctrl.idlist)>0 then
						for a,b in pairs(listctrl.idlist) do
							top:removeItem(b)
						end
					end
				end								
				local ctls = {}
				for a,b in GSortedPairs(data["data"]) do
					local item = listctrl:additem(a,b)
					table.insert( ctls , item )
				end				
				for a,b in GSortedPairs(ctls) do
					b["ctrl"]:set_parent(listctrl.listParent)
				end				
				local pageinfo = data["pageinfo"]
				top.curPage = pageinfo["page"]
				if pageinfo["page"] == 1 then
					listctrl.childs.scrollcontainer:set_scroll_pos(-1,110)
				end				
			else
				print("获取数据失败")
			end		
		end
	end
	
	listctrl.idlist = {}
	listctrl.setitem = function(self,id,data)
		local top = self
		local item = listctrl.idlist[id]
		item["data"] = data
		item["ctrl"]:set_childs_inner_text(data)
		item["ctrl"]:set_parent(listctrl.listParent)
		item["ctrl"]:set_visible(true)
		return item
	end
	
	listctrl.additem = function(self,id,data)
		local top = self	
		local item = nil	
		local id = data["id"]
		if listctrl.idlist[id] ~= nil then
			listctrl.idlist[id] = listctrl:setitem(id,data)
			return listctrl.idlist[id]
		else
			item = {}
		end			
		item["data"] = data	
		item["ctrl"] = top:new_item()
		item["ctrl"]:set_attr("id","id"..id)				
		item["ctrl"]["deletebt"] = item["ctrl"]:get_child("deletebt")
		item["ctrl"]["deletebt"]:set_click( function() 
																					listctrl:delitem(id)
																				end	)			
		item["ctrl"]["detailbt"] = item["ctrl"]:get_child("detailbt")
		item["ctrl"]["detailbt"]:set_click( function() top.hostWindow:addNavFrame("objectattrselectFrame") end	)			
		item["ctrl"]["updatebt"] = item["ctrl"]:get_child("updatebt")
		item["ctrl"]["updatebt"]:set_click( function() top.hostWindow:addNavFrame("objectattrupdateFrame") end	)	
		item["ctrl"]:set_childs_inner_text(data)		
		item["ctrl"]:set_visible(true)
		listctrl.idlist[id] = item
		return item				
	end
		
	listctrl.deletecallback = function(d)
		local key = d["data"]
		local item = listctrl.idlist[key]
		item["ctrl"]:set_visible(false)
		listctrl:updatetick()
	end
	
	listctrl.delitem = function(self,id)
		local url = g_serverAddress.."objectattr/delete/id/"..id
		top:curl(url,listctrl.deletecallback)
	end
	local url = string.format( listctrl.tmpurl ,self.curPage,self.curPageCount)
	
	self.listctrl = listctrl
		
 	self.hideItem = {}
 		
	self.new_item = function(self)
		if table.size(self.hideItem)>0 then
			for a,b in pairs(self.hideItem) do
				b:set_visible(true)
				self.hideItem[a] = nil
				return b
			end
		end
		return self.listctrl.initItem:copy()	
	end
		
	self.removeItem = function(self,item)
		local id = item['data']['id']
		item["ctrl"]:set_visible(false)
		top.listctrl.idlist[id] = nil
		self.hideItem[id] = item["ctrl"]
	end
	  
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
   
end
  
objectattrFrame.set_data = function(self,data)

end
  
