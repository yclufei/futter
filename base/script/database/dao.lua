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

------------------------------------------------------------------------------------------------ ������¼ }}

--[[
************************************************************
	@function 	GetRecordsByAttribute
	@intro 		�������õ����Ի�ȡ���ݱ������¼,����������
	@param		pfields
	@param		querystr
	@param		wherestr
	@param		limitstr
	@return 	����ֵ
	@example
	************************************************
 	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	obj:GetRecordsByAttribute()
	����ִ��:
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
	@intro 		�������õ����Ի�ȡ���ݱ������¼,���ֶ���������
	@param		pfields
	@param		querystr
	@param		wherestr
	@param		limitstr
	@return 	����ֵ
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
	@intro 		���ݶ������ԣ����������ֶ����������ļ�¼
	@param		sql
	@return 	����ֵ
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
	@intro 		�޸Ķ�����¼
	@return 	����ֵ
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
		cerror("�������� dao.ModifyRecords")
		return false,"���� dao.ModifyRecords",0
	end
end

dao._ModifyRecords = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil  then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql()
		return self:_ExecRecord(sql)
	else
		cerror("�������� dao.ModifyRecords")
		return false,"���� dao.ModifyRecords",0
	end
end



------------------------------------------------------------------------------------------------ ������¼ }}

------------------------------------------------------------------------------------------------ ������¼ {{



--[[
************************************************************
	@function 	GetRecordByAttributes
	@intro 		�������õ����Ի�ȡ���ݱ�����¼
	@param		sql
	@param		fieldtb
	@return 	����ֵ
	@example
	************************************************
	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	����ִ��:
	select outername from bs_relation where obj_id = 1 and obj_type = 1
	************************************************
************************************************************
]]
dao.DeleteRecordByAttributes = function(self,wherestr)
	local _,sql = self:GetMuiltDeleteSqlStr(wherestr)
	--print("ɾ��������¼",sql)
	return self:ExecRecord(sql)
end


--[[
************************************************************
	@function 	GetRecordByAttributes
	@intro 		�������õ����Ի�ȡ���ݱ�����¼
	@param		sql
	@param		fieldtb
	@return 	����ֵ
	@example
	************************************************
	obj:SetAttr("obj_id",1)
	obj:SetAttr("obj_type",1)
	����ִ��:
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
	@intro 		�޸ĵ�����¼
	@return 	����ֵ
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
		cerror("�������� dao.ModifyRecord ����Ϊ��")
		return false,"���� dao.ModifyRecord ����Ϊ��",0
	end
end


--[[
************************************************************
	@function 	ModifyRecord
	@intro 		�޸ĵ�����¼
	@return 	����ֵ
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
		cerror("�������� dao.ModifyRecord ����Ϊ��")
		return false,"���� dao.ModifyRecord ����Ϊ��",0
	end
end

dao._ModifyRecord = function(self)
	if self.tablename ~= nil and self:GetUpdateChildSql() ~= nil and self:GetAttr("clientid") ~= nil then
		local sql = "update "..self.tablename .. self:GetUpdateChildSql().. " where clientid = " .. self:GetAttr("clientid")
		---print(sql)
		return self:_ExecRecord(sql)
	else
		cerror("�������� dao.ModifyRecord ����Ϊ��")
		return false,"���� dao.ModifyRecord ����Ϊ��",0
	end
end





--[[
************************************************************
	@function 	GetRecord
	@intro 		�����õ� ID ��ȡ������¼
	@return 	����ֵ
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
	@intro 		ɾ��������¼
	@return 	����ֵ
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
	@intro 		���ӵ�����¼
	@return 	����ֵ
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
	@intro 		���ӵ�����¼
	@return 	����ֵ
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
	@intro 		���ӻ����޸ĵ�����¼
	@return 	����ֵ
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
	@intro 		ִ�в��������سɹ���ʧ��
	@return 	����ֵ
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
	@intro 		�������ص�һ����¼�����������
	@return 	����ID
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
	@intro 		��������һ����¼
	@return 	���ؼ�¼
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
	@intro 		�������ض�����¼
	@return 	���ؼ�¼
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

------------------------------------------------------------------------------------------------ ������¼ }}



--[[
************************************************************
	@function 	IsDataBaseExis
	@intro 		���ݿ��Ƿ����
	@return 	���ؼ�¼
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
		--print("��ѯ���",cur, err ,id,"���ݿⲻ����")	
		return false
	else
		--print("��ѯ���",cur, err ,id,"���ݿ����")	
		return true	
	end
end


--[[
************************************************************
	@function 	ClearTable
	@intro 		��������������
	@return 	����ִ�к�������ֵ
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


