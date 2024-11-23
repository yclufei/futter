
--[[
	self.xp = GmBase.Xmpp("192.168.1.126")
	self.xp:login("lufei@192.168.1.126","lufei")
	
	
	available --(默认)用户空闲状态
	unavailable--用户没空看消息
	subscribe--请求加别人为好友
	subscribed--确认别人对自己的好友请求
	unsubscribe--请求删除好友
	unsubscribed--拒绝对方的添加请求
	error --当前状态packet有错误


]]


gr_module("GmBase")

Xmpp = inherit(gscriptxmpp,GmBase.CallBack):name("Xmpp")


Xmpp.instance = nil


Xmpp.get_instance = function(server)
	if GmBase.Xmpp.instance == nil then
		GmBase.Xmpp.instance = GmBase.Xmpp(server)
	end
	return GmBase.Xmpp.instance
end



Xmpp.init = function (self,server)
	GmBase.CallBack.init(self)
	self.handlefuncs = {}
	self.msgfuncs = {}
	self.connected = false
	self:connect(server) 
end


Xmpp.add_handler = function(self,name,func)
	self.handlefuncs[name] = func
end


Xmpp.add_msg_handler = function(self,name,func)
	self.msgfuncs[name] = func
end



Xmpp.on_recv_msg = function(self,jid,msg)
	local jidarray = string.split(jid,"@")
	local name = jidarray[1]
	if self.msgfuncs[name] then
		self.msgfuncs[name](name,msg)
	end
end

Xmpp.login = function(self,key,u,p)
	if 1 then-- self.connected then
		self:user_login(key,u,p)
	else
--		aprint("not connect")
	end
end

Xmpp.register = function(self,key,u,p,e,n)
	if 1 then -- self.connected then
		self:user_register(key,u,p,e,n)
	else
--		aprint("not connect")
	end
end

Xmpp.on_connected = function(self,b,c)
	print('xmpp on_connected',self,b,c)
	self:handle_callback('on_connected',b,c)
end
	
Xmpp.on_result = function(self,b,islogin,xmlstr)
	print('xmpp on_result',self,b,islogin,xmlstr)
	local xmltable = self:translate_xml(xmlstr)
	self:handle_callback('on_result',xmltable)
end
	
Xmpp.on_recv_msg = function(self,urs,msg,d,xmlstr)
	print('xmpp on_recv_msg',self,urs,msg,d,xmlstr)
	if xmlstr then
		local xmltable = xml.eval(xmlstr)
		self:handle_callback('on_recv_msg',xmltable)
	else
		self:handle_callback('on_recv_msg',urs,msg)
	end
end
	
Xmpp.on_recv_msg2 = function(self,xmlstr)
	if xmlstr and string.len(xmlstr) then
		print('xmpp on_recv_msg2',self,xmlstr)
		local xmltable = self:translate_xml(xmlstr)
--		table.print(xmltable)
		self:handle_callback('on_recv_msg2',xmltable)
	else
		print('xmpp on_recv_msg2 error',self,xmlstr)
	end
end
	
Xmpp.on_iq_result = function(self,xmlstr)
	local xmltable = xml.eval(xmlstr)
	print('xmpp on_iq_result',self,xmlstr)
	self:handle_callback('on_iq_result',xmltable)
end
	
Xmpp.on_presence_handler = function(self,xmlstr)
	print('xmpp on_presence_handler',self,xmlstr)
	local xmltable = xml.eval(xmlstr)
	self:handle_callback('on_presence_handler',xmltable)
end
	
Xmpp.on_version_handler = function(self,b,xmlstr)
	print('xmpp on_version_handler',self,b)
	local xmltable = xml.eval(xmlstr)
	self:handle_callback('on_version_handler',xmltable)
end
	
Xmpp.result_handler = function(self,b,xmlstr)
	print('xmpp result_handler',self,b)
	local xmltable = xml.eval(xmlstr)
end


Xmpp.translate_node = function(self,newtb,tb)
	local key = 'data'	
	if tb[0] and tb[1] and type(tb[1]) == 'string' then
		key = tb[0]
		newtb[key] = tb[1]
		return newtb
	end	
	if tb[0] then
		key = tb[0]
		newtb[key] = {}
		newtb = newtb[key]
	end	
	if tb[1] then
		if type(tb[1]) == 'string' then
			newtb[key] = tb[1]
		elseif type(tb[1]) == 'table' then
			if tb[1][0] then
				local childkey = tb[1][0]
				if type(tb[1][1]) == 'string' then
					newtb[childkey] = tb[1][1]
				else
					self:translate_node(newtb,tb[1])
				end
			end
		end
	end	
	for a,b in pairs(tb) do 
		if a ~= "xmlns" then
			if type(a) == 'string' and type(b) == 'string' then
				newtb[a] = b
			end
			if type(a) == 'number' and type(b) == 'table' then
				self:translate_node(newtb,b)
			end
		end
	end
	return newtb
end

Xmpp.remove_xmlns = function(self,tb)
	if type(tb) == 'table' then
		local newtb = {}
		for a,b in pairs(tb) do
			if a ~= "xmlns" then
				if type(b) == 'table' then
					newtb[a] = self:remove_xmlns(b)
				else
					newtb[a] = b
				end
			end
		end
		return newtb
	end
	return tb
end
	
Xmpp.translate_xml = function(self,xmlstr)
	local tb = xml.eval(xmlstr)
	local newtb = {}
	local oldtb = self:remove_xmlns(tb)
	self:translate_node(newtb,oldtb)
	return newtb
end