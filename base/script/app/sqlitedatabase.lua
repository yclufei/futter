
gr_module("GmBase")

SqliteDababase = inherit(gscriptsqlite):name("SqliteDababase")


SqliteDababase.init = function (self)

	
	self.dbname = gInfo['path'].."./data"
	
end

