
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mclientmgr = inherit(GmSql.list,GmBase.CallBack):name("mclientmgr")



mclientmgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'cgfscript')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('cgfscript','id')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['clientmodify'] = {} 	
	-------
	self.op['clientmodify'] = function(postparam,ui)
	
		local net = GmBase.net.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:clientmodify()
		for a,b in pairs(top.action['clientmodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:clientmodify(newpostparam)
		
	end	
		
  self.action['clientmodify']['clientid'] = { ['title'] = 'clientID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['clientmodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['clientadd'] = {} 	
	-------
	self.op['clientadd'] = function(postparam,ui)
	
		local net = GmBase.net.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:clientadd()
		for a,b in pairs(top.action['clientadd']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:clientadd(newpostparam)
		
	end	
		
  self.action['clientadd']['clientid'] = { ['title'] = 'clientID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['clientadd']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['clientinfo'] = {} 	
	-------
	self.op['clientinfo'] = function(postparam,ui)
	
		local net = GmBase.net.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:clientinfo()
		for a,b in pairs(top.action['clientinfo']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:clientinfo(newpostparam)
		
	end	
		
  self.action['clientinfo']['clientid'] = { ['title'] = 'clientID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['clientinfo']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['clientlist'] = {} 	
	-------
	self.op['clientlist'] = function(postparam,ui)
	
		local net = GmBase.net.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:clientlist()
		for a,b in pairs(top.action['clientlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:clientlist(newpostparam)
		
	end	
		
  self.action['clientlist']['clientid'] = { ['title'] = 'clientID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['clientlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mclientmgr.check_fields_validate = function(self,key,postparam)
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


 
mclientmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mclientmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mclientmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mclientmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mclientmgr.run = function(self,key,ui)
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


mclientmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mclientmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mclientmgr.get_net_page error ',methon)
	end		
end




mclientmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['clientlist']) do
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


mclientmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['clientlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mclientmgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['clientid'] = { ["i"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	