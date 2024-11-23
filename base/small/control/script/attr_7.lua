
-- 下拉列表
gr_module("GmControl")

Attr7 = inherit(GmCtrl.ControlBase):name("Attr7")

Attr7.init = function (self,parent,frameid)
	local top = self
	GmCtrl.ControlBase.init(self,parent,frameid or "base_attr_7")
	
	self.value = self:get_child('value')
--	print("Attr7.init ############")
	
end


Attr7.set_data = function(self,data)
--	print("Attr7.set_data")
--	table.print(data)		
	self.value:set_attr('placeholder',data['title'])
	self:set_childs_inner_text(data)
end

