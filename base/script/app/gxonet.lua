gr_module("GmBase")

GxoNet = inherit(gscriptgxonet):name("GxoNet")


GxoNet.init = function (self,server,port)
	self.server = server
	self.port = port
    
end


