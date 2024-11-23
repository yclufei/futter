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
	@param pfields: 获取提取的字段名称语句
	@param orderstr: 排序语句
	@param wherestr: 条件语句
	@param limitstr: 数目限制语句
	@ 生成 select 语句
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
	@ 生成字段名称
	@ 比如
]]
sql.GetMuiltDeleteSqlStr = function(self,pfields,orderstr,wherestr,limitstr)
	local fstr , sorttb = self:GetFieldKeys(true,pfields)
	local wstr = wherestr or " where "..self:GetWhereChildSql()
	local sql = "delete from " .. self.tablename .. wstr
	return sql
end





--[[
	@function GetFieldKeys
	@ 生成字段名称，用于 insert、select ，igid 为 nil 时不包括 clientid 字段
	@ 比如 bs_persional_info 生成 "outername , birthday , sex"
]]
sql.GetFieldKeys = function(self,igid,keytable)
--	print("执行SQL 1")
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
			@ 生成字段的值，igid 为 nil 时不包括 clientid 字段
			@ 比如 bs_persional 生成 ('name','1920-11-15',0)
]]
sql.GetFieldValues = function(self,igid)
--	print("执行SQL 2")
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
				if fields[key] == 1 then -- 为数字
					pvalue = tostring(value)
				else
					pvalue = " '"..tostring(value).."' " -- 为字符
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
	@生成
]]
sql.GetWhereChildSql = function(self)
	local str = ""
	for key,value in pairs(self.m_Attrs) do
		if type(value) ~= nil then
		
				local pvalue = nil
				if self:GetFields(self.tablename)[key] == 1 then -- 为数字
					pvalue = key .. " = " .. value
				elseif string.len(value) < 20 then
					pvalue = key .. " = " .. " '"..value.."' " -- 为字符
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
			if fields[key] == 1 then -- 为数字
				pvalue = key .. " = " .. value
			else
				pvalue = key .. " = " .. " '"..value.."' " -- 为字符
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
			@ 生成修改记录的字符，有 set 了
			@ 比如 bs_persional_info 生成 set outername = 'name' , sex = 1
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
	@ 生成计算数目语句。
]]
sql.GetRecordCountChildSql = function(self)
	return " count(clientid) "
end


--[[
	@function GetLimitChildSql
	@param p: 第几页
	@param s: 提取记录数
	@ 生成 limit 语句。
]]
sql.GetLimitChildSql = function(self,p,s)
	return string.format( " limit %s,%s" , p * s , s )
end



