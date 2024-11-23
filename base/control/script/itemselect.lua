
gr_module("GmCtrl")

ItemSelectCtrl = inherit(GmBase.Node):name("ItemSelectCtrl")

ItemSelectCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemSelectCtrl")
	
	self.data = data
	self.callback = callback
	self.title = title
	
	self.ItemSelectCtrl = self:get_child('ItemSelectCtrl')
	self.ItemSelectCtrl:dont_handle_event(true)
	
	self.ctlkey = self.ItemSelectCtrl:get_child('key')
	self.ctlvalue = self.ItemSelectCtrl:get_child('value')
	self.ctltitle = self.ItemSelectCtrl:get_child('title')
	
	
	self.ctlvalue:dont_handle_event(true)
	self.ctltitle:dont_handle_event(true)
	
	self.ctltitle:set_inner_text(self.title)
	
	self:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('select',true)
		pop:set_title(top.title)
		pop:set_data(top.data,top.callback,top)
		top:updatetick(true)
	end)
	
end

ItemSelectCtrl.set = function(self,key,value)
	self.ctlkey:set_text(key)
	self.ctlvalue:set_inner_text(value)
	self:updatetick(true)
end

ItemSelectCtrl.get_text = function(self)
	return self.ctlkey:get_text()
end


ItemSelectCtrl.set_text = function(self,txt)
	self.ctlvalue:set_inner_text(txt)
end
