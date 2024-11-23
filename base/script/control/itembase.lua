


gr_module("GmCtrl")

ItemBase = inherit(GmBase.Node):name("ItemBase")

ItemBase.init = function (self,list,sort)
	local top = self
	self:set_host_window(list.hostWindow[0])
	list:_get_child_by_sort(self[0],sort)
end

