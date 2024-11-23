

-- 对象
gr_module("GmManager")

configFrame = inherit(GmBase.FrameBase):name("configFrame")

configFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"configFrame")


	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
 	
	-- configcontent
  self.ctrls["jumpconfigadd"] = self:get_child("jumpconfigaddFrame")
	self.ctrls["jumpconfigadd"]:set_click(function(self)
		local frame = top.hostWindow:addNavFrame("configaddFrame")
		if frame and frame.set_data then
			frame:set_data(top.listctrl.data)
		end
	end)
	------------------------------------------------------------------------------------- config_list

	
	local urls = {}	
	urls["get"] = g_serverAddress.."config/objects/page/%d/pagecount/%d/clsid/0"
	urls["del"] = g_serverAddress.."config/delete/id/%d"

	self.listctrl = GmCtrl.ListBase(self,"config_list",urls)
	
	self.listctrl.init_item = function(self,item)
		item["deletebt"] = item:get_child("deletebt")
		item["deletebt"]:set_click( function(self) 
																	self.parent:delitem(self.data['id'])
																end	)
		item["updatebt"] = item:get_child("updatebt")
		item["updatebt"]:set_click( function(self) 
																	local frame = top.hostWindow:addNavFrame("configupdateFrame")
																	frame:set_data(self.data)
																end	)	
	end

	self.listctrl.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]:set_childs_inner_text(data)	
		item["ctrl"]:set_parent(self.listParent)
		return item
	end
	
	self:set_data({['id']=0,})
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")

end
  
configFrame.set_data = function(self,data)
	self.listctrl:set_data(data)
end
  
