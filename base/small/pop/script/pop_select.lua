

-- 弹出树节点选择框
gr_module("GmBase")

popSelectFrame = inherit(GmCtrl.ControlBase):name("popSelectFrame")

popSelectFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_selectFrame")
	
	self.popmanager = parent

	self.title = self:get_child('title')
	
	
	self.item_set_func = function(item,key,value)
		item.key = key
		item.value = value
		item:set_inner_text(value)
	end
	
	self.item_click_func = function(item)
		print('item_click_func',item)
		top.callback(item.key,item.value,top.ctrl)
		top.popmanager:show_pop('select',false)
	end
	
	self.items = {}
	for i=1,10 do
		self.items[i] = self:get_child('item'..tostring(i))
		self.items[i].set_data = self.item_set_func
		self.items[i]:set_click(self.item_click_func)
	end
	
	self.ctrl = nil

	self:set_visible(false)
 
end


popSelectFrame.set_title = function(self,title)
	self.title:set_inner_text(title)
end


popSelectFrame.clear = function(self,title)
	self.data = nil
	self.callback = nil
	for i=1,10 do
		self.items[i]:set_visible(false)
	end
end


popSelectFrame.set_data = function(self,pdata,callback,ctrl)
	self:clear()
	--self:clean()
	self.data = pdata
	self.callback = callback
	self.ctrl = ctrl
	local i = 1
	for a,b in pairs(self.data) do
		self.items[i]:set_data(a,b)
		self.items[i]:set_visible(true)
		i = i + 1
	end
end
