
-- ����
gr_module("GmBase")

objectFrame = inherit(GmBase.FrameBase):name("objectFrame")

objectFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_objectFrame")

	self:init_back_button()
	------------------------------------------------------------------------------------- objectattr_list
	
	self.emptyattr = {["id"] = "",
										["title"] = "", 
										["value"] = "",              
										["name"] =  "",             
										["valuetype" ]= "",             
										["attrid"] = "",             
										["length"] = "",       
										["clsid"] = "",  
										["valueid"] = "" }

	local listctrl = self:get_child("objectattr_list")
--	listctrl:set_use_cache(true)
	listctrl.tmpurl = g_serverAddress.."objectattr/objects/page/1/pagecount/100/clsid/%d/objectid/%d"	
	listctrl.childs = {}	
	listctrl.childs.scrollcontainer = listctrl:get_child("scrolllist")
--	listctrl.childs.scrollcontainer:set_use_cache(true)
	listctrl.childs.scrollcontainer:set_scroll_container(true)	
	listctrl.show = function(self,show,draw,pos)
		if show then
			listctrl.childs.scrollcontainer:set_scroll_pos(-1,110 * gInfo['retina'])
		end
		GmBase.FrameBase.show(self,show,draw,pos)
	end
	listctrl.listParent = listctrl:get_child("sbwhlist")
	listctrl.initItem = listctrl:get_child("inititem")	 
   
	self.ssfunc = function(a)		
		if a ~= nil then
			local data = a		
			if data["success"] == true then
				if table.size(listctrl.idlist) > 0 then
					for a,b in pairs(listctrl.idlist) do
						top:removeItem(b["ctrl"])
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
				listctrl.childs.scrollcontainer:set_scroll_pos(-1,110 * gInfo['retina'])
				self:updatetick()
			else
				print("��ȡ���ʧ��")
			end		
		end
	end
	
	listctrl.idlist = {}
	
	listctrl.setitem = function(self,id,data)
		local item = listctrl.idlist[id]
		item["data"] = data
		item["ctrl"]:set_childs_inner_text(data)
		item["ctrl"]:set_parent(listctrl.listParent)
		item["ctrl"]:set_visible(true)
		return item
	end
	
	listctrl.attrcallback = function(a)
		local data = a
		if data and data['success'] then
			local itemdata = data['data']
			local id = itemdata['attrid']
			local ctrlparent = listctrl.idlist['id']
			if ctrlparent then
				local ctrl = ctrlparent['ctrl']
				ctrl:set_childs_inner_text(itemdata)
			end			
		end
	end
	
	listctrl.additem = function(self,id,data)
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
		item["ctrl"].idctrl = item['ctrl']:get_child("value")
		item["ctrl"]:set_attr("id","id"..id)				
																			 
		item["ctrl"]:set_childs_inner_text(data)	
		item["ctrl"]:set_visible(true)
		listctrl.idlist[id] = item
		--item["ctrl"]:set_use_cache(true)		
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
	
	self.listctrl = listctrl
	
 	self.hideItem = {}
 		
	self.new_item = function(self)
		if table.size(self.hideItem)> 0 then
			for a,b in pairs(self.hideItem) do
				self.hideItem[a] = nil
				b:set_visible(true)
				b:set_childs_inner_text(top.emptyattr)
				return b
			end
		end
		return self.listctrl.initItem:copy()	
	end
		
	self.removeItem = function(self,item)	
		item:set_childs_inner_text(top.emptyattr)
		item:set_style("display:none")
		table.insert(self.hideItem,item)
	end
		
   
	----------------------------------------------------------------- objectdesc_update
	
	local updatectrl = self:get_child("objectdesc_update")
	updatectrl.childs = {}
	updatectrl.childs["create_time"] = updatectrl:get_child("create_time")		
	updatectrl.childs["objectname"] = updatectrl:get_child("objectname")		
	updatectrl.childs["id"] = updatectrl:get_child("id")		
	updatectrl.childs["objecttitle"] = updatectrl:get_child("objecttitle")		
	updatectrl.childs["clsid"] = updatectrl:get_child("clsid")	
	updatectrl.setdata = function(data)			
		updatectrl.childs["create_time"]:set_text(data["create_time"]) 			
		updatectrl.childs["objectname"]:set_text(data["objectname"]) 			
		updatectrl.childs["id"]:set_text(data["id"]) 			
		updatectrl.childs["objecttitle"]:set_text(data["objecttitle"]) 			
		updatectrl.childs["clsid"]:set_text(data["clsid"]) 			
	end	
	updatectrl.ssfunc = function(a)
		if a ~= nil then
			local data = a["data"]
			updatectrl.setdata(data)		
		end
	end	
	updatectrl.ssfuncupdate = function(a)
		if a ~= nil then
			local data = a["data"]
			updatectrl.setdata(data)		
		end
	end	

	self.ctrls["objectdesc"] = updatectrl	
	local url = g_serverAddress.."objectdesc/object/id/1"
	self:curl(url,top.ssfunc)
 
	--self.relationctrl = GmBase.objectRelationListArea(hostWindow)
		
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
   
end
  
  
  
objectFrame.set_data = function(self,data)
	local top = self	
	self.data = data
	self.ctrls["objectdesc"].setdata(data)
	local url = string.format( self.listctrl.tmpurl ,data["clsid"],data["id"])
	self:curl(url,self.ssfunc)	
	self.relationctrl:set_data(data)		
end
  

objectFrame.set_catogary = function(self,oid2)
	self.oid2 = oid2
end
