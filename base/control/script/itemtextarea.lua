
gr_module("GmCtrl")

ItemTextareaCtrl = inherit(GmBase.Node):name("ItemTextareaCtrl")

ItemTextareaCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemTextareaCtrl")
	
	self.callback = callback
	self.title = title
	
	self.ItemTextareaCtrl = self:get_child('ItemTextareaCtrl')
	self.ItemTextareaCtrl:dont_handle_event(true)
	
	self.ctltitle = self.ItemTextareaCtrl:get_child('title')
	self.ctltitle:dont_handle_event(true)
	self.ctltitle:set_inner_text(self.title)
	
	
	self.ctlvalue = self.ItemTextareaCtrl:get_child('value')	
	self.ctlvalue:dont_handle_event(true)
	
	self:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('textarea',true)
		pop:set_title(top.title)
		pop:set_data(top.data,top.callback)
		top:updatetick(true)
	end)
	
	self:set(data,data)
	
end

ItemTextareaCtrl.set = function(self,key,value)
	self.data = key
	self.ctlvalue:set_inner_text(value)
	self:updatetick(true)
end

ItemTextareaCtrl.get_text = function(self)
	return self.data
end


ItemTextareaCtrl.set_text = function(self,txt)
	self.data = txt
	self.ctlvalue:set_inner_text(txt)
end
