gr_module("GmSql")


field = inherit(GmSys.Sqlite):name("field")


-- 初始化
field.init = function (self)	
	GmSys.Sqlite.init(self)
end


field.m_TableStruct = {}


-- 初始化必须数据表的表结构
field.initTableStruct = function(self,db)

	local dbname = db
	local this = self

	local a,b,tbns = self:select_table("SELECT name FROM sqlite_master WHERE type='table';")
	
	if a then
	
		local tb = {}	
		
		for _,ttb in pairs(tbns) do
		
			local tbname = ttb['name']
			table.insert(tb, tbname)
			field.m_TableStruct[tbname] = {}
			
			local ca,cb,cc = self:desc_table(tbname)
			if ca then
				for key,ctb in pairs(cc) do
					if string.find( ctb.type , "varchar" ) or string.find( ctb.type , "TEXT" ) then
						GmSql.field.m_TableStruct[tbname][ctb.name]	= 2
					else
						GmSql.field.m_TableStruct[tbname][ctb.name]	= 1
					end
				end
			end

		end

	end

	--table.print(GmSql.field.m_TableStruct)

end




-- 获取表格的所有字段
field.GetFields = function(self,tablename)
	if tablename == nil then
		return GmSql.field.m_TableStruct
	else
		if GmSql.field.m_TableStruct[tablename] == nil then
			print('!!! field.GetFields error no ',tablename)
			print_debug()
		else
			return GmSql.field.m_TableStruct[tablename]
		end
	end
end
