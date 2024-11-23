
gr_module("GmTest")

uiWindow = inherit(GmBase.Window):name("uiWindow")

uiWindow.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"test/main.html")
	

	
	self.canvas = self.body:make_plugin('flash','flashplayer')

	
	
	self.selectvideo = self.body:get_child('selectvideo')
	self.selectvideo:set_click(function(ctrl)
		local path = top:file_select_dialog()
		--table.print(path)
		top.canvas:exec_plugin_command(0,path[0])
		top.canvas:exec_plugin_command(1,"")
	end)
	
	self:set_visible(true)
	
	
	self:set_size(1400,800)
	
	
	self:updatetickMsg(true)
	
end
