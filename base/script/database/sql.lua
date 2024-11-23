gr_module("GmSql")

sql = inherit(GmSql.set):name("sql")



--[[
 @function init	
 @ 
]]
sql.init = function (self)
	GmSql.set.init(self)
end



--[[
	@function GetMuiltSelectSqlStr
	@param pfields: ��ȡ��ȡ���ֶ��������
	@param orderstr: �������
	@param wherestr: �������
	@param limitstr: ��Ŀ�������
	@ ���� select ���
]]
sql.GetMuiltSelectSqlStr = function(self,pfields,orderstr,wherestr,limitstr)
	local fstr , sorttb = self:GetFieldKeys(true,pfields)
	local wstr = wherestr
	local tmpwstr = self:GetWhereChildSql()	
	if wstr == nil and string.len( tmpwstr ) > 5 then
		 wstr = " where "..tmpwstr
	end	
	if wstr == nil then
		wstr = " " 
	end	
	local sql = "select " .. fstr .. " from " .. self.tablename  .. wstr
	if orderstr ~= nil then
		sql = sql .. orderstr
	end	
	if limitstr ~= nil then
		sql = sql .. limitstr
	end	
	return sorttb , sql..';'
end





--[[
	@function 
	@ �����ֶ�����
	@ ����
]]
sql.GetMuiltDeleteSqlStr = function(self,pfields,orderstr,wherestr,limitstr)
	local fstr , sorttb = self:GetFieldKeys(true,pfields)
	local wstr = wherestr or " where "..self:GetWhereChildSql()
	local sql = "delete from " .. self.tablename .. wstr
	return sql
end





--[[
	@function GetFieldKeys
	@ �����ֶ����ƣ����� insert��select ��igid Ϊ nil ʱ������ clientid �ֶ�
	@ ���� bs_persional_info ���� "outername , birthday , sex"
]]
sql.GetFieldKeys = function(self,igid,keytable)
--	print("ִ��SQL 1")
	local str = ""
	local sorttb = {}
	local i = 1
	local ktb = keytable or self:GetFields(self.tablename)
	if ktb then
		for key,value in pairs( ktb ) do
			--print('sql.GetFieldKeys',key,type(key))
			if type(key) == 'number' then
				if value == "clientid" and igid == nil  then
				else
					if str ~= "" then
						str = str .. ", "
					end
					str = str .. value
					sorttb[value] = i
					i = i + 1
				end
				--print(str)
				--table.print(sorttb)
			else
				if key == "clientid" and  igid == nil  then
				else
					if str ~= "" then
						str = str .. ", "
					end
					str = str .. key
					sorttb[key] = i
					i = i + 1
				end
			end
			--[[
			if key == "clientid" and  igid == nil  then
			else
				if str ~= "" then
					str = str .. ", "
				end
				str = str .. key
				sorttb[key] = i
				i = i + 1
			end
			]]
		end
	end
	return str,sorttb
end





--[[
			@function GetFieldValues
			@ �����ֶε�ֵ��igid Ϊ nil ʱ������ clientid �ֶ�
			@ ���� bs_persional ���� ('name','1920-11-15',0)
]]
sql.GetFieldValues = function(self,igid)
--	print("ִ��SQL 2")
	local valuestr = ""
	local keystr = ""
	local fields = self:GetFields(self.tablename)
	--table.print(fields,self.tablename)
	for key,value in pairs(self.m_Attrs) do
		if value ~= nil and nil ~= fields[key] then
			if key == "clientid" and  igid == nil  then
			else
				if valuestr ~= "" then
					valuestr = valuestr .. ", "
				end	
				if keystr ~= "" then
					keystr = keystr .. ", "
				end		
				local pvalue = nil
				if fields[key] == 1 then -- Ϊ����
					pvalue = tostring(value)
				else
					pvalue = " '"..tostring(value).."' " -- Ϊ�ַ�
				end		
				valuestr = valuestr .. pvalue		
				
				keystr = keystr..key
				
				--print(key,pvalue)
				
			end
		end
	end
	return valuestr,keystr
end






--[[
	@function GetWhereChildSql
	@����
]]
sql.GetWhereChildSql = function(self)
	local str = ""
	for key,value in pairs(self.m_Attrs) do
		if type(value) ~= nil then
		
				local pvalue = nil
				if self:GetFields(self.tablename)[key] == 1 then -- Ϊ����
					pvalue = key .. " = " .. value
				elseif string.len(value) < 20 then
					pvalue = key .. " = " .. " '"..value.."' " -- Ϊ�ַ�
				end
				if pvalue then
					if str ~= "" then
						str = str .. " and "
					end		
					str = str .. pvalue
				end		
				
		end
	end
	--print('sql.GetWhereChildSql ',str)
	--table.print(self.m_Attrs)
	return str
end



sql.GetDBWhereChildSql = function(self)
	local str = ""	
	local fields = self:GetFields(self.tablename)
	for key,value in pairs(self.m_Attrs) do
		if fields[key] ~= nil and value ~= nil and value ~= 'nil' then
			if str ~= "" then
				str = str .. " and "
			end		
			local pvalue = nil
			if fields[key] == 1 then -- Ϊ����
				pvalue = key .. " = " .. value
			else
				pvalue = key .. " = " .. " '"..value.."' " -- Ϊ�ַ�
			end					
			str = str .. pvalue
		end
	end
	if string.len(str) > 3 then
		return str
	end
	return nil
end






--[[
			@function GetUpdateChildSql
			@ �����޸ļ�¼���ַ����� set ��
			@ ���� bs_persional_info ���� set outername = 'name' , sex = 1
]]
sql.GetUpdateChildSql = function(self)
	local str = ""
	for key,value in pairs(self.m_Attrs) do
		if key ~= "clientid" then
			if str ~= "" then
				str = str .. ", "
			end
			local pvalue = nil
			if self:GetFields(self.tablename)[key] == 1 then
				pvalue = value
			else
				pvalue = " '"..value.."' "
			end
			str = str ..key .. "=" .. pvalue		
		end
	end
	return " set "..str
end


--[[
	@function GetRecordCountChildSql
	@ ���ɼ�����Ŀ��䡣
]]
sql.GetRecordCountChildSql = function(self)
	return " count(clientid) "
end


--[[
	@function GetLimitChildSql
	@param p: �ڼ�ҳ
	@param s: ��ȡ��¼��
	@ ���� limit ��䡣
]]
sql.GetLimitChildSql = function(self,p,s)
	return string.format( " limit %s,%s" , p * s , s )
end



