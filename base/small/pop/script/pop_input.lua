

-- 弹出树节点选择框
gr_module("GmBase")

popInputFrame = inherit(GmCtrl.ControlBase):name("popInputFrame")

popInputFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_inputFrame")
	
	self.popmanager = parent

	self.save = self:get_child('save')
	self.save:set_click(function(item)
		top.data = top.inputid:get_text()
		top.callback(top.data,top.data,top.ctrl)
		top.popmanager:show_pop('input',false)
	end)
	
	self.ctrl = nil


	self.title = self:get_child('title')
	 
	self.inputid = self:get_child('inputid')
	self.inputid.set_data = function(item,key,value)
		item.key = key
		item.value = value
		item:set_text(value)
	end
	
	self:set_visible(false)
 
end


popInputFrame.set_title = function(self,title)
	self.title:set_inner_text(title)
end

popInputFrame.clear = function(self,title)
	self.data = nil
	self.callback = nil
end


popInputFrame.set_data = function(self,pdata,callback,ctrl)
	self:clear()
	self.data = pdata
	self.callback = callback
	self.ctrl = ctrl
	self.inputid:set_data(self.data,self.data)
end
