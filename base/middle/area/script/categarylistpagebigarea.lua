
gr_module("GmBase")

categarylistpageBigArea = inherit(GmCtrl.ListBase):name("categarylistpageBigArea")

categarylistpageBigArea.init = function(self,parent)

	local top = self
	self.parent = parent
	
	local urls = {}	
	urls["get"] = g_serverAddress.."objectdesc/get_objects_by_tree_rel/page/%d/pagecount/%d/treeid/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"
		
	GmCtrl.ListBase.init(self,parent,"categarylistpagebigarea",urls)

	self:set_visible(false)
end


categarylistpageBigArea.set_click_func = function(self,delfunc,detailfunc,updatefunc)
	self.delfunc = delfunc
	self.detailfunc = detailfunc
	self.updatefunc = updatefunc
end


categarylistpageBigArea.trans_data = function(self,data)
	data['sitemtype'] = CONST_TREE_TYPE[ data['itemtype'] ]
	data['sitemsubtype'] = CONST_TREE_SUBTYPE[ data['itemsubtype'] ]		
	return data
end


categarylistpageBigArea.init_item = function(self,item)
	local top = self
	item["deletebt"] = item:get_child("deletebt")
	item["deletebt"]:set_click(self.delfunc)
	item["detailbt"] = item:get_child("detailbt")
	item["detailbt"]:set_click( self.detailfunc	)																
	item["updatebt"] = item:get_child("updatebt")
	item["updatebt"]:set_click(self.updatefunc )												
end


categarylistpageBigArea.setitem = function(self,id,data)
	local item = self.idlist[id]
	item["data"] = data
	item["ctrl"]["deletebt"].data = data
	item["ctrl"]["detailbt"].data = data
	item["ctrl"]["updatebt"].data = data		
	item["ctrl"]:set_childs_inner_text(data)
	return item
end

