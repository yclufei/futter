
gr_module("GmUI")

IconWindow = inherit(GmBase.Window):name("IconWindow")

IconWindow.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"ui/icon.html")
	
	self:set_size(w,h)
	
	self:centerWindow()
	
	self:set_visible(true)
	
	self.ScrollViewParent = self:get_child('ScrollViewParent')
	self.ScrollViewParent:set_drag_window(true)
	
	self:updatetick(true)
end

