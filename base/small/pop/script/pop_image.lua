
-- 弹出树节点选择框
gr_module("GmBase")

popImageFrame = inherit(GmCtrl.ControlBase):name("popImageFrame")

popImageFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_ImageFrame")
	
	self.popmanager = parent

	
	self.save = self:get_child('save')
	self.save:set_click(function(item)
		top.popmanager:show_pop('image',false)
		top.callback(top.data,top.data)
	end)


	self.title = self:get_child('title')
	 
	self.img = self:get_child('img')
	
	self.select = self:get_child('select')
	self.select:set_click(function(item)
	
		if gInfo['os'] == 'win' then
			local path = top.hostWindow:file_select_dialog()
			if path[0] and fileexist(path[0]) then
				top.data = path[0]
				top.img:set_src(path[0])
			end
		else
		
			top.hostWindow:open_album(function(s,p)
																if s and fileexist(s) then
																	top.data = s
																	top.img:set_src(s)
																end
															end)
		end									
	end)
	
	
	self:set_visible(false)
 
end


popImageFrame.set_title = function(self,title)
	self.title:set_inner_text(title)
end


popImageFrame.clear = function(self,title)
	self.data = nil
	self.callback = nil
end


popImageFrame.set_data = function(self,pdata,callback)
	self:clear()
	self.data = pdata
	self.callback = callback
end
