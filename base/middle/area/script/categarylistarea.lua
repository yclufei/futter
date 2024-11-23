
gr_module("GmBase")

categarylistArea = inherit(GmCtrl.ListBase):name("categarylistArea")

categarylistArea.init = function(self,parent,showfirst)

	local top = self
	self.parent = parent
	
	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"
		
	GmCtrl.ListBase.init(self,parent,"categarylistarea",urls)
	
	if showfirst == true then
		self.firstitem = self:get_child('firstitem')
		self.firstitem:set_click(function(obj) top:itemclick(top.data) end)
	else
		self.first = self:get_child('firstparent')
		self.first:set_visible(false)
	end
	
end


categarylistArea.set_click_func = function(self,func)
	self.itemclick = func
end


categarylistArea.init_item = function(self,item)
	local top = self
	item.title = item:get_child('title')
	item.title:set_click(self.itemclick)
end	


categarylistArea.set_data = function(self,data)
	self.data = data
	GmCtrl.ListBase.set_data(self,data['id'])
end


categarylistArea.setitem = function(self,id,data)
--	print("categarylistArea.setitem",id,data)
	local item = self.idlist[id]
	item["data"] = data
	item["ctrl"].title.data = data
	item["ctrl"]:set_childs_inner_text(data)
	return item
end	
