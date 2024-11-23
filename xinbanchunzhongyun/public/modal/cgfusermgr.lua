
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mcgfusermgr = inherit(GmSql.list,GmBase.CallBack):name("mcgfusermgr")



mcgfusermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_user')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('czy_user','id')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['cgfusermodify'] = {} 	
	-------
	self.op['cgfusermodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfusermodify()
		for a,b in pairs(top.action['cgfusermodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfusermodify(newpostparam)
		
	end	
		
  self.action['cgfusermodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfusermodify']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['create_time'] = { ['title'] = '注册时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfusermodify']['login_time'] = { ['title'] = '上次登录时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfusermodify']['role'] = { ['title'] = 'role' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['user_type'] = { ['title'] = 'user_type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['last_active'] = { ['title'] = '最后活动时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '12' }	
  self.action['cgfusermodify']['master'] = { ['title'] = 'master' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfusermodify']['expire'] = { ['title'] = 'expire' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfusermodify']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['visit'] = { ['title'] = 'visit' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfusermodify']['sex'] = { ['title'] = '性别,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfusermodify']['photo'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfusermodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfuserpost'] = {} 	
	-------
	self.op['cgfuserpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfuserpost()
		for a,b in pairs(top.action['cgfuserpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfuserpost(newpostparam)
		
	end	
		
  self.action['cgfuserpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserpost']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['create_time'] = { ['title'] = '注册时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserpost']['login_time'] = { ['title'] = '上次登录时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserpost']['role'] = { ['title'] = 'role' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['user_type'] = { ['title'] = 'user_type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['last_active'] = { ['title'] = '最后活动时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '12' }	
  self.action['cgfuserpost']['master'] = { ['title'] = 'master' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfuserpost']['expire'] = { ['title'] = 'expire' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserpost']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['visit'] = { ['title'] = 'visit' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserpost']['sex'] = { ['title'] = '性别,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserpost']['photo'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfuserpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfuseritem'] = {} 	
	-------
	self.op['cgfuseritem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfuseritem()
		for a,b in pairs(top.action['cgfuseritem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfuseritem(newpostparam)
		
	end	
		
  self.action['cgfuseritem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuseritem']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['create_time'] = { ['title'] = '注册时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuseritem']['login_time'] = { ['title'] = '上次登录时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuseritem']['role'] = { ['title'] = 'role' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['user_type'] = { ['title'] = 'user_type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['last_active'] = { ['title'] = '最后活动时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '12' }	
  self.action['cgfuseritem']['master'] = { ['title'] = 'master' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfuseritem']['expire'] = { ['title'] = 'expire' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuseritem']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['visit'] = { ['title'] = 'visit' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuseritem']['sex'] = { ['title'] = '性别,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuseritem']['photo'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfuseritem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfuserlist'] = {} 	
	-------
	self.op['cgfuserlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfuserlist()
		for a,b in pairs(top.action['cgfuserlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfuserlist(newpostparam)
		
	end	
		
  self.action['cgfuserlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserlist']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['create_time'] = { ['title'] = '注册时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserlist']['login_time'] = { ['title'] = '上次登录时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserlist']['role'] = { ['title'] = 'role' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['user_type'] = { ['title'] = 'user_type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['last_active'] = { ['title'] = '最后活动时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '12' }	
  self.action['cgfuserlist']['master'] = { ['title'] = 'master' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfuserlist']['expire'] = { ['title'] = 'expire' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserlist']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['visit'] = { ['title'] = 'visit' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserlist']['sex'] = { ['title'] = '性别,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserlist']['photo'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfuserlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfloginform'] = {} 	
	-------
	self.op['cgfloginform'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfloginform()
		for a,b in pairs(top.action['cgfloginform']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfloginform(newpostparam)
		
	end	
		
  self.action['cgfloginform']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfloginform']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfloginform']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfuserdetail'] = {} 	
	-------
	self.op['cgfuserdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfuserdetail()
		for a,b in pairs(top.action['cgfuserdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfuserdetail(newpostparam)
		
	end	
		
  self.action['cgfuserdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserdetail']['username'] = { ['title'] = 'username' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['password'] = { ['title'] = 'password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['create_time'] = { ['title'] = '注册时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserdetail']['login_time'] = { ['title'] = '上次登录时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserdetail']['role'] = { ['title'] = 'role' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['user_type'] = { ['title'] = 'user_type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['last_active'] = { ['title'] = '最后活动时间,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '12' }	
  self.action['cgfuserdetail']['master'] = { ['title'] = 'master' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfuserdetail']['expire'] = { ['title'] = 'expire' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfuserdetail']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['visit'] = { ['title'] = 'visit' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfuserdetail']['sex'] = { ['title'] = '性别,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfuserdetail']['photo'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }
  self.action['cgfuserdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mcgfusermgr.check_fields_validate = function(self,key,postparam)
	local checkfunc = {}
	checkfunc['t'] = function(fm,value)
		return true
	end
	checkfunc['min'] = function(fm,value)
		if string.len(value) < tonumber(fm) then
			return false
		end
		return true
	end
	checkfunc['max'] = function(fm,value)
		if string.len(value) > tonumber(fm) then
			return false
		end
		return true
	end
	local format = self.action[key]
	for fkey,fvalue in pairs(postparam) do
		if format[fkey] ~= nil then
			for fmkey,fmvalue in pairs(format[fkey]) do
				if checkfunc[fmkey] ~= nil then
					if checkfunc[fmkey](fmvalue,fvalue) == false then
						return false,tostring(format[fkey]['title']).." "..tostring(fmkey).." "..tostring(fmvalue).." error"
					end
				end
			end
		end
	end
	return true,""
end 


 
mcgfusermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mcgfusermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mcgfusermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mcgfusermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mcgfusermgr.run = function(self,key,ui)
	if self.action[key] ~= nil and self.op[key] ~= nil then
		local tb = {}
		for k,v in pairs(self.action[key]) do
			if ui[k] ~= nil and type(ui[k]) == 'table' and ui[k].get_text then
				tb[k] = ui[k]:get_text()
			else
				print('run error',key,k)
			end
		end
		local success,msg = self:check_fields_validate(key,tb)
		if success then
			self.op[key](tb,ui)
		else
			ui.hostWindow:showMsg(msg)
		end		
	else
		print('run error self.action',key)
	end
end


------------------------------------------------------------------------------------


mcgfusermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mcgfusermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mcgfusermgr.get_net_page error ',methon)
	end		
end




mcgfusermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfuserlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page - 1		

		if attrs.page < 1 then
			attrs.page = 1
		end

		self:get_net_page(ui.netmethon,attrs)
	end
end


mcgfusermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfuserlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mcgfusermgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['id'] = { ["i"] = 11, }
    
	--string
	tablefield['username'] = { ["v"] = 32, }
    
	--string
	tablefield['password'] = { ["v"] = 32, }
    
	--string
	tablefield['create_time'] = { ["v"] = 20, }
    
	--string
	tablefield['login_time'] = { ["v"] = 20, }
    
	--string
	tablefield['role'] = { ["v"] = 32, }
    
	--string
	tablefield['user_type'] = { ["v"] = 32, }
    
	--string
	tablefield['last_active'] = { ["v"] = 12, }
    
	--number
	tablefield['master'] = { ["i"] = 1, }
    
	--string
	tablefield['expire'] = { ["v"] = 20, }
    
	--string
	tablefield['andriod_password'] = { ["v"] = 32, }
    
	--string
	tablefield['visit'] = { ["v"] = 32, }
    
	--string
	tablefield['sex'] = { ["v"] = 11, }
    
	--string
	tablefield['photo'] = { ["v"] = 32, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	