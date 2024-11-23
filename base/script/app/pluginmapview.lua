
gr_module("GmBase")

PluginMapView = inherit(gscriptpluginmapview,GmBase.Node):name("PluginMapView")

PluginMapView.init = function (self,hostWindow)
	GmBase.Node.init(self,hostWindow)
	return self
end


PluginMapView.on_long_click = function(self,c2d)
	print("PluginMapView.on_long_click ",c2d)
end


PluginMapView.on_double_click = function(self,c2d)
	print("PluginMapView.on_double_click ",c2d)
end


PluginMapView.on_change = function(self,c2d)
--	print("PluginMapView.on_change ",c2d)
end


PluginMapView.mousedown = function(self,x,y)
	print("PluginMapView.mousedown",x,y)
end

PluginMapView.mouseover = function(self,x,y)
	print("PluginMapView.mouseover",x,y)
end

PluginMapView.mousemove = function(self,x,y)
	print("PluginMapView.mousemove",x,y)
end

PluginMapView.mouseup = function(self,x,y)
	print("PluginMapView.mouseup",x,y)
end

PluginMapView.click = function(self,x,y)
	print("PluginMapView.click",x,y)
end
