
print_debug=function()
	print(debug.traceback())
end


local _trace = debug.traceback
local _t_concat = table.concat
local _log = print

function print_stack(...)
    local out = {'[TRACE]'}
    local n = select('#', ...)
    for i=1, n, 1 do
        local v = select(i,...)
        out[#out+1] = tostring(v)
    end
    out[#out+1] = '\n'
    out[#out+1] = _trace("", 2)
    _log(_t_concat(out,' '))
end



debug.pause = function(all)
	cwarn( '=========================================== 调试中断')
	if all then
		local level = 1
		while true do
		
			methon = ""
			local cll = debug.getinfo(level)
			if cll and cll.source ~= 'base/script/util/debug.lua' then
			
				if cll then
					if cll.name == nil then
						return
					end
					local cname = cll.name or 'none'
					methon = cll.source..' '..tostring(cll.currentline)..'行 '..cname..' 函数'
				end
				
				cwarn( '# '..tostring( methon )..'调试中断，局部变量为:')
				
			  local v = {}
			  local idx = 1
			  while true do
					local ln, lv = debug.getlocal(2, idx)
					if ln ~= nil then
						v[ln] = lv
					else
						break
					end
					idx = 1 + idx
				end	
				
				local localvariable = ''
				
				for a,b in pairs(v) do
					localvariable = localvariable..'local '..a..' = v.'..a
					cwarn('local ',a,'=',b)
				end
				

			end
	    level = level + 1
		end
	else

			methon = ""
			local cll = debug.getinfo(3)
			if cll then
				methon = cll.source..' '..tostring(cll.currentline)..'行 '..cll.name..' 函数'
			end
			
			cwarn( '# '..tostring( methon )..'调试中断，局部变量为:')
			
		  local v = {}
		  local idx = 1
		  while true do
				local ln, lv = debug.getlocal(2, idx)
				if ln ~= nil then
					v[ln] = lv
				else
					break
				end
				idx = 1 + idx
			end	
			local localvariable = ''
			for a,b in pairs(v) do
				localvariable = localvariable..'local '..a..' = v.'..a
				cwarn('local ',a,'=',b)
			end
			

	end
end



debug.pause2 = function(all)
	cwarn( '=========================================== 调试中断')
	if all then
		local level = 1
		while true do
		
			methon = ""
			local cll = debug.getinfo(level)
			if cll and cll.source ~= 'base/script/util/debug.lua' then
			
				if cll then
					if cll.name == nil then
						return
					end
					local cname = cll.name or 'none'
					methon = cll.source..' '..tostring(cll.currentline)..'行 '..cname..' 函数'
				end
				
				cwarn( '# '..tostring( methon )..'调试中断，局部变量为:')
				
			  local v = {}
			  local idx = 1
			  while true do
					local ln, lv = debug.getlocal(2, idx)
					if ln ~= nil then
						v[ln] = lv
					else
						break
					end
					idx = 1 + idx
				end	
				
				local localvariable = ''
				
				for a,b in pairs(v) do
					localvariable = localvariable..'local '..a..' = v.'..a
					cwarn('local ',a,'=',b)
				end
				
				local exestr = pause()
				if exestr and string.len(exestr) > 3 then
				
					local str = [[
				     return function(self,v) 
				     	%s
				     	%s
				     end
					]]
					cwarn('执行结果:')
					local func = loadstring(string.format(str,localvariable,exestr))()
					
					local status,err = pcall(func,localvariable.self,v)
					if not status then
					    local code = err.code and tonumber(err.code) or 500
					    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
					    cwarn('debug.pause ERROR',code,msg )
					end	
				--else
					--cwarn('执行语句为空')
				end
			end
	    level = level + 1
		end
	else

			methon = ""
			local cll = debug.getinfo(3)
			if cll then
				methon = cll.source..' '..tostring(cll.currentline)..'行 '..cll.name..' 函数'
			end
			
			cwarn( '# '..tostring( methon )..'调试中断，局部变量为:')
			
		  local v = {}
		  local idx = 1
		  while true do
				local ln, lv = debug.getlocal(2, idx)
				if ln ~= nil then
					v[ln] = lv
				else
					break
				end
				idx = 1 + idx
			end	
			local localvariable = ''
			for a,b in pairs(v) do
				localvariable = localvariable..'local '..a..' = v.'..a
				cwarn('local ',a,'=',b)
			end
			
			local exestr = pause()
			if exestr and string.len(exestr) > 1 then
			
				local str = [[
			     return function(self,v) 
			     	%s
			     	%s
			     end
				]]
				cwarn('执行结果:')
				local func = loadstring(string.format(str,localvariable,exestr))()
				
				local status,err = pcall(func,localvariable.self,v)
				if not status then
				    local code = err.code and tonumber(err.code) or 500
				    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
				    cwarn('debug.pause ERROR',code,msg )
				end	
			else
				cwarn('执行语句为空')
			end
	end
end

function __G__TRACKBACK__(msg)
    local message = debug.traceback(msg, 3)
    print("----------------------------------------")
    print("error message\nlua error:\n\t" .. message)
    print("----------------------------------------")
    return msg
end