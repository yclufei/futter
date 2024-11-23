
-- 帖子分类
gr_module("GmBase")

objectcategoryFrame = inherit(GmBase.FrameBase):name("objectcategoryFrame")

objectcategoryFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_objectcategoryFrame")

	self:init_back_button()
  
	------------------------------------------------------------------------------------- objectdesc_list
	
	self.childs = {}	
	
	self.scrollcontainer = self:get_child("scrolllist")
	
	self.hiddenParent  = self:get_child("hiddenParent")
	
	self.initItem = self.hiddenParent:get_child_by_sort(0)
	
	self.ssfunc = function(a)
		
		if a ~= nil then
		
			local data = a
			if data["success"] == true then
			
				local sortarray = {}
				
				for a,b in GSortedPairs(data["data"]) do
					local sort = tonumber( b["sort"] )
					if sortarray[ sort ] == nil then
						sortarray[ sort ] = {}
					end
					sortarray[ sort ][ a ] = b
				end
				
				local lastitem = nil
				
				local ctls = {}
				for a,b in GSortedPairs(sortarray) do
					for idkey,itemdata in GSortedPairs(b) do
						local item = top:additem(idkey,itemdata)
						table.insert( ctls , item )
						lastitem = item["ctrl"]
					end
					lastitem:set_style("margin-bottom:25px;")
				end
				
				for a,b in GSortedPairs(ctls) do
					b["ctrl"]:set_parent(top.scrollcontainer)
				end

				top:updatetick()
			else
				print("获取数据失败")
			end		
		end
	end
	
	self.idlist = {}

	self.setitem = function(self,id,data)
		local item = top.idlist[id]
		item["data"] = data
		item["ctrl"]:set_childs_inner_text(data)
		item["ctrl"]:set_parent(top.scrollcontainer)
		item["ctrl"]:set_visible(true)
		item["ctrl"]:set_style("height:36px;")
		return item
	end
	
	self.additem = function(self,id,data)
		local item = nil	
		local id = data["id"]
		if top.idlist[id] ~= nil then
			top.idlist[id] = top:setitem(id,data)
			return top.idlist[id]
		else
			item = {}
		end
		item["data"] = data	
		item["ctrl"] = top.initItem:copy()	
		item["ctrl"].title = item["ctrl"]:get_child("title")	
		item["ctrl"].title:set_click(	function(ctrl)
															local frame = top.hostWindow:addNavFrame("objectlistFrame") 
															frame:set_data(data)
															if innerdata then
																frame:set_inner_data(innerdata) 
															end
														end)
		
		
		item["ctrl"]:set_attr("id","id"..id)
		item["ctrl"]:set_childs_inner_text(data)
		top.idlist[id] = item
		return item
	end
	

	self.listctrl = listctrl
	self.navtitle = self:get_child('navtitle')
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")

end
  

objectcategoryFrame.set_data = function(self,data)
	self.navtitle:set_inner_text(data.title)
	
	local tmpurl = g_serverAddress.."tree/objects/parent_id/%d/withattr/1/withrel/1/"
	
	local url = string.format( tmpurl , data.id)
	self:curl(url,self.ssfunc)	
end
