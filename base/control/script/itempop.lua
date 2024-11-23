
gr_module("GmCtrl")

ItemPopCtrl = inherit(GmBase.Node):name("ItemPopCtrl")

ItemPopCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemPopCtrl")
	
	self.callback = callback
	self.title = title
	
	self.ItemPopCtrl = self:get_child('ItemPopCtrl')
	self.ItemPopCtrl:dont_handle_event(true)
	
	self.ctltitle = self.ItemPopCtrl:get_child('title')
	self.ctltitle:dont_handle_event(true)
	self.ctltitle:set_inner_text(self.title)
	
	self.ctlvalue = self.ItemPopCtrl:get_child('value')
	self.ctlvalue:dont_handle_event(true)
	
	self:set(data,data)
end


ItemPopCtrl.set = function(self,key,value)
	self.key = key
	self:set_text(value)
end

ItemPopCtrl.get_text = function(self)
	print('ItemPopCtrl.get_text',self.data)
	return self.key
end


ItemPopCtrl.set_text = function(self,txt)
	self.data = txt
	self.ctlvalue:set_inner_text(self.data)
end
