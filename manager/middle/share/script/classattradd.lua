

-- 类属性
gr_module("GmManager")
classattraddFrame = inherit(GmBase.FrameBase):name("classattraddFrame")
classattraddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"classattraddFrame")
   	

	self:init_back_button()
	
	-- classattraddcontent	 
	
	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	
	----------------------------------------------------------------- classattr_add
	local addctrl = self:get_child("classattr_add")
	addctrl.childs = {}
	
	addctrl.childs["name"] = addctrl:get_child("name")
	addctrl.childs["title"] = addctrl:get_child("title")
	addctrl.childs["valuetype"] = addctrl:get_child("valuetype")
	addctrl.childs["length"] = addctrl:get_child("length")
	addctrl.childs["clsid"] = addctrl:get_child("clsid")

	
	addctrl.childs["valuetype"].initoption = addctrl.childs["valuetype"]:get_child('initoption')	
	for a,b in pairs(CONST_VALUETYPE) do
		local item = addctrl.childs["valuetype"].initoption:copy()
		item:set_inner_text(b)
		item:set_attr("value",a)
		addctrl.childs["valuetype"]:add_ctrl(a,item)		
	end
	
	addctrl.childs.ssfunc = function(a)
		if a ~= nil then
			top.hostWindow:delTopNavFrame()
		end
	end
	
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)							
						local name = addctrl.childs["name"]:get_text()
						local title = addctrl.childs["title"]:get_text()
						local valuetype = addctrl.childs["valuetype"]:get_text()
						local length = addctrl.childs["length"]:get_text()
						local clsid = addctrl.childs["clsid"]:get_text()							
						local url = g_serverAddress.."classattr/add/"
						url = url.."name/"..name.."/"
						url = url.."title/"..title.."/"
						url = url.."valuetype/"..valuetype.."/"
						url = url.."length/"..length.."/"
						url = url.."clsid/"..clsid.."/"
						top:curl(url,addctrl.childs.ssfunc)
					end)
					
	self.ctrls["classattr_add"] = addctrl
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
  
 
end
  
classattraddFrame.set_data = function(self,data)
	self.ctrls["classattr_add"].childs["clsid"]:set_text(data["id"])
end

  
