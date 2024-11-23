

-- 弹出树节点选择框
gr_module("GmBase")

popTextareaFrame = inherit(GmCtrl.ControlBase):name("popTextareaFrame")

popTextareaFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_textareaFrame")
	
	self.popmanager = parent
	
	self.save = self:get_child('save')
	self.save:set_click(function(item)
		local txt = top.inputid:get_text()
		top.callback(txt,txt)
		top.popmanager:show_pop('textarea',false)
	end)

	self.title = self:get_child('title')
	 
	self.inputid = self:get_child('inputid')
	
	self:set_visible(false)
 
end


popTextareaFrame.set_title = function(self,title)
	self.title:set_inner_text(title)
end


popTextareaFrame.clear = function(self,title)
	self.data = nil
	self.callback = nil
	self.inputid:set_text('')
end


popTextareaFrame.set_data = function(self,pdata,callback)
	self:clear()
	self.data = pdata
	self.callback = callback
	self.inputid:set_text(pdata)
end
