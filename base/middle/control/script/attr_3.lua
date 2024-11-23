
-- 下拉列表
gr_module("GmControl")

Attr3 = inherit(GmCtrl.ControlBase):name("Attr3")

Attr3.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_3"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	
end


Attr3.set_data = function(self,data)
--	print("Attr3.set_data")
--	table.print(data)
end

Attr3.set_tree_data = function(self,data)
	local id = data['id']
	--g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
end

Attr3.set_tree_rel_data = function(self,data)
	local id = data['childoid']	
	--self:curl(g_serverAddress.."tree/objects/page/1/pagecount/100/parent_id/"..id,self.tree_data_func)
end