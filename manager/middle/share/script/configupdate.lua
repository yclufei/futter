

-- 类属性
gr_module("GmManager")
configupdateFrame = inherit(GmBase.FrameBase):name("configupdateFrame")
configupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"configupdateFrame")

	-- subnav	
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	-- configupdatecontent	    
	----------------------------------------------------------------- config_update
	
	local updatectrl = self:get_child("config_update")
	updatectrl.childs = {}
			
	updatectrl.childs["ckey"] = updatectrl:get_child("ckey")		
	updatectrl.childs["cvalue"] = updatectrl:get_child("cvalue")		
	updatectrl.childs["ctype"] = updatectrl:get_child("ctype")		
	updatectrl.childs["csubtype"] = updatectrl:get_child("csubtype")
	updatectrl.childs["id"] = updatectrl:get_child("id")
		
	updatectrl.setdata = function(data)			
		updatectrl.childs["ckey"]:set_text(data["name"]) 			
		updatectrl.childs["cvalue"]:set_text(data["title"]) 			
		updatectrl.childs["ctype"]:set_text(data["valuetype"]) 			
		updatectrl.childs["csubtype"]:set_text(data["length"])
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
		end
	end
	
	updatectrl.childs["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl.childs["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."config/update/"							
						url = url.."ckey/"..encodeURI( updatectrl.childs["ckey"]:get_text() ).."/"							
						url = url.."cvalue/"..encodeURI( updatectrl.childs["cvalue"]:get_text() ).."/"							
						url = url.."ctype/"..encodeURI( updatectrl.childs["ctype"]:get_text() ).."/"							
						url = url.."csubtype/"..encodeURI( updatectrl.childs["csubtype"]:get_text() ).."/"		
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"						
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["config"] = updatectrl
	
	local url = g_serverAddress.."config/object/id/1"
	self:curl(url,top.ssfunc)	
	
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
 
end
  
configupdateFrame.set_data = function(self,data)
--	print("configupdateFrame set_data")
--	table.print(data)
	self.ctrls["config"]:set_childs_inner_text(data)
end
