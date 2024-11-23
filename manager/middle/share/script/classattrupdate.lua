

-- 类属性
gr_module("GmManager")
classattrupdateFrame = inherit(GmBase.FrameBase):name("classattrupdateFrame")
classattrupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"classattrupdateFrame")

	-- subnav	
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	-- classattrupdatecontent	    
	----------------------------------------------------------------- classattr_update
	
	local updatectrl = self:get_child("classattr_update")
	updatectrl.childs = {}
			
	updatectrl.childs["name"] = updatectrl:get_child("name")		
	updatectrl.childs["title"] = updatectrl:get_child("title")	
	updatectrl.childs["length"] = updatectrl:get_child("length")		
	updatectrl.childs["clsid"] = updatectrl:get_child("clsid")		
	updatectrl.childs["id"] = updatectrl:get_child("id")
		
	updatectrl.setdata = function(data)			
		updatectrl.childs["name"]:set_text(data["name"]) 			
		updatectrl.childs["title"]:set_text(data["title"]) 	
		updatectrl.childs["length"]:set_text(data["length"]) 			
		updatectrl.childs["clsid"]:set_text(data["clsid"]) 			
		updatectrl.childs["id"]:set_text(data["id"]) 			
	end
	
	updatectrl.ssfunc = function(a)
		if a ~= nil then
			local data = a["data"][0]
			updatectrl.setdata(data)		
		end
	end
	
	updatectrl.ssfuncupdate = function(a)
		if a ~= nil then
			local data = a["data"]
			updatectrl.setdata(data)
			top.hostWindow:delTopNavFrame()	
		end
	end
	
	updatectrl.childs["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl.childs["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."classattr/update/"							
						url = url.."name/"..encodeURI( updatectrl.childs["name"]:get_text() ).."/"							
						url = url.."title/"..encodeURI( updatectrl.childs["title"]:get_text() ).."/"							
						url = url.."valuetype/"..encodeURI( updatectrl.childs["valuetype"]:get_value() ).."/"							
						url = url.."length/"..encodeURI( updatectrl.childs["length"]:get_text() ).."/"							
						url = url.."clsid/"..encodeURI( updatectrl.childs["clsid"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"					
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["classattr"] = updatectrl
	
	local url = g_serverAddress.."classattr/object/id/1"
	self:curl(url,top.ssfunc)	


	self.valuetype = self:get_child('valuetype')
	
	self.initoption = self.valuetype:get_child('initoption')
	
	for a,b in pairs(CONST_VALUETYPE) do
		local item = self.initoption:copy()
		item:set_inner_text(b)
		item:set_attr("value",a)
		self.valuetype:add_ctrl(a,item)		
	end

	updatectrl.childs['valuetype'] = self.valuetype
	
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
 
end
  
classattrupdateFrame.set_data = function(self,data)
--	table.print(data)
	self.ctrls["classattr"]:set_childs_inner_text(data)
	self.valuetype:set_value(data['valuetype'])
end
