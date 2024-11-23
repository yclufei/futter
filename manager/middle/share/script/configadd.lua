

-- 对象
gr_module("GmManager")

configaddFrame = inherit(GmBase.FrameBase):name("configaddFrame")

configaddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"configaddFrame")
	--aprint("configadd")
	
   	
	-- subnav	 
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
   	
   	
	-- configaddcontent	 
	----------------------------------------------------------------- config_add
	local addctrl = self:get_child("config_add")
	addctrl.childs = {}	
	addctrl.childs["ckey"] = addctrl:get_child("ckey")		
	addctrl.childs["cvalue"] = addctrl:get_child("cvalue")		
	addctrl.childs["ctype"] = addctrl:get_child("ctype")		
	addctrl.childs["csubtype"] = addctrl:get_child("csubtype")
	addctrl.childs.ssfunc = function(a)
		if a ~= nil then	
--			table.print(a)	
		end
	end
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)		
						
						local ckey = encodeURI(addctrl.childs["ckey"]:get_text())
						local cvalue = addctrl.childs["cvalue"]:get_text()
						local ctype = addctrl.childs["ctype"]:get_text()
						local csubtype = addctrl.childs["csubtype"]:get_text()
																		
						local url = g_serverAddress.."config/add/"							
						url = url.."ckey/"..ckey.."/"								
						url = url.."cvalue/"..cvalue.."/"					
						url = url.."ctype/"..ctype.."/"								
						url = url.."csubtype/"..csubtype.."/"								
						top:curl(url,addctrl.childs.ssfunc)	
					end)					
	self.ctrls["config_add"] = addctrl
  
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
  
 
end
  
configaddFrame.set_data = function(self,data)
--	print("configaddFrame set_data")
end
  
