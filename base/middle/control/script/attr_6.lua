
-- �����б�
gr_module("GmControl")

Attr6 = inherit(GmCtrl.ControlBase):name("Attr6")

Attr6.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_6"
	GmCtrl.ControlBase.init(self,parent,fid)

	
end


Attr6.set_data = function(self,data)
--	print("Attr6.set_data")
--	table.print(data)
end

Attr6.set_tree_data = function(self,data)
	local id = data['id']
	--g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
end

Attr6.set_tree_rel_data = function(self,data)
	local id = data['childoid']	
	--self:curl(g_serverAddress.."tree/objects/page/1/pagecount/100/parent_id/"..id,self.tree_data_func)
end