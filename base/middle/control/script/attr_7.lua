
-- 下拉列表
gr_module("GmControl")

Attr7 = inherit(GmCtrl.ControlBase):name("Attr7")

Attr7.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_7"
	GmCtrl.ControlBase.init(self,parent,fid)
	

	
end


Attr7.set_data = function(self,data)
	print("Attr7.set_data")
--	table.print(data)
end

Attr7.set_tree_data = function(self,data)
	local id = data['id']
	--g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
end

Attr7.set_tree_rel_data = function(self,data)
	local id = data['childoid']	
	--self:curl(g_serverAddress.."tree/objects/page/1/pagecount/100/parent_id/"..id,self.tree_data_func)
end