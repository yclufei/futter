
gr_module("GmBase")

objectdesclistArea = inherit(GmCtrl.ListBase):name("objectdesclistArea")

objectdesclistArea.init = function(self,parent)

	local top = self
	self.parent = parent
	
	local urls = {}	
	urls["get"] = g_serverAddress.."objectdesc/get_objects_by_tree_rel/page/%d/pagecount/%d/treeid/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"
		
	GmCtrl.ListBase.init(self,parent,"objectdesclistarea",urls)

end


objectdesclistArea.set_click_func = function(self,delfunc,detailfunc,updatefunc)
	self.delfunc = delfunc
	self.detailfunc = detailfunc
	self.updatefunc = updatefunc
end


objectdesclistArea.trans_data = function(self,data)
	data['sitemtype'] = CONST_TREE_TYPE[ data['itemtype'] ]
	data['sitemsubtype'] = CONST_TREE_SUBTYPE[ data['itemsubtype'] ]
	if data['clsid'] then
		self.clsid = data['clsid']
	end	
	return data
end


objectdesclistArea.init_item = function(self,item)
	local top = self
	item["deletebt"] = item:get_child("deletebt")
	item["deletebt"]:set_click(self.delfunc)
	item["detailbt"] = item:get_child("detailbt")
	item["detailbt"]:set_click( self.detailfunc	)																
	item["updatebt"] = item:get_child("updatebt")
	item["updatebt"]:set_click(self.updatefunc )												
end


objectdesclistArea.setitem = function(self,id,data)
	local item = self.idlist[id]
	item["data"] = data
	item["ctrl"]["deletebt"].data = data
	item["ctrl"]["detailbt"].data = data
	item["ctrl"]["updatebt"].data = data		
	item["ctrl"]:set_childs_inner_text(data)
	return item
end




