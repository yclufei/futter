
gr_module("GmCtrl")

ItemMessageCtrl = inherit(GmCtrl.ControlBase):name("ItemMessageCtrl")

ItemMessageCtrl.init = function(self,parent,elename)
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "ItemMessageCtrl")
	self.message = self:get_child('message_div')
end


ItemMessageCtrl.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end
