


-- treeselect
gr_module("GmManager")
treeselectFrame = inherit(GmBase.FrameBase):name("treeselectFrame")
treeselectFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"treeselectFrame")
	--aprint("treeselect")
	
   	
	-- subnav	 
	
	
   
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
   	
	-- treeselectcontent	 
	
	
   
	self:addJumpLink("treeupdateFrame")
   
	------------------------------------------------------------------- tree_select
	
	local top = self
	
	local selectctrl = self:get_child("tree_select")
	selectctrl.childs = {}
	
		
	selectctrl.childs["itemtype"] = selectctrl:get_child("itemtype")
		
	selectctrl.childs["sort"] = selectctrl:get_child("sort")
		
	selectctrl.childs["parent_id"] = selectctrl:get_child("parent_id")
		
	selectctrl.childs["title"] = selectctrl:get_child("title")
		
	selectctrl.childs["id"] = selectctrl:get_child("id")
		
	selectctrl.childs["name"] = selectctrl:get_child("name")
		
	
	selectctrl.ssfunc = function(a)
		if a ~= nil then
			local data = a["data"][0]
				
			selectctrl.childs["itemtype"]:set_inner_text(data["itemtype"])
				
			selectctrl.childs["sort"]:set_inner_text(data["sort"])
				
			selectctrl.childs["parent_id"]:set_inner_text(data["parent_id"])
				
			selectctrl.childs["title"]:set_inner_text(data["title"])
				
			selectctrl.childs["id"]:set_inner_text(data["id"])
				
			selectctrl.childs["name"]:set_inner_text(data["name"])
			
			self:updatetick()		
		end
	end
	
	selectctrl.childs["submitbt"] = selectctrl:get_child("submitbt")
	selectctrl.childs["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."tree/object/id/1"
							
						local itemtype = selectctrl.childs["itemtype"]:get_text()
							
						local sort = selectctrl.childs["sort"]:get_text()
							
						local parent_id = selectctrl.childs["parent_id"]:get_text()
							
						local title = selectctrl.childs["title"]:get_text()
							
						local id = selectctrl.childs["id"]:get_text()
							
						local name = selectctrl.childs["name"]:get_text()
						
						local url = g_serverAddress.."tree/object/id/1"
						top:curl(url,selectctrl.ssfunc)	
					end)
					
	self.selectctrl = selectctrl
  
	
end
treeselectFrame.set_data = function(self,data)
	local ctrls = self.selectctrl.childs	
	for key,cvalue in pairs(data) do
		if ctrls[key] ~= nil then
			ctrls[key]:set_inner_text(cvalue)
		end
	end	
end
  


  
