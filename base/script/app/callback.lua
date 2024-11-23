
gr_module("GmBase")

CallBack = inherit():name("CallBack")

CallBack.init = function (self)

	local top = self
	
	-- �������� self.callbackfunc['GmBase.discuznet.forum_type_thread'] = { [1] = table,[2] = function }
	self.callbackfunc = {}
	
end


-- �ص����������ڼ̳�
CallBack.callback = function(self,key,a,b,c,d,e,f,g)
	print("CallBack.callback noimpl ",key)
	return false
end

-- ����ص�
CallBack.handle_callback = function(self,key,a,b,c,d,e,f,g)
	if self.callbackfunc[key] and table.size(self.callbackfunc[key]) > 0 then
		for aa,bb in pairs(self.callbackfunc[key]) do	
			--print('CallBack.handle_callback',aa,bb)
			if bb ~= nil then
				local ok = false
				local errors = false
				if type(bb) == 'function' then -- �����������Ǻ���
					ok, errors = xpcall(function() return bb(bb,a,b,c,d,e,f,g) end, debug.traceback)
				elseif type(bb) == 'table' and bb.callback then -- �����������������
					ok, errors = xpcall(function() return bb:callback(key,a,b,c,d,e,f,g) end, debug.traceback)
				else
					cerror("CallBack.handle_callback callback noimpl ",bb._ID,key)
				end
				if errors and not ok then
					cerror('CallBack.handle_callback errors remove', key,aa, ok, errors)
					self.callbackfunc[key][aa] = nil
				end
			end
		end
	else
		cerror("CallBack.handle_callback no key ",key)
	end
end


-- ��ӻص�����
CallBack.add_callback = function(self,key,ctrl)

	if key == '' or key == 'objectlistarea' then
		cerror('CallBack.add_callback key error',key)
		print(debug.traceback())
		return
	end

	-- ����Ƿ��лص����飬û���򴴽�
	if self.callbackfunc[key]  == nil then
		self.callbackfunc[key] = {}
	end
	
	if self.callbackfunc[key] then
		-- ����Ƿ��Ѿ���ӹ���
		for aa,bb in pairs(self.callbackfunc[key]) do	
			if bb == ctrl then
				cwarn('CallBack.add_callback error : exist key',key,ctrl._ID)
				--print_debug()
				return
			end
		end
		--cwarn('CallBack.add_callback',key,self,ctrl)
		--print_debug()
		table.insert(self.callbackfunc[key],ctrl)
	end
	
end


-- ɾ��һ���ص�����
CallBack.remove_callback = function(self,key,ctrl)
	if self.callbackfunc[key]  ~= nil then
		for a,b in pairs(self.callbackfunc[key]) do
			if b == ctrl then
				--cwarn("#################################################### remove_callback",self,key,ctrl)
				self.callbackfunc[key][a] = nil
			end
		end
	end
end


-- ����ص�����
CallBack.clear_callback = function(self,key)
	--print("#################################################### clear_callback",self)
	if key then
		self.callbackfunc[key] = {}
	else
		self.callbackfunc = {}
	end
end


