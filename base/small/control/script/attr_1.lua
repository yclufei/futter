
-- 下拉列表
gr_module("GmControl")

Attr1 = inherit(GmCtrl.ControlBase):name("Attr1")

Attr1.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_1"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	
end


Attr1.set_data = function(self,data)
end

Attr1.set_tree_data = function(self,data)
end

Attr1.set_tree_rel_data = function(self,data)
end