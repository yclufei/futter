
-- 下拉列表
gr_module("GmControl")

Attr4 = inherit(GmCtrl.ControlBase):name("Attr4")

Attr4.init = function (self,parent,frameid)
	local top = self
	local fid = frameid or "base_attr_4"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.focusInput = self:get_child('focusInput')
	self.focusInput:set_blur(function() 
			top.selparent:set_visible(false)
		end)
	self.selparent = self:get_child("selparent")
	self.selchild = self:get_child("selchild")
	self.curchild = self:get_child('curchild')
	self.curchild:set_click(
		function(self)
			top.selparent:set_visible(true)
			top.focusInput:set_focus(true)
			top:updatetick()
		end)
	
	self.tree_data_func = function(a)
		local d = a
		if d['success'] then
			self.selparent:remove_all_child()
			if table.size(d['data']) > 0 then
				for a,b in pairs(d['data']) do
					local item = self.selchild:copy()
					item:set_inner_text(b['title'])
					item:set_mousedown( function(self)
--								table.print(b)
							end )
					self.selparent:add_ctrl(b['id'],item)
				end
			end
			top:updatetick()
		end
	end
	
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
	self:curl(g_serverAddress.."tree/objects/page/1/pagecount/100/parent_id/"..id,self.tree_data_func)
end