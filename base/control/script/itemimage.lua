
gr_module("GmCtrl")

ItemImageCtrl = inherit(GmBase.Node):name("ItemImageCtrl")

ItemImageCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemImageCtrl")
	
	self.data = data
	self.callback = callback
	self.title = title
	
	
	self.ItemImageCtrl = self:get_child('ItemImageCtrl')
	self.ItemImageCtrl:dont_handle_event(true)
	
	self.ctlkey = self.ItemImageCtrl:get_child('key')
	
	self.ctlvalue = self.ItemImageCtrl:get_child('img')
	self.ctlvalue.set_inner_text = function(imgctrl,uri)
		imgctrl:set_src(uri)
	end
	
	self.ctltitle = self.ItemImageCtrl:get_child('title')
	
	
	self.ctlvalue:dont_handle_event(true)
	self.ctltitle:dont_handle_event(true)
	
	self.ctltitle:set_inner_text(self.title)
	
	self.click = self.ItemImageCtrl:get_child('click')
	self.click:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('image',true)
		pop:set_title(top.title)
		pop:set_data(top.data,top.callback)
		top:updatetick(true)
	end)


end


ItemImageCtrl.set = function(self,key,value)
	self.ctlkey:set_text(key)
	self.ctlvalue:set_inner_text(value)
	self:updatetick(true)
end


ItemImageCtrl.get_text = function(self)
	return self.ctlkey:get_text()
end


ItemImageCtrl.set_text = function(self,txt)
	self.data = txt
	print(ItemImageCtrl.set_text,self.data)
	self.ctlvalue:set_inner_text(txt)
end
