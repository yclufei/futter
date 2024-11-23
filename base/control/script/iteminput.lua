
gr_module("GmCtrl")

ItemInputCtrl = inherit(GmBase.Node):name("ItemInputCtrl")

ItemInputCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemInputCtrl")
	
	self.callback = callback
	self.title = title
	
	self.ItemInputCtrl = self:get_child('ItemInputCtrl')
	self.ItemInputCtrl:dont_handle_event(true)
	
	
	self.ctltitle = self.ItemInputCtrl:get_child('title')
	self.ctltitle:dont_handle_event(true)
	self.ctltitle:set_inner_text(self.title)
	
	self.ctlvalue = self.ItemInputCtrl:get_child('value')
	self.ctlvalue:dont_handle_event(true)
	
	self:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('input',true)
		pop:set_title(top.title)
		pop:set_data(top.data,top.callback,top)
		top:updatetick(true)
	end)
	
	self:set(data,data)
end

ItemInputCtrl.set = function(self,key,value)
	self:set_text(key)
	self:layout()
	self:updatetick(true)
end

ItemInputCtrl.get_text = function(self)
	print('ItemInputCtrl.get_text',self.data)
	return self.data
end


ItemInputCtrl.set_text = function(self,txt)
	self.data = txt
	self.ctlvalue:set_inner_text(self.data)
end
