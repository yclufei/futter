
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_ruanjianwaibaojiaoyisuo")


mthreadtypemgr = inherit(GmSql.list,GmBase.CallBack):name("mthreadtypemgr")



mthreadtypemgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_threadtype')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_threadtype','typeid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['threadtypepost'] = {} 	
	-------
	self.op['threadtypepost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:threadtypepost()
		for a,b in pairs(top.action['threadtypepost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:threadtypepost(newpostparam)
		
	end	
		
  self.action['threadtypepost']['typeid'] = { ['title'] = 'ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypepost']['fid'] = { ['title'] = 'fid' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypepost']['icon'] = { ['title'] = '图标' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['threadtypepost']['description'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['threadtypepost']['name'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }
  self.action['threadtypepost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['threadtypedetail'] = {} 	
	-------
	self.op['threadtypedetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:threadtypedetail()
		for a,b in pairs(top.action['threadtypedetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:threadtypedetail(newpostparam)
		
	end	
		
  self.action['threadtypedetail']['typeid'] = { ['title'] = 'ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypedetail']['fid'] = { ['title'] = 'fid' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypedetail']['icon'] = { ['title'] = '图标' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['threadtypedetail']['description'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['threadtypedetail']['name'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }
  self.action['threadtypedetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['threadtypelist'] = {} 	
	-------
	self.op['threadtypelist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:threadtypelist()
		for a,b in pairs(top.action['threadtypelist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:threadtypelist(newpostparam)
		
	end	
		
  self.action['threadtypelist']['typeid'] = { ['title'] = 'ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypelist']['fid'] = { ['title'] = 'fid' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['threadtypelist']['icon'] = { ['title'] = '图标' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['threadtypelist']['description'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['threadtypelist']['name'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }
  self.action['threadtypelist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mthreadtypemgr.check_fields_validate = function(self,key,postparam)
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


 
mthreadtypemgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mthreadtypemgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mthreadtypemgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mthreadtypemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mthreadtypemgr.run = function(self,key,ui)
	if self.action[key] ~= nil and self.op[key] ~= nil then
		local tb = {}
		for k,v in pairs(self.action[key]) do
			if ui[k] ~= nil and ui[k].get_text then
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


mthreadtypemgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.discuznet.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mthreadtypemgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mthreadtypemgr.get_net_page error ',methon)
	end		
end




mthreadtypemgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['threadtypelist']) do
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


mthreadtypemgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['threadtypelist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mthreadtypemgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['typeid'] = { ["v"] = 20, }
		
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
	--string
	tablefield['icon'] = { ["v"] = 256, }
    
	--string
	tablefield['description'] = { ["v"] = 120, }
    
	--string
	tablefield['name'] = { ["v"] = 120, }
		
	--table
	tablefield['data'] = { ["t"] = 1, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	