-- treeadd
gr_module("GmManager")
treeaddFrame = inherit(GmBase.FrameBase):name("treeaddFrame")
treeaddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"treeaddFrame")

   	
	self.treetype = nil
	self.treesubtype = nil
		
	-- subnav	  
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
     	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	-- treeaddcontent	 	   
	----------------------------------------------------------------- tree_add
	local addctrl = self:get_child("tree_add")
	addctrl.childs = {}	
	
	
	
	addctrl.childs["itemsubtype"] = addctrl:get_child("itemsubtype")
	addctrl.childs["itemsubtype"]:set_click(function(self)
																					local frame = top.hostWindow:show_popup("poplistFrame",CONST_TREE_SUBTYPE) 
																					frame.callback = function(frame,data)
																						top.treesubtype = data
																						self:set_text(data['title'])
																						top:updatetick(true)
																					end
																				end)
	
	addctrl.childs["itemtype"] = addctrl:get_child("itemtype")
	addctrl.childs["itemtype"]:set_click(function(self) 
																					local frame = top.hostWindow:show_popup("poplistFrame",CONST_TREE_TYPE) 
																					frame.callback = function(frame,data)
																						top.treetype = data
																						self:set_text(data['title'])
																						top:updatetick(true)
																					end
																				end)
																				
	
	
	addctrl.childs["sort"] = addctrl:get_child("sort")	
	addctrl.childs["parent_id"] = addctrl:get_child("parent_id")	
	addctrl.childs["title"] = addctrl:get_child("title")	
	addctrl.childs["name"] = addctrl:get_child("name")
	
	
	

	
	
	addctrl.childs.ssfunc = function(a)
--		table.print(a)
		if a ~= nil then
			local data = a
			if data['success'] then
				top.hostWindow:delTopNavFrame()
			end
		end
	end
	
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)						
						local itemtype = addctrl.childs["itemtype"]:get_text()
						local itemsubtype = addctrl.childs["itemsubtype"]:get_text()
						local sort = addctrl.childs["sort"]:get_text()
						local parent_id = addctrl.childs["parent_id"]:get_text()
						local title = addctrl.childs["title"]:get_text()
						local name = addctrl.childs["name"]:get_text()
						
						local url = g_serverAddress.."tree/add/"	
						url = url.."itemsubtype/"..top.treesubtype.id.."/"
						url = url.."itemtype/"..top.treetype.id.."/"
						url = url.."sort/"..sort.."/"	
						url = url.."parent_id/"..parent_id.."/"	
						url = url.."title/"..title.."/"	
						url = url.."name/"..name.."/"	
						
						top:curl(url,addctrl.childs.ssfunc)	
					end)	
					
	self.ctrls["tree_add"] = addctrl
  
	
end
  
treeaddFrame.set_data = function(self,data)
--	print("treeaddFrame set_data")

	if data and data['id'] then
	
		self.ctrls["tree_add"].childs["parent_id"]:set_text(data['id'])
		
		self.ctrls["tree_add"].childs["itemtype"]:set_text(data['itemtype'])
		self.ctrls["tree_add"].childs["itemsubtype"]:set_text(data['itemsubtype'])
		
		
	end
	
end


  
