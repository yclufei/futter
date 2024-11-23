


-- 将属性转成key、word对
function makeAttrArray(attr)
	local attrarray = {}
	for a,b in pairs(attr) do
		attrarray[a] = b['attrvalue']
	end
	return attrarray
end


function makeTimeNumber(srcDateTime)
		local Y = tonumber( string.sub(srcDateTime,1,4) )
		local M = tonumber( string.sub(srcDateTime,6,7) )
		local D = tonumber( string.sub(srcDateTime,9,11) )		
		local h = tonumber( string.sub(srcDateTime,12,13) )
		local m = tonumber( string.sub(srcDateTime,15,16) )
		local s = tonumber( string.sub(srcDateTime,18,21) )
		return Y,M,D,h,m,s
end


function makeTimeString(srcDateTime,needtime)
	local ret = ""
		local Y = string.sub(srcDateTime,1,4)
		local M = string.sub(srcDateTime,6,7)
		local D = string.sub(srcDateTime,9,11)		
		ret = Y.."年"..M.."月"..D.."日"		
		if needtime then
			local h = string.sub(srcDateTime,12,13)
			local m = string.sub(srcDateTime,15,16)
			local s = string.sub(srcDateTime,18,21)
			ret = ret..h.."时"..m.."分"..s.."秒"
		end
		return ret
end


function makeTimeDisString(srcDateTime)
	local Y,M,D,h,m,s = makeTimeNumber(srcDateTime)
	local tab = os.date("*t")
	if tab.year > Y then
		return tostring(tab.year-Y)..'年前'
	end
	if tab.month > M then
		return tostring(tab.month-M)..'月前'
	end
	if tab.day > D then
		return tostring(tab.day-D)..'天前'
	end
	if tab.hour > h then
		return tostring(tab.hour-h)..'小时前'
	end
	if tab.min > m then
		return tostring(tab.min-m)..'分钟前'
	end
	return "刚刚"
end

-------------------------------------------------------------------------------------------------



function gf_make_url_param(oname,array)
	local str = oname
	local user = gApp:get_my(CONST_CLASS.USER)
	if user then
		array['urs'] = user['id']
	end
	for a,b in pairs(array) do
		if a then
			str = str.."/"..tostring(a).."/"..tostring(b)
			array[a] = nil
		end
	end
	array = nil
	return g_serverAddress..str
end


function gf_make_url_base64_param(oname,array)
	local str = oname
	local user = gApp:get_my(CONST_CLASS.USER)
	if user then
		array['urs'] = user['id']
	end
	for a,b in pairs(array) do
		if a then
			str = str.."/"..tostring(a).."/"..tostring(b)
			array[a] = nil
		end
	end
	array = nil
	local paramstr = webencrypt(str,"6gg54qwe")
	return g_serverAddress..paramstr
end

function gf_make_param(src,target,key)
	if src[key] and string.len( src[key] ) > 0 then
		target[key] = cf_escape( string.trim( src[key] ) )
	end	
end

function gf_make_param_by_value(tb,key,item)
	if item~= nil and string.len( item ) > 0 then
		tb[key] = cf_escape( string.trim( item ) )
	end	
end

function gf_make_des_param_by_value(tb,key,item)
	if item~= nil and string.len( item ) > 0 then
		tb[key] = des( string.trim( item ) )
	end	
end

function gf_make_param_by_value_no_esc(tb,key,item)
	if item~= nil and string.len( item ) > 0 then
		tb[key] = string.trim( item )
	end	
end

---------------------------------------------------------------------------------------------

gf_makeObjectData = nil




function _makeObjectAttr(ret,data)
	if data then
		for a,b in pairs(data) do
			if b['attrvalue'] then
				ret[a] = b['attrvalue']
			end
		end
	end
end

function _makeObjectRel(ret,data)
	if data then
		for a,b in pairs(data) do
			if b['relationname'] then
				local key = b['relationname']
				if ret[key] == nil then
					ret[key] = {}
				end					
				local subtype = b['relsubtype']		
				if key and subtype and b['object'] then			
					if subtype == "5" then
						ret[key] = gf_makeObjectData(b)
					else
						local id = b['object']['id']
						if id then
							ret[key][id] = gf_makeObjectData(b)
						end
					end
				end
			end
		end
	end
end


_makeObjectData = function(data)
	if data then		
		local ret = {}
		for k, v in pairs(data) do
			local value_type = type(v)
			if value_type == "table" then
				if k == "rel" then
					_makeObjectRel(ret,v)
				elseif k == "attr" then
					_makeObjectAttr(ret,v)
				end
			elseif value_type == "number" then
				ret[k] = v
			elseif value_type == "string" then
				ret[k] = v				
			elseif value_type == "nil" then
				ret[k] = null
			elseif value_type == "boolean" then
				ret[k] = v
			end				
		end
		--ret['IsObject'] = true
		return ret
	end	
	return nil
end



gf_makeObjectData = function(data)
	if data and data['IsObject'] == nil then	
		if data['relationname'] then	
			if data['object'] then
				local retarray =  _makeObjectData(data['object'])
				local rel = {}
				for k, v in pairs(data) do
					local value_type = type(v)
					if value_type == "number" then
						rel[k] = v
					elseif value_type == "string" then
						rel[k] = v
					elseif value_type == "boolean" then
						rel[k] = v
					end				
				end
				if retarray['rel'] == nil then
					retarray['rel'] = {}
				end
				local relid = data['id']
				retarray['rel'][relid] = rel
				retarray['relationid'] = relid
				return retarray				
			end
		elseif data['objecttitle'] then
			return _makeObjectData(data)
		end		
	end	
	return data
end



