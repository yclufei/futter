
gr_module("GmManager")

ManagerWindow = inherit(GmBase.BigWindow):name("ManagerWindow")

ManagerWindow.init = function (self,w,h)

	--print("manager window")

	local top = self
	local win = self
	
	GmBase.BigWindow.init(self,"manager/big/html/main.html")

	
	self.sysbutton = GmBase.SysButton(self,true,true,true)
		
	self.drag = self:get_child("dragwindow")
	self.drag:set_drag_window(true)

	local url = g_serverAddress.."tree/get_class_define"
	self.mScrollViewParent:curl(url,	function(a)
																local data = a['data']
																for a,b in pairs(data) do
																	--print("get_class_define",b['name'])
																	gApp:add_class_define(b)	
																end
															end)
															
	local url = g_serverAddress.."tree/get_columns"
	self.mScrollViewParent:curl(url,	function(a)
																local data = a['data']						
																for a,b in pairs(data) do
																	gApp:add_column(b)	
																end
															end)
													
	if gInfo["os"] == "win" then
		self:set_pos(5,5)
		self:set_size(950,800)
	end
	self:set_visible(true)
	
		
	-- µ¯³ö	
	self.pop = self:get_child("pop")
	self.pop.cancelpop = self.pop:get_child("cancelpop")
	self.pop.cancelpop:set_click( function() top:hide_popup() end )
	
	self.frame["poplistFrame"] = GmBase.poplistFrame(self)
	self.frame["poptreelistFrame"] = GmBase.poptreelistFrame(self)
	self.frame["popobjectlistFrame"] = GmBase.popobjectlistFrame(self)
	
	self.frame["loginFrame"] = GmManager.loginFrame(self)
	self.frame["chatFrame"] = GmManager.chatFrame(self)	
	self.frame["classattrupdateFrame"] = GmManager.classattrupdateFrame(self)
	self.frame["objectattrupdateFrame"] = GmManager.objectattrupdateFrame(self)
	self.frame["classattraddFrame"] = GmManager.classattraddFrame(self)
	self.frame["treeaddFrame"] = GmManager.treeaddFrame(self)
	self.frame["classattrFrame"] = GmManager.classattrFrame(self)
	self.frame["objectdescupdateFrame"] = GmManager.objectdescupdateFrame(self)
	self.frame["treelistFrame"] = GmManager.treelistFrame(self)
	self.frame["treeupdateFrame"] = GmManager.treeupdateFrame(self)
	self.frame["treeselectFrame"] = GmManager.treeselectFrame(self)
	self.frame["treedeleteFrame"] = GmManager.treedeleteFrame(self)
	self.frame["objectattraddFrame"] = GmManager.objectattraddFrame(self)
	self.frame["relationaddFrame"] = GmManager.relationaddFrame(self)
	self.frame["objectdescaddFrame"] = GmManager.objectdescaddFrame(self)
	self.frame["firstFrame"] = GmManager.firstFrame(self)
	self.frame["area_mainmenu"] = GmManager.mainmenuFrame(self)
	self.frame["relationupdateFrame"] = GmManager.relationupdateFrame(self)	
	self.frame["configFrame"] = GmManager.configFrame(self)	
	self.frame["configaddFrame"] = GmManager.configaddFrame(self)	
	self.frame["configupdateFrame"] = GmManager.configupdateFrame(self)


	--------------------------------------------------------------------------------------------------
	-- ×ó±ßÊ÷²Ëµ¥
	local listctrl = self:get_child("leftreelist")
	listctrl.tmpurl = g_serverAddress.."tree/objects/parent_id/%d/withattr/1/withrel/1/"	
	self.curPage = 1
	self.curPageCount = 100
	listctrl.childs = {}	
	listctrl.childs.scrollcontainer = listctrl:get_child("leftreescrolllist")
	listctrl.listParent = listctrl:get_child("leftreelistparent")
	listctrl.initItem = listctrl.listParent:get_child_by_sort(0)
	
	listctrl.idlist = {}
	listctrl.idlist[0] = {}
	listctrl.idlist[0]["ctrl"] = {}
	listctrl.idlist[0]["ctrl"].itemchilds = listctrl.listParent
	
	self.ssfunc = function(a)		
			if a ~= nil then
				--table.print(a)
				local data = a
				if data["success"] == true then
					local ctls = {}
					for a,b in GSortedPairs(data["data"]) do
						local item = listctrl:additem(a,b)
						table.insert( ctls , item )
					end
					for a,b in GSortedPairs(ctls) do
						local idx = tonumber(b["data"]["parent_id"])
						if listctrl.idlist[idx] then
							local parent = listctrl.idlist[idx]["ctrl"].itemchilds
							b["ctrl"]:set_parent(parent)
						end
					end	
					top:updatetick()
				else
					aprint("GET DATA FALSE")
				end		
			end
	end
		
	
	listctrl.setitem = function(self,id,data)
			local top = self
			local item = listctrl.idlist[id]
			item["data"] = data			
			local vtb = {}		
			vtb["title"] = data["title"]		
			item["ctrl"]:set_childs_inner_text(vtb)
			item["ctrl"]:set_visible(true)
			return item
	end
	
	
	listctrl.additem = function(ctrl,id,data)
	
			local item = nil	
			local id = tonumber( data["id"] )
						
			if listctrl.idlist[id] ~= nil then
				listctrl.idlist[id] = listctrl:setitem(id,data)
				return listctrl.idlist[id]
			else
				item = {}
			end
			
			item["data"] = data	
			item["ctrl"] = listctrl.initItem:copy()	
			item["ctrl"]:set_attr("id","id"..id)	
			item["ctrl"].itemchilds = item["ctrl"]:get_child("itemchilds")
			
			item["ctrl"]:set_visible(true)
			
			item["ctrl"].title = item["ctrl"]:get_child("title")
			item["ctrl"].title:set_inner_text(data["title"])
			item["ctrl"].title.expend = false
			
			item["ctrl"].title:set_click(function(title)
																if title.expend then
																	title.parent.itemchilds:set_visible(false)
																	self:updatetick()
																else
																	local url = string.format( self.listctrl.tmpurl, tonumber(id ) )
																	self.listctrl:curl(url,self.ssfunc)	
																	title.parent.itemchilds:set_visible(true)
																end
																title.expend = not title.expend																
														 end)

			item["ctrl"].title:set_dblclick(function(self) 
																					if data.itemtype ~= "4" then
																						local frame = top:showFrame("classattrFrame")
																						if frame ~= nil then
																							frame:set_data(data)
																						end
																					else
																						--table.print(get_my())
																						local frame = top:showFrame("chatFrame")																			
																					end
																			end)
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
			local url = g_serverAddress.."tree/delete/id/"..id
			self:curl(url,listctrl.deletecallback)
	end
	
	self.listctrl = listctrl
	
	-----------------------------------------------------------------------
	
	self:showFrame("loginFrame")
	
	self.topmainmenu = self:get_child("topmainmenu")
	
	self.lefttd = self:get_child("lefttd")
		
	
end 



ManagerWindow.InitUI = function(self)
	
	self:showFrame("firstFrame")
	
	self.lefttd:set_visible(true)
		
	self.topmainmenu:set_style("display:table-row")
	
	local url = string.format( self.listctrl.tmpurl , 0 )
	
	--print(url)
	
	self.listctrl:curl(url,self.ssfunc)
	
end



ManagerWindow.on_sys_button = function(self,stype)
	if stype == "close" then
		gApp:exit()
	else
		GmBase.BigWindow.on_sys_button(self,stype)
	end
end

