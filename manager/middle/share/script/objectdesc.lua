

-- 对象
gr_module("GmManager")
objectdescFrame = inherit(GmBase.FrameBase):name("objectdescFrame")
objectdescFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectdescFrame")
	--aprint("objectdesc")
	
   	
	-- subnav	
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
 	
	-- objectdesccontent
  self.ctrls["jumpobjectdescadd"] = self:get_child("jumpobjectdescaddFrame")
	self.ctrls["jumpobjectdescadd"]:set_click(function(self)
		local frame = top.hostWindow:addNavFrame("objectdescaddFrame")
		if frame and frame.set_data then
			frame:set_data(top.objectdesclistctrl.data)
		end
	end)
	------------------------------------------------------------------------------------- objectdesc_list
	
	
	
	self.objectdesclistctrl = self:get_child("objectdesc_list")
--	self.objectdesclistctrl:set_use_cache(true)	
	self.objectdesclistctrl.tmpurl = g_serverAddress.."objectdesc/objects/page/%d/pagecount/%d/clsid/%d/withattr/1/withrel/1/"
	
	self.objectdesclistctrl.curPage = 1
	self.objectdesclistctrl.curPageCount = 10
	self.objectdesclistctrl.childs = {}	
	
	self.objectdesclistctrl.childs.scrollcontainer = self.objectdesclistctrl:get_child("scrolllist")
		
	self.objectdesclistctrl.show = function(self,show,draw,pos)
		if show then
			self.objectdesclistctrl.childs.scrollcontainer:set_scroll_pos(-1,110)
		end
		GmBase.FrameBase.show(self,show,draw,pos)
	end
	self.objectdesclistctrl.listParent = self.objectdesclistctrl:get_child("sbwhlist")
--	self.objectdesclistctrl.listParent:set_use_cache(true)
	self.objectdesclistctrl.initItem = self.objectdesclistctrl.listParent:get_child("inititem")
	
	self.ssfunc = function(a)		
		if a ~= nil then
			local data = a		
			if data["success"] == true then
			
				local pageinfo = data["pageinfo"]				
				if pageinfo == nil or ( pageinfo ~= nil and pageinfo["page"] == 1 ) then
					if table.size(self.objectdesclistctrl.idlist)>0 then
						for a,b in pairs(self.objectdesclistctrl.idlist) do
							top:removeItem(b["ctrl"])
						end
					end
				end				
				if data["data"] then
					local ctls = {}
					for a,b in GSortedPairs(data["data"]) do
						local item = self.objectdesclistctrl:additem(a,b)
						table.insert( ctls , item )
					end
					for a,b in GSortedPairs(ctls) do
						b["ctrl"]:set_parent(self.objectdesclistctrl.listParent)
					end			
					local pageinfo = data["pageinfo"]
					top.curPage = pageinfo["page"]
					if pageinfo["page"] == 1 then
						self.objectdesclistctrl.childs.scrollcontainer:set_scroll_pos(-1,110)
					end
				end	
			else
				print("获取数据失败")
			end		
		end
	end
	
	self.objectdesclistctrl.idlist = {}
	
	self.objectdesclistctrl.setitem = function(self,id,data)
		local item = self.objectdesclistctrl.idlist[id]
		item["data"] = data
		item["ctrl"]:set_childs_inner_text(data)
		item["ctrl"]:set_parent(self.objectdesclistctrl.listParent)
		item["ctrl"]:set_visible(true)
		return item
	end
	
	self.objectdesclistctrl.additem = function(self,id,data)
		local item = nil	
		local id = data["id"]
		if self.objectdesclistctrl.idlist[id] ~= nil then
			self.objectdesclistctrl.idlist[id] = self.objectdesclistctrl:setitem(id,data)
			return self.objectdesclistctrl.idlist[id]
		else
			item = {}
		end	
		
		item["data"] = data	
		item["ctrl"] = top.objectdesclistctrl:new_item()
		item["ctrl"]:set_attr("id","id"..id)
		item["ctrl"]["updatebt"] = item["ctrl"]:get_child("updatebt")
		item["ctrl"]["updatebt"]:set_click( function()
			local frame = top.hostWindow:addNavFrame("objectdescupdateFrame")
			if frame and frame.set_data then
				frame:set_data(data)
			end				
		end	)	

		item["ctrl"]:set_childs_inner_text(data)
		
		item["ctrl"]:set_visible(true)
		self.objectdesclistctrl.idlist[id] = item
--		item["ctrl"]:set_use_cache(true)
		
		return item
				
	end
		
	self.objectdesclistctrl.deletecallback = function(d)
		local key = d["data"]
		local item = self.objectdesclistctrl.idlist[key]
		item["ctrl"]:set_visible(false)
		self.objectdesclistctrl:updatetick()
	end
	
	self.objectdesclistctrl.delitem = function(self,id)
		local url = g_serverAddress.."objectdesc/delete/id/"..id
		top:curl(url,self.objectdesclistctrl.deletecallback)
	end
	
 	self.objectdesclistctrl.hideItem = {}
 		
	self.objectdesclistctrl.new_item = function(self)
		if table.size(self.objectdesclistctrl.hideItem)>0 then
			for a,b in pairs(self.objectdesclistctrl.hideItem) do
--				print("newItem",a,b)
				self.objectdesclistctrl.hideItem[a] = nil
				return b
			end
		end
		return self.objectdesclistctrl.initItem:copy()	
	end
		
	self.objectdesclistctrl.removeItem = function(self,item)
		item:set_visible(false)
		table.insert(self.objectdesclistctrl.hideItem,item)
	end

	local url = string.format( self.objectdesclistctrl.tmpurl ,self.objectdesclistctrl.curPage,self.objectdesclistctrl.curPageCount, 0)
	self:curl(url,self.ssfunc)	
	
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")

end
  
objectdescFrame.set_data = function(self,data)
	self.objectdesclistctrl.data = data
	self.objectdesclistctrl.curPage = 1
	local url = string.format( self.objectdesclistctrl.tmpurl , self.objectdesclistctrl.curPage ,self.objectdesclistctrl.curPageCount , data["id"])
	self:curl(url,self.objectdesclistctrl.ssfunc)
end
  
