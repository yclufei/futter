
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
