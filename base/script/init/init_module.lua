g_module.func = {}

gf_load_module = function(mname,paramtb,checkbl)


	local str = mname	
	
	-- 这里是绝对不能注释的，否则会引起升级失败。会很麻烦的  begin
	if checkbl == true then			
		if not fileexist("../module/"..mname.."/"..mname..".dll") then
			local svn = control.gsvn()
			g_module.func[mname] = function()
--				print("完成下载模块",mname)
				gf_load_module(mname,paramtb,false)
			end
			svn:checkout2( "..\\module\\"..mname , "http://116.255.162.176/update/module/"..mname.."/" , g_module.func[mname] )	
			return
		end
	end
	-- 这里是绝对不能注释的，否则会引起升级失败。会很麻烦的  end


	
	-- 测试用，判断是否 .dll 模块文件
	local i,j = string.find(mname, ".dll")
	if i ~= nil then
		str = string.sub( mname, 1, i - 1 )	
	end	
	
	-- 判断模块是否存在
	if fileexist("../module/"..str.."/"..str..".dll") then
--		print("../module/"..str..".dll 存在")
	else
		print("../module/"..str.."/"..str..".dll 不存在")
		gf_load_module(mname,paramtb,true)
		-- 这里需要给个提示
		return 
	end

	-- 装载模块文件
	local md = require("module/"..str.."/module")	
	
	
	if md ~= nil then
		g_module[str] = md	
	else
		print("require(‘module/"..str.."/module’) 出错")
		return
	end
	
	-- 装载共享文件
	local sharetb = require("share/"..str.."/share")  
	if sharetb == nil then
		print("require(share/"..str.."/share) 出错") 
		return 
	else
		-- 协议
		if sharetb.proto ~= nil then
			gf_generate_proto_details(sharetb.proto)		
		end
		-- 常量
		if sharetb.const ~= nil then
			require("share/"..str.."/const")   
		end
		-- 模块信息
		if sharetb.info ~= nil then
			md.info = sharetb.info
			md.info.version = require(sharetb.info.version)
		end
		-- 权限
		if sharetb.permission ~= nil then
			g_module[str].permission = require(sharetb.permission)
		end	 		
		-- 依赖模块
		g_module[str].depend = sharetb.depend or {}
		
		for _,depmod in pairs(g_module[str].depend) do
			if g_module[depmod] == nil then
				gf_load_module(depmod,{})
			end
		end
	end	
	
	
	table.foreach(PROTO_DETAILS, gf_register_proto)	 -- 注册网络通讯协议

	-- 执行模块初始化函数
	md:Init()
		
	-- 保存企业模块出示化函数用于企业初始化
	if md.InitUrs then
		g_FuncInitUrs[str] = md.InitUrs
	end

end