-- 判断utf8字符byte长度
-- 0xxxxxxx - 1 byte
-- 110yxxxx - 192, 2 byte
-- 1110yyyy - 225, 3 byte
-- 11110zzz - 240, 4 byte
local function chsize(char)
    if not char then
        print("not char")
        return 0
    elseif char > 240 then
        return 4
    elseif char > 225 then
        return 3
    elseif char > 192 then
        return 2
    else
        return 1
    end
end

-- 计算utf8字符串字符数, 各种字符都按一个字符计算
-- 例如utf8len("1你好") => 3
function utf8len(str)
    local len = 0
    local currentIndex = 1
    while currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + chsize(char)
        len = len +1
    end
    return len
end

-- 截取utf8 字符串
-- str:            要截取的字符串
-- startChar:    开始字符下标,从1开始
-- numChars:    要截取的字符长度
function utf8sub(str, startChar, numChars)
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + chsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + chsize(char)
        numChars = numChars -1
    end
    return str:sub(startIndex, currentIndex - 1)
end

string.trim = function (s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

string.tonumber = function(num)
	if type(num) == "string" then
		return tonumber(num)
	else
		return num
	end
end

string.split = function(szFullString, szSeparator)--单独写的split，把一个字符串以给点字符分隔开。
		local nFindStartIndex = 1
		local nSplitIndex = 1
		local nSplitArray = {}
		while true do
			local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
			if not nFindLastIndex then
				nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
				break
			end
		   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		   nSplitIndex = nSplitIndex + 1
		end
		return nSplitArray
end 

function string.isnumber(str)
	return tostring(tonumber(str)) == str 
end

function string.ConverEntName(srcdbname)
	local buflen = string.len(srcdbname)
	local innername = "ENT_"
	for i=1, string.len(srcdbname) do
		innername = innername .. string.format("%2X", string.byte(srcdbname,i,i))
	end
	if innername ~= "" then
		return innername
	else
		return nil
	end
end

function string.time2number(srcDateTime)
 		--1024-00-11 00:00:00
		--1234567890123456789
    --从日期字符串中截取出年月日时分秒  
    local Y = string.sub(srcDateTime,1,4)  
    local M = string.sub(srcDateTime,6,7)  
    local D = string.sub(srcDateTime,9,10)  
    local H = string.sub(srcDateTime,12,13)  
    local MM = string.sub(srcDateTime,15,16)  
    local SS = string.sub(srcDateTime,18,19)  
    --把日期时间字符串转换成对应的日期时间  
    local dt1 = os.time{year=Y, month=M, day=D, hour=H,min=MM,sec=SS}  
    return dt1
end

function string.stamp2date(time_stamp)
  local datetime = os.date("%Y-%m-%d %H:%M:%S", time_stamp)
  return datetime
end

function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function encodeURI2(s)
    s = string.gsub(s, "([^%w%- ])", function(c) return string.format("_%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function _decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end


unescape = function(w)  
    s=string.gsub(w,"+"," ")  
    s,n = string.gsub(s,"%%(%x%x)",function(c)  
        return string.char(tonumber(c,16))  
    end)  
    return s  
end 
	

function _encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function DelS(s)
	assert(type(s)=="string")
	return s:match("^%s+(.-)%s+$")
end



-- 字符串替换【不执行模式匹配】
-- s       源字符串
-- pattern 匹配字符串
-- repl    替换字符串
--
-- 成功返回替换后的字符串，失败返回源字符串
string.replace = function(s, pattern, repl)
    local i,j = string.find(s, pattern, 1, true)
    if i and j then
        local ret = {}
        local start = 1
        while i and j do
            table.insert(ret, string.sub(s, start, i - 1))
            table.insert(ret, repl)
            start = j + 1
            i,j = string.find(s, pattern, start, true)
        end
        table.insert(ret, string.sub(s, start))
        return table.concat(ret)
    end
    return s
end
