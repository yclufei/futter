
gr_module("GmManager")

addServiceFrame = inherit(GmBase.FrameBase):name("addServiceFrame")

addServiceFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "addServiceFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)
	
	self.subnav = GmBase.subnavArea(self,nil,"添加订单")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)

	self.scrollcontainer = self:get_child("slistscrolllist")

	local addctrl = self:get_child("scrollcontent")

	addctrl:set_style("margin-top:-100px;")
		
	addctrl.childs = {}	
	addctrl.childs["create_time"] = addctrl:get_child("create_time")	
	addctrl.childs["create_time"]:set_click(function(button)
			local pop = top.hostWindow.popmanager:show_pop("treelist",true)
			pop:set_lastindex(2)
			pop:set_data(11)
		end)
		
	addctrl.childs["company"] = addctrl:get_child("company")	
	addctrl.childs["company"]:set_click(function(button)
			local pop = top.hostWindow.popmanager:show_pop("objectlist",true)
			pop:set_data(109)
		end)      
      
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)
						top.hostWindow:net_pay("upmp",100)
						top.hostWindow:showActionMask(true)
						--[[
						local create_time = encodeURI(addctrl.childs["create_time"]:get_text())
						local objectname = addctrl.childs["objectname"]:get_text()
						local objecttitle = addctrl.childs["objecttitle"]:get_text()
						local clsid = addctrl.childs["clsid"]:get_text()
																		
						local url = g_serverAddress.."objectdesc/add/"							
						url = url.."create_time/"..create_time.."/"								
						url = url.."objectname/"..objectname.."/"					
						url = url.."objecttitle/"..objecttitle.."/"								
						url = url.."clsid/"..clsid.."/"		
						
						local postparam = {}						
						postparam['attr'] = {}
						postparam['rel'] = {}		
									
						for a,b in pairs(top.attrsctrl) do
							table.insert( postparam['attr'] ,b:get_childs_inner_text() )
						end
						for a,b in pairs(top.relsctrl) do
							table.insert( postparam['rel'] ,b:get_childs_inner_text() )
						end	
						
						top:curl(url,addctrl.childs.ssfunc,postparam)	
						]]
					end)					
	self.objectdesc_add = addctrl
	
	
	-- 支付回调
	hostWindow.on_net_pay = function(self,er,ret,str1,str2)
		print("net pay")
		top.hostWindow:showActionMask(false)
	end
	
	----------------------------
	
	self.bar = GmControl.ProcessBarCtrl(self)

	self.smallimage = self:get_child("smallimage")
	
end




addServiceFrame.set_data = function(self,data)
	self.data = data
	self:set_childs_inner_text(data)	
	self.bar:set_data(self.data)	
	
	local imgsrc = curl_data_getAttrValue(self.data,'smallimage')
	if imgsrc and string.len(imgsrc) > 0  then
		self.smallimage:set_src("testimages/"..imgsrc..".jpg")
	end
end
