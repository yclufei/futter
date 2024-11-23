
gr_module("GmControl")

popItem = inherit(GmCtrl.ControlBase):name("popItem")

popItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_pop"
	GmCtrl.ControlBase.init(self,parent,fid)

	
	self.ctltitle = self:get_child('title')
	
	self.ctltitle:set_mouseup(function(ctrl)
		print('popItem ctltitle click')
		top.select(ctrl,top.data)
	end)
	
	--self.ctltitle:dont_handle_event(true)
	
	self.ctlvalue = self:get_child('value')
	
	self.ctlvalue:set_mouseup(function(ctrl)
		print('popItem ctlvalue click')
		top.select(ctrl,top.data)
	end)
	
	--self.ctlvalue:dont_handle_event(true)
	
	self:set_mouseup(function(ctrl)
		print('popItem click')
		top.select(ctrl,top.data)
	end)
	
	
	self.select = function(ctrl,data)
		print('popItem click')
	end
	
end

popItem.set_data = function(self,data)
	--table.print(data)
	self.data = data 
	self.ctltitle:set_inner_text(data.name)
end
