--[[
	列表管理类
]]

gr_module("GmSql")

list = inherit(GmSql.dao):name("list")


list.init = function(self,db,tb)

	GmSql.dao.init(self)
	
	if db then
		self.dbname = db		
	end
	if tb then
		self.tablename = tb		
	end

	self.m_DefaultKey = 0	
	self.m_RecordCount = -10	
	
	self.idPair = {}
	
	if self.init_table then
		self:init_table()
	end
	
end





list.get_maxminid = function(self,tbname,act)
	if self.idPair[tbname] ~= nil then
		return self.idPair[tbname][act]
	end
end



list.reset_maxminid = function(self,tbname,columnkey)
	if self.idPair[tbname] == nil then
		self.idPair[tbname] = {}
	end
	local bl,rec,c = self:GetRecordsWithStrKey('SELECT MIN(CAST('..columnkey..' as int)) as minid FROM '..tbname)
	if bl and rec == 1 then
		self.idPair[tbname]['next'] = c[0]['minid'] or '0'
	end
	local bl,rec,c = self:GetRecordsWithStrKey('SELECT MAX(CAST('..columnkey..' as int)) as maxid FROM '..tbname)
	if bl and rec == 1 then
		self.idPair[tbname]['prev'] = c[0]['maxid'] or '0'
	end
end




list.GetList = function(self,key)
	local k = key or self.m_DefaultKey
	if self:GetDirty() or self.m_List[k] == nil then
		self:InitList(k)
	end
	return self.m_List[k] or {}
end



list.SetList = function(self,key,list)
	local k = key or self.m_DefaultKey
	self.m_List[k] = list
end



-- 虚函数，用于继承,填充 self.m_List[key] 即可
list.InitList = function(self,key)
	local k = key or self.m_DefaultKey
	local b,r = self:GetRecordsByAttribute()
	if b then
		self:SetList(k,r)
		self:SetDirty(false)
	end
end


-- 产生TABLE的索引
list.MakeTableKey = function(self,tb)
	local key = ""
	for k,v in pairs(tb) do 
		if k ~= 1 then
			if type(v) == "table" then
				key = key..self:MakeTableKey(v)
			else
				key = key..tostring(v)
			end			
		end
	end
	return tostring(key)
end



-- 列表属性组合的索引，用于识别不同的各种属性组合查询的列表
list.MakePageKey = function(self,...)  
	local key = "K"
	local keyvalues = arg
	if not keyvalues or table.size(keyvalues) < 2 then
		keyvalues = self:GetAttrs()
	end		
	if keyvalues then
		for k,v in pairs(keyvalues) do 		
			if type(v) == "table" then
				key = key..self:MakeTableKey(v)
			else
				key = key..tostring(k)..tostring(v)
			end				
		end
	end	
	return md5(tostring(key))
end



list.GetPage2 = function(self,attr,page,pagesize,wherestr,orderstr)
	local index = self:MakePageKey(attr,page,pagesize,wherestr,orderstr)
	if self.m_Pages[index] == nil or table.size(self.m_Pages[index]) == 0 or self:GetDirty() then
		self.m_Pages[index] = self:InitPage2(attr,page,pagesize,wherestr,orderstr)
	end
	return self.m_Pages[index]
end




list.InitPage2 = function(self,attr,page,pagesize,wherestr,orderstr)
	
	if attr then
		self:ClearAttrs()
		self:SetAttrs(attr)
	end
	--
	local lmtstr = self:GetLimitChildSql(page,pagesize)
	print('list.InitPage2',self.tablename,page,pagesize,wherestr,orderstr)
	local b,r,c = self:GetRecordsByAttribute2(nil , orderstr or " order by clientid desc " , wherestr , lmtstr )
	
	if b and type(r) == 'number' and r > 0 then
		self:SetDirty(false)
		return c
	else
		cwarn('list.InitPage2 warn',b,r,c)
		table.print(c)
		return {}
	end
	
end


list.get_ids = function(self,array,key)
	local ids = "0"
	for a,b in pairs(array) do
		ids = ids..","..b[key]
	end
	return ids
end


list.get_number_ids = function(self,array,key)
	local ids = "0"
	for a,b in pairs(array) do
		if tonumber(b[key]) then
			ids = ids..","..tostring( b[key] )
		end
	end
	return ids
end


list.GetTotalCount = function(self)
	if self.m_RecordCount == -10 or self:GetDirty() then
		local sql = "select COUNT(*) as c from " .. self.tablename .." ";
		local a,b,c = self:ExecRetRecord(sql)
		if a and b == 1 then
			self.m_RecordCount = c.c
		end
	end
	return self.m_RecordCount
end


list.is_empty = function(self,tablename)
	self.tablename = tablename
	return self:GetTotalCount() == 0
end


list.GetTotalCountByAttr = function(self,attrs)
	local key = self:MakePageKey(attrs)
	if self.m_RecordCounts[key] == nil or self:GetDirty() then
		self:ClearAttrs()
		self:SetAttrs(attrs)
		local sql = "select COUNT(clientid) as c from " .. self.tablename 
		local w = self:GetWhereChildSql()
		if w and string.len( w ) > 5 then
			sql = sql.." where "..w
		end
		local a,b,c = self:ExecRetRecord(sql)
		if a and b == 1 then
			self.m_RecordCounts[key] = c.c
		end
	end
	return self.m_RecordCounts[key]
end

