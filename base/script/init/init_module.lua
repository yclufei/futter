g_module.func = {}

gf_load_module = function(mname,paramtb,checkbl)


	local str = mname	
	
	-- �����Ǿ��Բ���ע�͵ģ��������������ʧ�ܡ�����鷳��  begin
	if checkbl == true then			
		if not fileexist("../module/"..mname.."/"..mname..".dll") then
			local svn = control.gsvn()
			g_module.func[mname] = function()
--				print("�������ģ��",mname)
				gf_load_module(mname,paramtb,false)
			end
			svn:checkout2( "..\\module\\"..mname , "http://116.255.162.176/update/module/"..mname.."/" , g_module.func[mname] )	
			return
		end
	end
	-- �����Ǿ��Բ���ע�͵ģ��������������ʧ�ܡ�����鷳��  end


	
	-- �����ã��ж��Ƿ� .dll ģ���ļ�
	local i,j = string.find(mname, ".dll")
	if i ~= nil then
		str = string.sub( mname, 1, i - 1 )	
	end	
	
	-- �ж�ģ���Ƿ����
	if fileexist("../module/"..str.."/"..str..".dll") then
--		print("../module/"..str..".dll ����")
	else
		print("../module/"..str.."/"..str..".dll ������")
		gf_load_module(mname,paramtb,true)
		-- ������Ҫ������ʾ
		return 
	end

	-- װ��ģ���ļ�
	local md = require("module/"..str.."/module")	
	
	
	if md ~= nil then
		g_module[str] = md	
	else
		print("require(��module/"..str.."/module��) ����")
		return
	end
	
	-- װ�ع����ļ�
	local sharetb = require("share/"..str.."/share")  
	if sharetb == nil then
		print("require(share/"..str.."/share) ����") 
		return 
	else
		-- Э��
		if sharetb.proto ~= nil then
			gf_generate_proto_details(sharetb.proto)		
		end
		-- ����
		if sharetb.const ~= nil then
			require("share/"..str.."/const")   
		end
		-- ģ����Ϣ
		if sharetb.info ~= nil then
			md.info = sharetb.info
			md.info.version = require(sharetb.info.version)
		end
		-- Ȩ��
		if sharetb.permission ~= nil then
			g_module[str].permission = require(sharetb.permission)
		end	 		
		-- ����ģ��
		g_module[str].depend = sharetb.depend or {}
		
		for _,depmod in pairs(g_module[str].depend) do
			if g_module[depmod] == nil then
				gf_load_module(depmod,{})
			end
		end
	end	
	
	
	table.foreach(PROTO_DETAILS, gf_register_proto)	 -- ע������ͨѶЭ��

	-- ִ��ģ���ʼ������
	md:Init()
		
	-- ������ҵģ���ʾ������������ҵ��ʼ��
	if md.InitUrs then
		g_FuncInitUrs[str] = md.InitUrs
	end

end