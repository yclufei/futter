
--print("requite util.table")

-- 输出值
output_value = function(value)
	if not value then return "nil" end
	local str, value_type
	value_type = type(value)
	--print(value_type)
	if value_type == "number" then
		str = string.format("[ %s ]n", tostring(value) )
	elseif value_type == "string" then
		str = string.format("[ \"%s\" ]s", value)
	elseif value_type == "table" then
		str = string.format("[ 0x%s ]t", string.sub(tostring(value), 8))
	elseif value_type == "function" then
		str = string.format("[ 0x%s ]f", string.sub(tostring(value), 11))
	elseif value_type == "userdata" then
		str = string.format("[ 0x%s ]u", string.sub(tostring(value), 11))
	else
		str = string.format("[ \S\"%s\" ]%s", tostring(value), type(value))
	end
	return str
end



-- 打印表数据
PrintTable = function(t, tname, print_one_level)
	--	print(tname,t,print_one_level)
	--print(debug.traceback())
	if type(t) ~= "table" then
		print("table.print() not a table")
		return
	end
	local _deep_count = 0
	local print_one_table
	local max_deep = deep or 10
	local printed_tables = {}
	local t_path = {}
	tname = tname or "root_table"
	local ttname = tname
	print_one_table = function(tb, tb_name, print_one_level)
		tb_name = tb_name or "table"			
		table.insert(t_path, tb_name)
		local tpath, i, tname = ""
		for i, pname in pairs(t_path) do
			tpath = tpath.."."..pname
		end
		printed_tables[tb] = tpath
		_deep_count = _deep_count + 1
		local k, v, str
		local tab = string.rep(" ", _deep_count*4)
		--print(string.format("%s  [ 0x%s ]t\n%s  {    ", tab, string.sub(tostring(tb), 8), tab))
		--print(string.format("%s  %s",tab, ttname or 'table'))
		print(string.format("%s  {", tab))
		for k, v in pairs(tb) do
			if type(v) == "table" then
				if printed_tables[v] then
					str = string.format("%s    %s = [ %s ]t", tab, output_value(k), printed_tables[v])
					print(str)
				elseif not print_one_level then
					str = string.format("%s    %s = ", tab, output_value(k))
					print(str)
					print_one_table(v, tostring(k))
				else
					str = string.format("%s    %s = %s", tab, output_value(k), output_value(v))
					print(str)
				end
			else
				str = string.format("%s    %s = %s", tab, output_value(k), output_value(v))
				print(str)
			end
		end
		print(tab.."  }")
		table.remove(t_path)
		_deep_count = _deep_count - 1
	end	
	print_one_table(t, tname, print_one_level)
	printed_tables = nil
	print("\n")
end


table.print = PrintTable



--Data是序列化的数据(字符串)
function StringToTable(data)
	-- print("--------------[[["..data.."]]]----------")
	return assert(loadstring("return "..data))()
end

function TableToString(Object)
	local function ConvSimpleType(v)
		if type(v)=="string" then
			return string.format("%q",v)
		end
		return tostring(v)
	end
	local function RealFun(Object, Depth)
		-- 用深度来控制循环引用
		Depth = Depth or 0
		Depth = Depth + 1
		assert(Depth<20, "too long Depth to serialize")

		if type(Object) == 'table' then
			--if Object.__ClassType then return "<Object>" end
			local Ret = {}
			table.insert(Ret,'{')
			for k, v in pairs(Object) do
				--print ("serialize:", k, v)
				local _k = ConvSimpleType(k)
				if _k == nil then
					error("key type error: "..type(k))
				end
				table.insert(Ret,'[' .. _k .. ']')
				table.insert(Ret,'=')
				table.insert(Ret,RealFun(v, Depth))
				table.insert(Ret,',')
			end
			table.insert(Ret,'}')
			return table.concat(Ret)
		else
			return ConvSimpleType(Object)
		end
	end
	
	return RealFun(Object)
end



table.size = function(tb)
	if type(tb) ~= "table" then return 0 end	
	local k, i = nil, 0
	for k in pairs(tb) do
		i = i + 1
	end
	return i
end




-- 合并表格
table.unite = function( ... )
	local rettb = {}
	local u = function(_,tb)
		if type(tb) ~= "number" then
			local rtb = rettb
			--print("@1")
			local n = function(key,stb)
				--print("@2")
				if type( key ) == "number" then
					table.insert( rtb , stb )
					--print("@5")
				else
					rtb[key] = stb
					--print("@4")
				end
				--print("@3")
			end
			table.foreach( tb, n )
		end
	end
	table.foreach( arg , u )	
	return rettb
end

-- table 排序
function GSortIndex(a,b) 
	return string.lower(a) < string.lower(b);
end
		
function GSortedPairs(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,comparator);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end

-- table 排序
function GSortIndex2(a,b) 
	return string.lower(a) > string.lower(b);
end
		
function GSortedPairs2(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,GSortIndex2);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end


function GSortIndex3(a,b) 
	return tonumber(a) > tonumber(b);
end		
function GSortedPairs3(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,GSortIndex3);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end

function GSortIndex4(a,b) 
	return tonumber(a or 0) < tonumber(b or 0)
end		
function GSortedPairs4(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,GSortIndex4);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end


