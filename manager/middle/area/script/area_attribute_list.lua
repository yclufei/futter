gr_module("GmManager")

attributeListArea = inherit(GmCtrl.ListBase):name("attributeListArea")

attributeListArea.init = function (self,parent)

	local top = self
	
	local hostWindow = parent.hostWindow
	
	local urls = {}
	urls["get"] = g_serverAddress.."classattr/objects/page/%d/pagecount/%d/clsid/%d"	
	urls["del"] = g_serverAddress.."classattr/delete/id/%d"
	
	
	GmCtrl.ListBase.init(self,parent,"attributelist",urls)
	
	
	self.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]:set_childs_inner_text(data)
		return item
	end

	self.trans_data = function(self,b)
		b["sitemtype"] = CONST_TREE_TYPE[b["itemtype"]]
		b["sitemsubtype"] = CONST_TREE_TYPE[b["itemsubtype"]]
		b["valuetypestr"] = CONST_VALUETYPE[b["valuetype"]]
		if b['clsid'] == '0' then
			b['clsidstr'] = CONST_TREE
		else
			local obj = gApp:get_object("0",b['clsid'])
			if obj then
				b['clsidstr'] = obj['title']
			end
		end	
		return b
	end
	
	self.updatefunc = function(button)
		top.hostWindow:addNavFrame("classattrupdateFrame",nil,function(frame)  frame:set_data(button.data) end)
	end

	self.addclick = function(button)
		local frame = top.hostWindow:addNavFrame("classattraddFrame")
		if top.attrdata and frame and frame.set_data then		
			frame:set_data(top.attrdata)
		end
	end
	
	self.init_item = function(self,ctrl)
		ctrl["deletebt"] = ctrl:get_child("deletebt")
		ctrl["deletebt"]:set_click( function(self) top:delitem(self.data.id) end	)																						
		ctrl["updatebt"] = ctrl:get_child("updatebt")
		ctrl["updatebt"]:set_click( self.updatefunc	)
	end
	
	self.jumpclassattradd = self:get_child("jumpclassattraddFrame")
	self.jumpclassattradd:set_click(self.addclick)

	self:set_visible(true)
	
end


attributeListArea.ondatacallback = function(self)
--	print("attributeListArea.ondatacallback")
	self.childs.scrollcontainer:set_scroll_pos(-1,0)
	self:updatetick()
end

attributeListArea.set_data = function(self,data)
	--table.print(data)
	data['clsid'] = "0"
	self.attrdata = data	
	local url = GmCtrl.ListBase.set_data(self,data["id"])
	--print("attributeListArea.set_data",url)
end
  

  
  
