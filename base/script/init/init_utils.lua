--����һ�����Զ�ȫ�ֻ�����module
gr_module = function (name, ...)
	--module�����󽫵��õĺ��������ô�module��Ԫ��
	local gr_func = function(m)
		setmetatable(m,{__index=_G})
	end	
	--���˺�����ӵ�ԭ����ָ���ĺ����б���ȥ
	table.insert(arg,1,gr_func)
	--����ԭʼ��module��������
	module(name, unpack(arg) )	
	--����moduleֻ�����õ�ǰ�������Ļ�������������Ҫ�ֹ�������һ���Ļ���������һ��
	setfenv(2,require(name))
end



