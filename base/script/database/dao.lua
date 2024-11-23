gr_module("GmSql")

dao = inherit(GmSql.sql):name("dao")


dao.init = function (self,db,tb)
	GmSql.sql.init(self)
	if db then
		self.dbname = db		
	end
	if tb then
		self.tablename = tb		
	end
end

------------------------------------------------------------------------------------------------ 多条记录 }}

--[[
************************************************************
	@function 	GetRecordsByAttribute
	@intro 		根据设置的属性获取数据表多条记录,用数字索引
	@param		pfields
	@param		querystr
	@param		wherestr
	@param		limitstr
	@return 	返回值
	@example
	************************************************
 	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	obj:GetRecordsByAttribute()
	对象执行:
	select outername from bs_relation where obj_id = 1 and obj_type = 1
	************************************************
************************************************************
]]
dao.GetRecordsByAttribute = function(self,pfields,querystr,wherestr,limitstr)
	local _,sql = self:GetMuiltSelectSqlStr(pfields,querystr,wherestr,limitstr)
	--print(sql)
	return self:GetRecordsWithStrKey(sql)
end

------------------------------------------------------------------------------------------------

--[[
************************************************************
	@function 	GetRecordsByAttribute2
	@intro 		根据设置的属性获取数据表多条记录,用字段名称索引
	@param		pfields
	@param		querystr
	@param		wherestr
	@param		limitstr
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.GetRecordsByAttribute2 = function(self,pfields,querystr,wherestr,limitstr)
	local fieldtb,sql = self:GetMuiltSelectSqlStr(pfields,querystr,wherestr,limitstr)
	--print('GetRecordsByAttribute2',sql,fieldtb )
	local bl,rec,c = self:GetRecordsWithStrKey(sql)
	--print('GetRecordsByAttribute2',sql,c )
	return bl,rec,c
end


--[[
************************************************************
	@function 	GetRecordsByAttribute2
	@intro 		根据对象属性，操作返回字段名称索引的记录
	@param		sql
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.GetRecordsWithStrKey = function(self,sql)
	local a,b,c = self:select_table(sql)
	return a,b,c
end


--[[
************************************************************
	@function 	ModifyRecords
	@intro 		修改多条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ModifyRecords = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil  then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql()
		return self:ExecRecord(sql)
	else
		cerror("发生错误 dao.ModifyRecords")
		return false,"错误 dao.ModifyRecords",0
	end
end

dao._ModifyRecords = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil  then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql()
		return self:_ExecRecord(sql)
	else
		cerror("发生错误 dao.ModifyRecords")
		return false,"错误 dao.ModifyRecords",0
	end
end



------------------------------------------------------------------------------------------------ 多条记录 }}

------------------------------------------------------------------------------------------------ 单条记录 {{



--[[
************************************************************
	@function 	GetRecordByAttributes
	@intro 		根据设置的属性获取数据表单条记录
	@param		sql
	@param		fieldtb
	@return 	返回值
	@example
	************************************************
	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	对象执行:
	select outername from bs_relation where obj_id = 1 and obj_type = 1
	************************************************
************************************************************
]]
dao.DeleteRecordByAttributes = function(self,wherestr)
	local _,sql = self:GetMuiltDeleteSqlStr(wherestr)
	--print("删除多条记录",sql)
	return self:ExecRecord(sql)
end


--[[
************************************************************
	@function 	GetRecordByAttributes
	@intro 		根据设置的属性获取数据表单条记录
	@param		sql
	@param		fieldtb
	@return 	返回值
	@example
	************************************************
	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	对象执行:
	select outername from bs_relation where obj_id = 1 and obj_type = 1
	************************************************
************************************************************
]]
dao.GetRecordByAttributes = function(self,pfields,orderstr,wherestr,limitstr)
	local _,sql = self:GetMuiltSelectSqlStr(pfields,orderstr,wherestr,limitstr)
	return self:ExecGetRecord(sql)
end



--[[
************************************************************
	@function 	ModifyRecordByAttribute
	@intro 		修改单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ModifyRecordByAttribute = function(self,wherestr)
	local ustr = self:GetUpdateChildSql()
	if self.tablename ~= nil and ustr ~= nil then
		local sql = "update "..self.tablename .. ustr.. wherestr
		--print("ModifyRecordByAttribute",sql)
		return self:ExecRecord(sql)
	else
		cerror("发生错误 dao.ModifyRecord 参数为空")
		return false,"错误 dao.ModifyRecord 参数为空",0
	end
end


--[[
************************************************************
	@function 	ModifyRecord
	@intro 		修改单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ModifyRecord = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil and self:GetAttr("clientid") ~= nil then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql().. " where clientid = " .. self:GetAttr("clientid")
		--print(sql)
		return self:ExecRecord(sql)
	else
		cerror("发生错误 dao.ModifyRecord 参数为空")
		return false,"错误 dao.ModifyRecord 参数为空",0
	end
end

dao._ModifyRecord = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil and self:GetAttr("clientid") ~= nil then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql().. " where clientid = " .. self:GetAttr("clientid")
		---print(sql)
		return self:_ExecRecord(sql)
	else
		cerror("发生错误 dao.ModifyRecord 参数为空")
		return false,"错误 dao.ModifyRecord 参数为空",0
	end
end





--[[
************************************************************
	@function 	GetRecord
	@intro 		用设置的 ID 获取单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.GetRecord = function(self,pfields,querystr,wherestr,limitstr)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,querystr,wherestr,limitstr)
	return self:ExecGetRecord(sql)
end

dao.GetRecord2 = function(self,orderstr,wherestr,limitstr,pfields)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,orderstr,wherestr,limitstr)
	return self:ExecGetRecord(sql)
end

dao.GetRecord3 = function(self,wherestr,orderstr,limitstr,pfields)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,orderstr,wherestr,limitstr)
	--print("GetRecord3",sql)
	return self:ExecGetRecord(sql)
end

dao.GetSingleRecord = function(self,pfields,querystr,limitstr,wherestr)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,querystr,wherestr,limitstr)
	--print('GetSingleRecord',sql)
	local a,b,c = self:ExecGetRecord(sql)
	if a and b == 1 then
		--table.print(c)
		return a,b,c[0]
	end
	return a,b,c
end

dao._GetSingleRecord = function(self,pfields,querystr,limitstr,wherestr)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,querystr,wherestr,limitstr)
	local a,b,c = self:_ExecGetRecord(sql)
	if a and b == 1 then
		return a,b,c[0]
	end
	return a,b,c
end


dao.GetSingleRecord2 = function(self,orderstr,wherestr,pfields,limitstr)	
	local _,sql = self:GetMuiltSelectSqlStr(pfields,orderstr,wherestr,limitstr)
	local a,b,c = self:ExecGetRecord(sql)
	if a and b == 1 then
		return a,b, c[0]
	end
	return a,b,c
end





--[[
************************************************************
	@function 	DelRecord
	@intro 		删除单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.DelRecord = function(self,clientid)
	if clientid then
		self:SetAttr("clientid",clientid )
	end
	local sql = self:GetMuiltDeleteSqlStr()
	return self:ExecRecord(sql)
end

dao._DelRecord = function(self,clientid)
	if clientid then
		self:SetAttr("clientid",clientid )
	end
	local sql = self:GetMuiltDeleteSqlStr()
	return self:_ExecRecord(sql)
end






--[[
************************************************************
	@function 	AddRecord
	@intro 		增加单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.AddRecord = function(self,attrs)
	if attrs then
		self:SetAttrs(attrs)	
	end
	local str = "insert into %s (%s) values (%s);"
	local vstr,kstr = self:GetFieldValues()
	local sql = string.format(str,self.tablename,kstr,vstr )
	local a,b,c = self:ExecRecord(sql)
	if a then
		return self:GetSingleRecord()
	end
	return a,b,c
end

dao._AddRecord = function(self,attrs)
	if attrs then
		self:SetAttrs(attrs)	
	end
	local str = "insert into %s (%s) values (%s);"
	local vstr,kstr = self:GetFieldValues()
	local sql = string.format(str,self.tablename,kstr,vstr )
	local a,b,c = self:_ExecRecord(sql)
	if a then
		return self:_GetSingleRecord()
	end
	return a,b,c
end



--[[
************************************************************
	@function 	AddRecordIfNoExist
	@intro 		增加单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.AddRecordIfNoExist = function(self,attrs)
	if attrs then
		self:SetAttrs(attrs)	
	end	
	local a,b,c = self:GetSingleRecord()
	if b == 0 then
		return self:AddRecord()
	end	
	return a,b,c
end

dao.AddRecordIfNoExistID = function(self,attrs)
	if attrs then
		self:SetAttrs(attrs)	
	end	
	local a,b,c = self:GetSingleRecord()
	if b == 0 then
		return self:AddRecord()
	end	
	return a,b,c
end

--[[
************************************************************
	@function 	AddorUpdateRecord
	@intro 		增加或者修改单条记录
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.AddorUpdateRecord = function(self,keyfield,attrs)
	--print('dao.AddorUpdateRecord',keyfield)
	if attrs then
		self:SetAttrs(attrs)	
	end
	local str = "insert or replace into %s (clientid,%s) values ((select clientid from %s where %s = \"%s\"),%s);"
	--table.print(attrs)
	local vstr,kstr = self:GetFieldValues()
	--[[
	print(kstr)
	print(vstr)
	print(self.tablename)
	print(keyfield)
	print(self:GetAttr(keyfield))
	]]
	--print(self.tablename,kstr,self.tablename,keyfield,self:GetAttr(keyfield),vstr)
	local sql = string.format(str,self.tablename,kstr,self.tablename,keyfield,self:GetAttr(keyfield),vstr )
	--print(sql)
	local a,b,c = self:ExecRecord(sql)
	--print(a,b,c)
	if a then
		return self:GetSingleRecord()
	end
	return a,b,c
end


--[[
************************************************************
	@function 	ExecRecord
	@intro 		执行操作，返回成功或失败
	@return 	返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ExecRecord = function(self,sql)
	self:open(self.dbname)
	--print(self.dbname)
	local a,b,c = self:exec_select(sql)
	self:close()	
	return a,b,c
end

dao._ExecRecord = function(self,sql)
	local a,b,c = self:exec_select(sql)
	return a,b,c
end



--[[
************************************************************
	@function 	ExecGetRecord
	@intro 		操作返回的一条记录数据填充属性
	@return 	返回ID
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ExecGetRecord = function(self,sql)
	self:open(self.dbname)
	local a,b,c = self:exec_select(sql)
	self:close()	
	return a,b,c
end
dao._ExecGetRecord = function(self,sql)
	local a,b,c = self:exec_select(sql)
	return a,b,c
end


--[[
************************************************************
	@function 	ExecRetRecord
	@intro 		操作返回一条记录
	@return 	返回记录
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ExecRetRecord = function(self,sql)
	self:open(self.dbname)
	local a,b,c = self:exec_select(sql)
	self:close()	
	if a then
		return a,b,c[0]
	else
		return a,b,c
	end
end


--[[
************************************************************
	@function 	ExecRetRecord
	@intro 		操作返回多条记录
	@return 	返回记录
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ExecRetRecords = function(self,sql)
	self:open(self.dbname)
	local a,b,c = self:exec_select(sql)
	self:close()	
	return a,b,c
end

------------------------------------------------------------------------------------------------ 单条记录 }}



--[[
************************************************************
	@function 	IsDataBaseExis
	@intro 		数据库是否存在
	@return 	返回记录
	@example
	************************************************

	************************************************
************************************************************
]]
dao.IsDataBaseExist = function(self,db)
	local result = true
	local str = "SELECT SCHEMA_NAME FROM SCHEMATA where SCHEMA_NAME='%s';"
	local sql = string.format( str , db )
	self:connect2("information_schema")	
	self:execute(sql)
	local err,id
	self.cursor, err ,id  = self:execute(sql)
	self:close()
	if err == 0 then
		--print("查询结果",cur, err ,id,"数据库不存在")	
		return false
	else
		--print("查询结果",cur, err ,id,"数据库存在")	
		return true	
	end
end


--[[
************************************************************
	@function 	ClearTable
	@intro 		清除表的所有数据
	@return 	返回执行函数返回值
	@example
	************************************************

	************************************************
************************************************************
]]
dao.ClearTable = function(self,tbname)
	local tb = tbname or self.tablename
	return self:ExecRecord("delete from "..tb )
end

dao.createTable = function(self,sql)
	--print(sql)
	self:connect(self.dbname)		
	self:execute(sql)		
	self:close()
	self:initTableStruct(self.dbname)	
end


