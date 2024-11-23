-- 对象属性
gr_module("GmManager")
objectattrupdateFrame = inherit(GmBase.FrameBase):name("objectattrupdateFrame")
objectattrupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectattrupdateFrame")

	-- subnav	    
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
	-- objectattrupdatecontent	 
	  
	----------------------------------------------------------------- objectattr_update
	
	local updatectrl = self:get_child("objectattr_update")
	updatectrl.childs = {}
			
	updatectrl.childs["valuetype"] = updatectrl:get_child("valuetype")		
	updatectrl.childs["valueid"] = updatectrl:get_child("valueid")		
	updatectrl.childs["attrid"] = updatectrl:get_child("attrid")		
	updatectrl.childs["id"] = updatectrl:get_child("id")		
	updatectrl.childs["objectid"] = updatectrl:get_child("objectid")		
	
	updatectrl.setdata = function(data)			
		updatectrl.childs["valuetype"]:set_text(data["valuetype"]) 			
		updatectrl.childs["valueid"]:set_text(data["valueid"]) 			
		updatectrl.childs["attrid"]:set_text(data["attrid"]) 			
		updatectrl.childs["id"]:set_text(data["id"]) 			
		updatectrl.childs["objectid"]:set_text(data["objectid"])			
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
						local url = g_serverAddress.."objectattr/update/"							
						url = url.."valuetype/"..encodeURI( updatectrl.childs["valuetype"]:get_text() ).."/"							
						url = url.."valueid/"..encodeURI( updatectrl.childs["valueid"]:get_text() ).."/"							
						url = url.."attrid/"..encodeURI( updatectrl.childs["attrid"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"							
						url = url.."objectid/"..encodeURI( updatectrl.childs["objectid"]:get_text() ).."/"						
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["objectattr"] = updatectrl
	
	local url = g_serverAddress.."objectattr/object/id/1"
	self:curl(url,top.ssfunc)	
  
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
   
end


  
objectattrupdateFrame.set_data = function(self,data)
	print("objectattrupdateFrame set_data")
end
  
