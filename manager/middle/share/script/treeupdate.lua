-- treeupdate
gr_module("GmManager")
treeupdateFrame = inherit(GmBase.FrameBase):name("treeupdateFrame")
treeupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"treeupdateFrame")
	--aprint("treeupdate")
	   	
	-- subnav
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
	-- treeupdatecontent	 
	----------------------------------------------------------------- tree_update
	
	local updatectrl = self:get_child("tree_update")
	updatectrl.childs = {}
			
		
	updatectrl.childs["sort"] = updatectrl:get_child("sort")
	updatectrl.childs["parent_id"] = updatectrl:get_child("parent_id")
	updatectrl.childs["title"] = updatectrl:get_child("title")
	updatectrl.childs["id"] = updatectrl:get_child("id")
	updatectrl.childs["name"] = updatectrl:get_child("name")
	
	updatectrl.childs["itemsubtype"] = updatectrl:get_child("itemsubtype")
	updatectrl.childs["itemsubtype"].initoption = updatectrl.childs["itemsubtype"]:get_child("inititem")
	updatectrl.childs["itemsubtype"].options = {}
	for a,b in pairs(CONST_TREE_SUBTYPE) do
		local item = updatectrl.childs["itemsubtype"].initoption:copy()
		item:set_attr("value",a)
		item:set_inner_text(b)
		item:set_parent(updatectrl.childs["itemsubtype"])
		updatectrl.childs["itemsubtype"].options[a] = item
	end
	
	updatectrl.childs["itemtype"] = updatectrl:get_child("itemtype")
	updatectrl.childs["itemtype"].initoption = updatectrl.childs["itemtype"]:get_child("inititem")
	updatectrl.childs["itemtype"].options = {}
	for a,b in pairs(CONST_TREE_TYPE) do
		local item = updatectrl.childs["itemtype"].initoption:copy()
		item:set_attr("value",a)
		item:set_inner_text(b)
		item:set_parent(updatectrl.childs["itemtype"])
		updatectrl.childs["itemtype"].options[a] = item
	end
	
				
	updatectrl.setdata = function(data)
		updatectrl.childs["itemsubtype"]:set_text(data["itemsubtype"])
		updatectrl.childs["itemtype"]:set_text(data["itemtype"])
		updatectrl.childs["sort"]:set_text(data["sort"])
		updatectrl.childs["parent_id"]:set_text(data["parent_id"])
		updatectrl.childs["title"]:set_text(data["title"])
		updatectrl.childs["id"]:set_text(data["id"])
		updatectrl.childs["name"]:set_text(data["name"])
		
	end
	
	updatectrl.ssfunc = function(a)
		if a ~= nil then
			local data = a["data"][0]
			updatectrl.setdata(data)		
		end
	end
	
	updatectrl.ssfuncupdate = function(a)
		if a ~= nil then
			local data = a
			if data['success'] then
				updatectrl.setdata(data['data'])
				local frame = top.hostWindow:delTopNavFrame()
			end			
		end
	end
	
	updatectrl.childs["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl.childs["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."tree/update/"							
						url = url.."itemsubtype/"..encodeURI( updatectrl.childs["itemsubtype"]:get_text() ).."/"	
						url = url.."itemtype/"..encodeURI( updatectrl.childs["itemtype"]:get_text() ).."/"							
						url = url.."sort/"..encodeURI( updatectrl.childs["sort"]:get_text() ).."/"							
						url = url.."parent_id/"..encodeURI( updatectrl.childs["parent_id"]:get_text() ).."/"							
						url = url.."title/"..encodeURI( updatectrl.childs["title"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"							
						url = url.."name/"..encodeURI( updatectrl.childs["name"]:get_text() ).."/"
											
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["tree"] = updatectrl
	
	local url = g_serverAddress.."tree/object/id/1"
	self:curl(url,top.ssfunc)	
						
  
	
end


treeupdateFrame.set_data = function(self,data)
	local ctrls = self.ctrls["tree"].childs
	self.ctrls["tree"]:set_childs_inner_text(data)	
end
  

  
