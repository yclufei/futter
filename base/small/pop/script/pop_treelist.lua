

-- 弹出树节点选择框
gr_module("GmBase")

poptreelistFrame = inherit(GmCtrl.ControlBase):name("poptreelistFrame")

poptreelistFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_treelistFrame")
	
	
	
	self:set_visible(false)
end


poptreelistFrame.set_data = function(self,id)

end
