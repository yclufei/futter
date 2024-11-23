
gr_module("GmBase")


usernet = inherit(GmSql.list,GmBase.CallBack):name("usernet")

usernet.instance = nil

usernet.formhash = nil

usernet.formhash = member_uid



usernet.get_instance = function(pagecount)
	if GmBase.usernet.instance == nil then
		GmBase.usernet.instance = GmBase.usernet(pagecount)
		GmBase.usernet.instance:init_table()
	end
	return GmBase.usernet.instance
end



usernet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'discuz_forum_member')
	GmBase.CallBack.init(self)

	self.base = g_serverRoot..'tm/api/'

end


usernet.init_table = function(self)

	local tablefield = {}
	
	tablefield['saltkey'] = { ["v"] = 50, }
	tablefield['member_avatar'] = { ["v"] = 50, }
	tablefield['formhash'] = { ["v"] = 50, }
	tablefield['member_username'] = { ["v"] = 50, }
	tablefield['cookiepre'] = { ["v"] = 50, }
	tablefield['member_username'] = { ["v"] = 50, }
	
	tablefield['groupid'] = { ["i"] = 4, }
	tablefield['member_uid'] = { ["i"] = 4, }
	tablefield['newpm'] = { ["i"] = 4, }
	tablefield['newmypost'] = { ["i"] = 4, }
	tablefield['newpush'] = { ["i"] = 4, }
	tablefield['newprompt'] = { ["i"] = 4, }
	tablefield['readaccess'] = { ["i"] = 4, }
	
	self:create_table( 'discuz_forum_member', tablefield)
	self.idPair['discuz_forum_member'] = {}
	self.idPair['discuz_forum_member']['prev'] = '0'
	self.idPair['discuz_forum_member']['next'] = '0'

	self:initTableStruct()
	
end






usernet.registerform = function(self,postparam)	
	local callbackey = 'usernet.'..debug.getinfo(1).name	
	
	if postparam == nil then
		local tb = {}
		tb.username = ''
		tb.password = ''
		tb.password2 = ''
		tb.mobilenum = ''
		tb.formhash = GmBase.usernet.formhash
		return 'discuz_forum_member',callbackey,tb
	end
	
	postparam.regsubmit = true
	postparam.formhash = GmBase.usernet.formhash
	
--	table.print(postparam)
	
	local top = self
	local url = g_serverRoot..'upload/source/plugin/mobile/mobile.php?version=1&module=register&mod=register&regsubmit=true&prj='..g_mainModule
	gxo_curl(url,function(netdata)	
		table.print(netdata)
		if netdata['success'] then
			if netdata[ "error" ] == -1 then
				GmBase.usernet.formhash = netdata['user']['formhash']
			end
			top:handle_callback(callbackey,'discuz_forum_member',postparam,netdata)
		end		
	end,postparam)	
	return 'discuz_forum_member',callbackey	
end




usernet.loginform = function(self,postparam)
	local top = self
	local callbackey = self.classname..'.'..debug.getinfo(1).name	
	if postparam == nil then
		local tb = {}
		tb.username = ''
		tb.password = ''
		tb.loginfield = 'mobilenum'
		return 'discuz_forum_member',callbackey,tb
	end
	
	os.remove('ch/cookie')
		
	postparam['loginfield'] = 'mobilenum'
	
	local url = g_serverRoot..'upload/source/plugin/mobile/mobile.php?version=4&module=login&act=login&loginsubmit=true&_auth=true&loginfield=mobilenum&prj='..g_mainModule	
	local url = url..'&username='..postparam.username
	
	gxo_curl(url,function(netdata)
		if netdata['success'] then	
			if netdata['error'] == 0 then
				--table.print(netdata)
				GmBase.usernet.formhash = netdata['data']['formhash']
				GmBase.usernet.member_uid = netdata['data']['member_uid']
				top.tablename = 'discuz_forum_member'
				top:SetDirty(true)
				local a,b,c = top:AddorUpdateRecord('member_uid',netdata['data'])
				top:reset_maxminid('discuz_forum_member','member_uid')
			end
			top:handle_callback(callbackey,'discuz_forum_member',postparam,netdata)
		end
	end,postparam)	

	return 'discuz_forum_member',callbackey	
end


usernet.forgetform = function(self,postparam)	
	local callbackey = 'usernet.'..debug.getinfo(1).name	
	local top = self
	local url = self.base..debug.getinfo(1).name..'.php'		
	gxo_curl(url,function(netdata)	
		if netdata['success'] then		
			top:handle_callback(callbackey,'discuz_forum_member',postparam,netdata)		
		end		
	end,postparam)	
	return 'discuz_forum_member',callbackey	
end

usernet.postavatar = function(self,tb)
	local top = self
	local callbackey = self.classname..'.'..debug.getinfo(1).name	
	if tb == nil then
		local tb = {}
		tb.file = ''
		tb['formhash'] = GmBase.usernet.formhash
		return 'discuz_forum_member',callbackey,tb
	end
	
---	table.print(tb)
	
	local url = g_serverRoot..'uc_server/avatar.php?uid='..tostring(GmBase.usernet.member_uid)
	gxo_curl(url,function(netdata)	
		if netdata['success'] then		
			top:handle_callback(callbackey,'discuz_forum_member',postparam,netdata)		
		end		
	end,tb,tb.file)	
	return 'discuz_forum_member',callbackey	
end
