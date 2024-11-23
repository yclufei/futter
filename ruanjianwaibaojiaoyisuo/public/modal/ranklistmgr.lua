
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_ruanjianwaibaojiaoyisuo")


mranklistmgr = inherit(GmSql.list,GmBase.CallBack):name("mranklistmgr")



mranklistmgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_ranklist')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_ranklist','clientid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['ranklistpost'] = {} 	
	-------
	self.op['ranklistpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:ranklistpost()
		for a,b in pairs(top.action['ranklistpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:ranklistpost(newpostparam)
		
	end	
		
  self.action['ranklistpost']['oid'] = { ['title'] = '对象ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['refrank'] = { ['title'] = '排序' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['reftable'] = { ['title'] = '表格' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['tablekey'] = { ['title'] = '表格关键字段' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['reftype'] = { ['title'] = '请求参数type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['refview'] = { ['title'] = '请求参数view' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistpost']['odeby'] = { ['title'] = '请求参数orderby' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['ranklistpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['ranklistlist'] = {} 	
	-------
	self.op['ranklistlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:ranklistlist()
		for a,b in pairs(top.action['ranklistlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:ranklistlist(newpostparam)
		
	end	
		
  self.action['ranklistlist']['oid'] = { ['title'] = '对象ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['refrank'] = { ['title'] = '排序' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['reftable'] = { ['title'] = '表格' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['tablekey'] = { ['title'] = '表格关键字段' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['reftype'] = { ['title'] = '请求参数type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['refview'] = { ['title'] = '请求参数view' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistlist']['odeby'] = { ['title'] = '请求参数orderby' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['ranklistlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['ranklistdetail'] = {} 	
	-------
	self.op['ranklistdetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:ranklistdetail()
		for a,b in pairs(top.action['ranklistdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:ranklistdetail(newpostparam)
		
	end	
		
  self.action['ranklistdetail']['oid'] = { ['title'] = '对象ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['refrank'] = { ['title'] = '排序' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['reftable'] = { ['title'] = '表格' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['tablekey'] = { ['title'] = '表格关键字段' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['reftype'] = { ['title'] = '请求参数type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['refview'] = { ['title'] = '请求参数view' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['ranklistdetail']['odeby'] = { ['title'] = '请求参数orderby' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['ranklistdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mranklistmgr.check_fields_validate = function(self,key,postparam)
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


 
mranklistmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mranklistmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mranklistmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mranklistmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mranklistmgr.run = function(self,key,ui)
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


mranklistmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.discuznet.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		--print('mranklistmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mranklistmgr.get_net_page error ',methon)
	end		
end




mranklistmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['ranklistlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page - 1		

		if attrs.page < 1 then
			attrs.page = 1
		end

		self:get_net_page(ui.netmethon,attrs)
		
		
		if callback then
			local status, msg = xpcall(function ()
		       callback('key',top,0)
		    end, __G__TRACKBACK__)
	  end

	end
end


mranklistmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['ranklistlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
		
		
		if callback then
			local status, msg = xpcall(function ()
		       callback('key',top,0)
		    end, __G__TRACKBACK__)
	  end

	end
end

------------------------------------------------------------------------------------



mranklistmgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['oid'] = { ["v"] = 20, }
		
	-- other
	tablefield['refrank'] = { ["v"] = 20, }
		
	--string
	tablefield['reftable'] = { ["v"] = 20, }
    
	--string
	tablefield['tablekey'] = { ["v"] = 20, }
    
	--string
	tablefield['reftype'] = { ["v"] = 20, }
    
	--string
	tablefield['refview'] = { ["v"] = 20, }
    
	--string
	tablefield['odeby'] = { ["v"] = 20, }
		
	--table
	tablefield['data'] = { ["t"] = 1, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	