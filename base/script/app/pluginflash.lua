
gr_module("GmBase")

PluginFlash = inherit(gscriptpluginflash):name("PluginFlash")

PluginFlash.init = function (self,hostWindow)
	GmBase.Node.init(self,hostWindow)
	
	
	return self
end






PluginFlash.mousedown = function(self,x,y)
	print("PluginFlash.mousedown",x,y)
end

PluginFlash.mouseover = function(self,x,y)
	print("PluginFlash.mouseover",x,y)
end

PluginFlash.mousemove = function(self,x,y)
	print("PluginFlash.mousemove",x,y)
end

PluginFlash.mouseup = function(self,x,y)
	print("PluginFlash.mouseup",x,y)
end

        
PluginFlash.keydown = function(self,c,s,a,m,code)
	print("PluginFlash.keydown",c,s,a,m,code)
end

PluginFlash.keypress = function(self,c,s,a,m,code)
	print("PluginFlash.keypress",c,s,a,m,code)
end


PluginFlash.keyup = function(self,c,s,a,m,code)
	print("PluginFlash.keyup",c,s,a,m,code)
end


PluginFlash.dblclick = function(self,x,y)
	print("PluginFlash.dblclick",x,y)
end

