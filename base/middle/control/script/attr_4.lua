
-- 下拉列表
gr_module("GmControl")

Attr4 = inherit(GmCtrl.ControlBase):name("Attr4")

Attr4.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_4"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	
end


Attr4.set_data = function(self,data)
--	print("Attr4.set_data")
--	table.print(data)
end

Attr4.set_tree_data = function(self,data)
	local id = data['id']
	--g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
end

Attr4.set_tree_rel_data = function(self,data)
	local id = data['childoid']	
	--self:curl(g_serverAddress.."tree/objects/page/1/pagecount/100/parent_id/"..id,self.tree_data_func)
end