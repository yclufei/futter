
-- 对象属性
gr_module("GmManager")
objectattraddFrame = inherit(GmBase.FrameBase):name("objectattraddFrame")
objectattraddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectattraddFrame")
	--aprint("objectattradd")
	
   	
	-- subnav	 
	
	
   
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
 	
	-- objectattraddcontent	 
	
	
   
	----------------------------------------------------------------- objectattr_add
	local addctrl = self:get_child("objectattr_add")
	addctrl.childs = {}
	
	
	addctrl.childs["valuetype"] = addctrl:get_child("valuetype")	
	addctrl.childs["valueid"] = addctrl:get_child("valueid")	
	addctrl.childs["attrid"] = addctrl:get_child("attrid")	
	addctrl.childs["id"] = addctrl:get_child("id")	
	addctrl.childs["objectid"] = addctrl:get_child("objectid")
	
	
	addctrl.childs.ssfunc = function(a)
		if a ~= nil then
		
		end
	end
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)
	
						
						local valuetype = addctrl.childs["valuetype"]:get_text()
						local valueid = addctrl.childs["valueid"]:get_text()	
						local attrid = addctrl.childs["attrid"]:get_text()	
						local id = addctrl.childs["id"]:get_text()				
						local objectid = addctrl.childs["objectid"]:get_text()	
						
						local url = g_serverAddress.."objectattr/add/"	
								
							
						url = url.."valuetype/"..valuetype.."/"	
						url = url.."valueid/"..valueid.."/"	
						url = url.."attrid/"..attrid.."/"	
						url = url.."id/"..id.."/"								
						url = url.."objectid/"..objectid.."/"	
						
						
						top:curl(url,addctrl.childs.ssfunc)	
					end)	
	self.ctrls["objectattr_add"] = addctrl
  
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
  
 
end
  
objectattraddFrame.set_data = function(self,data)
--	print("objectattraddFrame set_data")
--	table.print(data)
end

  
