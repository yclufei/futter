
-- 对象
gr_module("GmManager")

objectdescupdateFrame = inherit(GmBase.FrameBase):name("objectdescupdateFrame")

objectdescupdateFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectdescupdateFrame")
	
	-- subnav	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)


	self:init_back_button()
  
 	
	-- objectdescupdatecontent
	------------------------------------------------------------------------------------- 属性列表
	-- 更新属性
	self.emptyattr = {["id"] = "",
										["title"] = "", 
										["value"] = "",              
										["name"] =  "",             
										["valuetype" ]= "",             
										["attrid"] = "",             
										["length"] = "",       
										["clsid"] = "",  
										["valueid"] = "" }

	local urls = {}	
	urls["get"] = g_serverAddress.."objectattr/objects/page/%d/pagecount/%d/clsid/%d/objectid/%d"	
	urls["del"] = g_serverAddress.."objectattr/delete/id/%d"
	
	self.listctrl = GmCtrl.ListBase(self,"objectdescupdatecontent",urls)		
	self.listctrl.attrcallback = function(a)
	end
	self.listctrl.trans_data = function(self,b)
		b["valuetypestr"] = CONST_VALUETYPE[b["valuetype"]]
		
		if b['clsid'] == '0' then
			b['clsidstr'] = CONST_TREE
		else
			local obj = gApp:get_object("0",b['clsid'])
			if obj then
				b['clsidstr'] = obj['title']
			end
		end
		
		if b["valuetype"] == "4" or b["valuetype"] == "5" then
			b['filevalue'] = b['value']
		end
		
		return b
	end	
	self.listctrl.init_item = function(self,item)
		item.value = item:get_child("value")
		item.filevalue = item:get_child("filevalue")
		item.imagevalue = item:get_child("imagevalue")
		
		item["updatebt"] = item:get_child("updatebt")	
		item["updatebt"]:set_click( function(self)
																	local str = g_serverAddress.."objectattr/update/objectid/%d/attrid/%d/valuetype/%d/clsid/%d/value/%s"
																	local url = string.format( str , top.data['id']
																																	, self.data['id']
																																	, self.data['valuetype']
																																	, self.data['clsid']
																																	,encodeURI2(item.value:get_text()) )
																																	print(url)
																	self:curl(url,top.listctrl.attrcallback)
																end)	
	end

	self.listctrl.setitem = function(self,id,data)
	
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["updatebt"].data = data	
				
		--[[
		item["ctrl"].value:set_text("")
		
			
		item["ctrl"]:set_childs_inner_text(data)
		
		if data["valuetype"] == "4" then
			item["ctrl"].value:set_visible(true)
			item["ctrl"].filevalue:set_visible(false)
			item["ctrl"].imagevalue:set_visible(true)			
			item["ctrl"].value:set_text(data['value'])
			local src = "http://120.25.242.195:7890/public/upload/middle/"..data['value']
			item["ctrl"].imagevalue:set_src(src)			
		elseif data["valuetype"] == "5" then
			item["ctrl"].value:set_visible(false)
			item["ctrl"].filevalue:set_visible(true)
			item["ctrl"].imagevalue:set_visible(false)			
			item["ctrl"].filevalue:set_text(data['value'])			
		else
			item["ctrl"].value:set_visible(true)
			item["ctrl"].filevalue:set_visible(false)
			item["ctrl"].imagevalue:set_visible(false)			
			item["ctrl"].value:set_text(data['value'])			
		end
		]]
		return item
	end

	----------------------------------------------------------------- 更新表单
	
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
			top.ctrls["objectdesc"].setdata(data)		
		end
	end	
	updatectrl.ssfuncupdate = function(a)
		if a ~= nil then
			local data = a["data"]
			top.ctrls["objectdesc"].setdata(data)		
		end
	end	
	updatectrl.childs["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl.childs["submitbt"]:set_click(function(ctrl)
						local url = g_serverAddress.."objectdesc/update/"							
						url = url.."create_time/"..encodeURI( updatectrl.childs["create_time"]:get_text() ).."/"							
						url = url.."objectname/"..encodeURI( updatectrl.childs["objectname"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"							
						url = url.."objecttitle/"..encodeURI( updatectrl.childs["objecttitle"]:get_text() ).."/"							
						url = url.."clsid/"..encodeURI( updatectrl.childs["clsid"]:get_text() ).."/"
								
						top:curl(url,top.ctrls["objectdesc"].ssfuncupdate)	
					end)	
	self.ctrls["objectdesc"] = updatectrl	

	------------------------------------------------------------------------ 关联列表
	
	self.relationctrl = GmManager.objectRelationListArea(hostWindow)
		
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
   
end
  
  
  
  
objectdescupdateFrame.set_data = function(self,data)
--	table.print(data)
	local top = self
	self.data = data

	self.ctrls["objectdesc"]:set_childs_inner_text(data)
	--[[
	local url = string.format( 	self.listctrl.urls["get"] , 
												self.listctrl.curPage,
											 	self.listctrl.curPageCount ,
											 	data["clsid"],
											 	data["id"])
	print("objectdescupdateFrame.set_data",url)
	self:curl(url,function(a)
								 	top.listctrl:datacallback(a) 
							 	end)
	
	self.relationctrl:set_data(data)
	]]
end
  
