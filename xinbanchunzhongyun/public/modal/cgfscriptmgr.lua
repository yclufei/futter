
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mcgfscriptmgr = inherit(GmSql.list,GmBase.CallBack):name("mcgfscriptmgr")



mcgfscriptmgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_script')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('czy_script','id')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['cgfscriptmodify'] = {} 	
	-------
	self.op['cgfscriptmodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfscriptmodify()
		for a,b in pairs(top.action['cgfscriptmodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfscriptmodify(newpostparam)
		
	end	
		
  self.action['cgfscriptmodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptmodify']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptmodify']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptmodify']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptmodify']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptmodify']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfscriptmodify']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfscriptmodify']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptmodify']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptmodify']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptmodify']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfscriptmodify']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptmodify']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptmodify']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['cgfscriptmodify']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptmodify']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfscriptmodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfscriptlist'] = {} 	
	-------
	self.op['cgfscriptlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfscriptlist()
		for a,b in pairs(top.action['cgfscriptlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfscriptlist(newpostparam)
		
	end	
		
  self.action['cgfscriptlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptlist']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptlist']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptlist']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptlist']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptlist']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfscriptlist']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfscriptlist']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptlist']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptlist']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptlist']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfscriptlist']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptlist']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptlist']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['cgfscriptlist']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptlist']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfscriptlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfscriptdetail'] = {} 	
	-------
	self.op['cgfscriptdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfscriptdetail()
		for a,b in pairs(top.action['cgfscriptdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfscriptdetail(newpostparam)
		
	end	
		
  self.action['cgfscriptdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptdetail']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptdetail']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptdetail']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptdetail']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptdetail']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfscriptdetail']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfscriptdetail']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptdetail']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptdetail']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptdetail']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfscriptdetail']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptdetail']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptdetail']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['cgfscriptdetail']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptdetail']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfscriptdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfscriptpost'] = {} 	
	-------
	self.op['cgfscriptpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfscriptpost()
		for a,b in pairs(top.action['cgfscriptpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfscriptpost(newpostparam)
		
	end	
		
  self.action['cgfscriptpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptpost']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptpost']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptpost']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptpost']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptpost']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfscriptpost']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfscriptpost']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptpost']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptpost']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptpost']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfscriptpost']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptpost']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptpost']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['cgfscriptpost']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptpost']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfscriptpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfscriptitem'] = {} 	
	-------
	self.op['cgfscriptitem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfscriptitem()
		for a,b in pairs(top.action['cgfscriptitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfscriptitem(newpostparam)
		
	end	
		
  self.action['cgfscriptitem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptitem']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptitem']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptitem']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptitem']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptitem']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfscriptitem']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfscriptitem']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptitem']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['cgfscriptitem']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfscriptitem']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['cgfscriptitem']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptitem']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['cgfscriptitem']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['cgfscriptitem']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfscriptitem']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['cgfscriptitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mcgfscriptmgr.check_fields_validate = function(self,key,postparam)
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


 
mcgfscriptmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mcgfscriptmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mcgfscriptmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mcgfscriptmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mcgfscriptmgr.run = function(self,key,ui)
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


mcgfscriptmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mcgfscriptmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mcgfscriptmgr.get_net_page error ',methon)
	end		
end




mcgfscriptmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfscriptlist']) do
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


mcgfscriptmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfscriptlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mcgfscriptmgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['id'] = { ["i"] = 11, }
    
	--number
	tablefield['group_id'] = { ["i"] = 11, }
    
	--number
	tablefield['format_id'] = { ["i"] = 11, }
    
	--number
	tablefield['separator'] = { ["i"] = 2, }
    
	--string
	tablefield['separator_list'] = { ["v"] = 20, }
    
	--string
	tablefield['name'] = { ["v"] = 32, }
    
	--string
	tablefield['note'] = { ["v"] = 64, }
    
	--string
	tablefield['thumb_url'] = { ["v"] = 200, }
    
	--string
	tablefield['photo_url'] = { ["v"] = 200, }
    
	--string
	tablefield['priority'] = { ["v"] = 20, }
    
	--string
	tablefield['tags'] = { ["v"] = 255, }
    
	--number
	tablefield['f_id'] = { ["i"] = 11, }
    
	--number
	tablefield['is_lock'] = { ["i"] = 2, }
    
	--string
	tablefield['margin'] = { ["v"] = 6, }
    
	--number
	tablefield['script_type'] = { ["i"] = 11, }
    
	--string
	tablefield['global_format'] = { ["v"] = 255, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	