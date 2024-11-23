
gr_module("GmBase")

PluginPhotoView = inherit(gscriptpluginphotoview,GmBase.Node):name("PluginPhotoView")

PluginPhotoView.init = function (self,hostWindow)
	GmBase.Node.init(self,hostWindow)
	return self
end


PluginPhotoView.mousedown = function(self,x,y)
	print("PluginPhotoView.mousedown",x,y)
end

PluginPhotoView.mouseover = function(self,x,y)
	print("PluginPhotoView.mouseover",x,y)
end

PluginPhotoView.mouseup = function(self,x,y)
	print("PluginPhotoView.mouseup",x,y)
end
