-- ¿Ø¼þ»ùÀà
gr_module("GmCtrl")

MenuBase = inherit(GmBase.Node):name("MenuBase")

MenuBase.init = function(self,parent,elename,basename,basecssname,count,inline)
	
	local top = self
	GmBase.Node.init_by_parent(self,parent,elename)
	
	self.inline = inline
	self.base_name = basename
	self.count = count
	self.base_cssname = basecssname
	
	self.buttons = {}
	
	self.lastIdx = -1
	
	for i = 1, count do
		self.buttons[i] = self:get_child(self.base_name..tostring(i))
		if self.buttons[i]:is_init() then
			self.buttons[i].idx = i
			self.buttons[i].visible = false
			self.buttons[i]:set_class(self.base_cssname..'_none')
			self.buttons[i]:set_click(function(ctrl)
				top:on_select(ctrl.idx)
			end)
		else
			cerror("MenuBase init error",i,self.base_name..tostring(i))
		end
	end
	
end


MenuBase.remove_item = function(self,idx)			
	self.buttons[idx].visible = false
	self.buttons[idx]:set_class(self.base_cssname..'_none')
	if self.lastIdx == idx then
		self.lastIdx = -1
	end
end


MenuBase.clear = function(self)
	self.lastIdx = -1
	for i = 1, self.count do
		if self.buttons[i].visible then
			self.buttons[i]:set_class(self.base_cssname)
		end
	end
end


MenuBase.on_select = function(self,idx)
	print('MenuBase.on_select',self.lastIdx,idx)
	if self.lastIdx > -1 then
		self.buttons[self.lastIdx]:set_class(self.base_cssname)
	end
	if self.parent.on_item_select then
		self.parent:on_item_select(idx)
	end
	self.buttons[idx]:set_class(self.base_cssname..'_selected')
	self.lastIdx = idx
	self:updatetick(true)
end


MenuBase.add_item = function(self,txt)
	for i = 1, self.count do
		if self.buttons[i].visible == false then
			self.buttons[i]:set_class(self.base_cssname)
			self.buttons[i]:set_inner_text(txt)
			self.buttons[i].visible = true
			return i
		end
	end
end

