

curlcallbackfunc = {}

curlcount = 1

function _luacallbackwrap(fn)
	curlcount = curlcount + 1
	curlcallbackfunc[curlcount] = fn
	return curlcount
end

function global_curl_printTable(a)
--	table.print(a)
end

function curl_data_getAttrValue(data,atrname)
	if data.attr then
		for a,b in pairs( data.attr ) do
			if b['name'] == atrname then
				if b['attrvalue'] then
					return b['attrvalue']
				else
					return b['title']
				end
			end
		end
	end
	return ""
end

function curl_data_getRelValue(data,clsid)
	if data.rel then
		for a,b in pairs( data.rel ) do
			if b['object'] then
				if b['reltype'] == '4' then
					if b['object']['parent_id'] == clsid then
						return b['object']['title']
					end
				elseif b['reltype'] == '7' then
					if b['object']['clsid'] == clsid then
						return b['object']['objecttitle']
					end
				end
			end
		end
	end
	return ""
end

function curl_data_getAttr(data,atrname)
	if data.attr then
		for a,b in pairs( data.attr ) do
			if b['name'] == atrname then
				return b
			end
		end
	end
end

function curl_data_getRels(data)
	return data.rel
end

function curl_data_getObject(data)
	return data.object
end


function curl_getObject(arr,items)
	if arr then
		for a,b in pairs( arr ) do		
			local allfit = true
			for c,d in pairs(items) do
				if b[c] ~= d then
					allfit = false
				end
			end
			if allfit then
				return b
			end			
		end
	end
	return nil
end



gxo_curlfile = function(file,url,func)
	curlfile(file,url,_luacallbackwrap(func))
end


gxo_curl = function(url,func,param,method,head)
	--print('gxo_curl',url,func)
	--	table.print(param)
	if method then
		local cjson2 = cjson.new()
		
		json_text = ''
		if type(param) == 'table' then
			json_text = cjson.encode(param)
		elseif type(param) == 'string' then
			json_text = param
		end
		
		head_text = cjson.encode(head)
		ajax(url,json_text,_luacallbackwrap(func),true,head_text,method)	
	elseif param then
		local cjson2 = cjson.new()
		
		json_text = ''
		if type(param) == 'table' then
			json_text = cjson.encode(param)
		elseif type(param) == 'string' then
			json_text = param
		end
		
		ajax(url,json_text,_luacallbackwrap(func))	
	else
		ajax(url,_luacallbackwrap(func))	
	end
end