--[[
            [ 6 ]n = [ 0 ]n
            [ 2 ]n = [ 1 ]n
            [ 8 ]n = [ 1 ]n
            [ 3 ]n = [ "2222222" ]s
            [ 1 ]n = [ "1111" ]s
            [ 4 ]n = [ 0 ]n
            [ 5 ]n = [ "未安装模块" ]s
            [ 7 ]n = [ 37 ]n

            [ "description" ]s = [ 1 ]n
            [ "type" ]s = [ 2 ]n
            [ "sort" ]s = [ 8 ]n
            [ "outername" ]s = [ 5 ]n
            [ "id" ]s = [ 7 ]n
            [ "level" ]s = [ 6 ]n
            [ "parent" ]s = [ 4 ]n
            [ "innername" ]s = [ 3 ]n
]]
table.TransToStrKey = function(data)
	local tb = {}
	local fieldindex = data["field"]
	for key,vtb in pairs(data) do		
		if type(key) == "number" and table.size(vtb) > 0 then
			tb[key] = {}
			for k,index in pairs(fieldindex) do							
				local f = fieldindex[k]
				print(f,index)	
				tb[key][ k ] = vtb[f]
			end
		end
	end
	return tb
end

table.TransToIndex = function(arr,keyname)
	local tb = {}
	for key,vtb in pairs(arr) do		
		local idx = vtb[keyname]
		tb[idx] = vtb
	end
	if table.size(tb) > 0 then
		return tb
	else
		printf('table.TransToIndex error')
		return {}
	end
end

table.TransToNumKey = function(data)

	local tb = {}
	local fieldindex = {}
	local index = 0
	local bl = true 
	
	for key,vtb in pairs(data) do		
	
		if bl then
			for k,v in pairs(vtb) do		
				if type(k) == "string" then
					index = index + 1
					fieldindex[k] = index
				end
			end
			bl = false
		end
		
		tb[key] = {}
		for k,v in pairs(vtb) do		
			if type(k) == "string" then
				local f = fieldindex[k]
				tb[key][f] = v
			end
		end		
		
	end
	
	return tb
	
end


function Copy(src, rel)
	local rel = rel or {}
	if type(src) ~= "table" then
		return rel
	end
	for k, v in pairs(src) do
		rel[k] = v
	end
	return rel
end

table.DeepCopy = function(src, quiet)

	if type(src) ~= "table" then
		return src
	end
	
	local cache = {}
	
	local function clone_table(t, level)
	
		if not level then
			level = 0
		end

		if level > 20 then
			if not quiet then
				error("table clone failed, ".."source table is too deep!")
			else
				return t
			end
		end

		local k, v
		local rel = {}
		for k, v in pairs(t) do
			--if k == "Name" then print(k, tostring(v)) end
			if type(v) == "table" then
				if cache[v] then
					rel[k] = cache[v]
				else
					rel[k] = clone_table(v, level+1)
					cache[v] = rel[k]
				end
			else
				rel[k] = v
			end
		end
		setmetatable(rel, getmetatable(t))
		return rel
	end
	return clone_table(src)
end

function isTable(tb)
	return type(tb) == "table"
end

function isString(s)
	return type(s) == "string"
end

function isNumber(s)
	return type(s) == "number"
end


table.write_file = function(f,t)
		  file = io.open(f, "w")
		  file:write(TableToString(t))
		  file:close()
end



-- table 排序
function GIDSortIndex(a,b) 
	return string.tonumber(a) < string.tonumber(b);
end		
function GIDSortedPairs(t,comparator)
        local sortedKeys = {};
        table.foreach(t, function(k,v) table.insert(sortedKeys,k) end);
        table.sort(sortedKeys,GIDSortIndex);
        local i = 0;
        local function _f(_s,_v)
                i = i + 1;
                local k = sortedKeys[i];
                if (k) then
                        return k,t[k];
                end
        end
        return _f,nil,nil;
end

table.eq = function(table1, table2)
   local avoid_loops = {}
   local function recurse(t1, t2)
      -- compare value types
      if type(t1) ~= type(t2) then return false end
      -- Base case: compare simple values
      if type(t1) ~= "table" then return t1 == t2 end
      -- Now, on to tables.
      -- First, let's avoid looping forever.
      if avoid_loops[t1] then return avoid_loops[t1] == t2 end
      avoid_loops[t1] = t2
      -- Copy keys from t2
      local t2keys = {}
      local t2tablekeys = {}
      for k, _ in pairs(t2) do
         if type(k) == "table" then table.insert(t2tablekeys, k) end
         t2keys[k] = true
      end
      -- Let's iterate keys from t1
      for k1, v1 in pairs(t1) do
         local v2 = t2[k1]
         if type(k1) == "table" then
            -- if key is a table, we need to find an equivalent one.
            local ok = false
            for i, tk in ipairs(t2tablekeys) do
               if table_eq(k1, tk) and recurse(v1, t2[tk]) then
                  table.remove(t2tablekeys, i)
                  t2keys[tk] = nil
                  ok = true
                  break
               end
            end
            if not ok then return false end
         else
            -- t1 has a key which t2 doesn't have, fail.
            if v2 == nil then return false end
            t2keys[k1] = nil
            if not recurse(v1, v2) then return false end
         end
      end
      -- if t2 has a key which t1 doesn't have, fail.
      if next(t2keys) then return false end
      return true
   end
   return recurse(table1, table2)
end


function GSortedStringPairs(t)
    local a = {}
    local b = {}
	
		local idx = 0
    for n in pairs(t) do
	idx = idx + 1
	local len = string.len(n) * 100
       a[len + idx] = n
       b[#b+1] = len + idx
    end
    table.sort(b)	    
    local i = 0
    return function()
	i = i + 1
	local k = b[i]
	return a[k], t[a[k]]
    end
end

table.has_key = function(arr,fkey)
	print('haskey',arr,fkey)
	for key,vtb in pairs(arr) do		
		if key == fkey then
			return true
		end
	end
	return false
end

table.merge = function( tDest, tSrc )
    for k, v in pairs( tSrc ) do
        tDest[k] = v
    end
end