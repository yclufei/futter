

gr_module("GmSys")

Sqlite = inherit(GmBase.SqliteDababase):name("Sqlite")


Sqlite.init = function (self,dbname)
	GmBase.SqliteDababase.init(self)
	if dbname then
		self.dbname = dbname
	end
end




Sqlite.desc_table = function(self,tbname)

	--print_debug()
	self:open(self.dbname)
	local basesql = "pragma table_info ('%s')"
	local sql = string.format(basesql,tbname)
	local a,b,c = self:exec_select(sql)
	self:close()
	return a,b,c
end


Sqlite.create_table = function(self,tbname,tablefield)	
	self:open(self.dbname)	
	local fieldstr = nil	
	fieldstr = 'clientid integer primary key autoincrement'	
	for key,tb in pairs(tablefield) do	
		fieldstr = fieldstr..","..'"' .. key..'"'
		if tb['i'] then
			fieldstr = fieldstr.." int ("..tostring(tb['i'])..")"
		end
		if tb['t'] then
			fieldstr = fieldstr.." TEXT "
		end		
		if tb['v'] then
			fieldstr = fieldstr.." varchar("..tostring(tb['v'])..")"
		end		
		if tb['r'] then
			fieldstr = fieldstr.." real ("..tostring(tb['r'])..")"
		end				
	end	
	local basesql = "create table if not exists %s (%s)"
	local sql = string.format(basesql,tbname,fieldstr)
	--cwarn('create_table',self.dbname,sql)
	local a = self:exec(sql)
	self:close()	
	return a	
end


Sqlite.select_table = function(self,sql)
	
	--print_debug()
	self:open(self.dbname)
	local a,b,c = self:exec_select(sql)
	self:close()	
	return a,b,c
end

Sqlite.begin = function(self)
	self:open(self.dbname)
	return self:_begin()
end

Sqlite.rollback = function(self)
	local ret = self:_rollback()
	self:close()	
	return ret
end

Sqlite.commit = function(self)
	local ret = self:_commit()
	self:close()	
	return ret
end

Sqlite.update_table = function(self,sql)
	self:open(self.dbname)
	local a,b,c = self:exec_update(sql)
	self:close()	
	return a,b,c
end

Sqlite._update_table = function(self,sql)
	local a,b,c = self:exec_update(sql)
	return a,b,c
end


Sqlite.get_count = function(self,sql)
	local a,b,c = self:exec_select(sql)
	if a then
		for d,e in pairs(c[0]) do
			return true, tonumber(e)
		end
	end
	return false,nil
end
