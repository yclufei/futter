
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mscriptmgr = inherit(GmSql.list,GmBase.CallBack):name("mscriptmgr")



mscriptmgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'script')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('script','tid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['scriptdetail'] = {} 	
	-------
	self.op['scriptdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:scriptdetail()
		for a,b in pairs(top.action['scriptdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:scriptdetail(newpostparam)
		
	end	
		
  self.action['scriptdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptdetail']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptdetail']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptdetail']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptdetail']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptdetail']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['scriptdetail']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['scriptdetail']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptdetail']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptdetail']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptdetail']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['scriptdetail']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptdetail']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptdetail']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['scriptdetail']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptdetail']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['scriptdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['scriptlist'] = {} 	
	-------
	self.op['scriptlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:scriptlist()
		for a,b in pairs(top.action['scriptlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:scriptlist(newpostparam)
		
	end	
		
  self.action['scriptlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptlist']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptlist']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptlist']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptlist']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptlist']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['scriptlist']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['scriptlist']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptlist']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptlist']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptlist']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['scriptlist']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptlist']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptlist']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['scriptlist']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptlist']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['scriptlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['scriptpost'] = {} 	
	-------
	self.op['scriptpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:scriptpost()
		for a,b in pairs(top.action['scriptpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:scriptpost(newpostparam)
		
	end	
		
  self.action['scriptpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptpost']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptpost']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptpost']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptpost']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptpost']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['scriptpost']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['scriptpost']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptpost']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptpost']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptpost']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['scriptpost']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptpost']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptpost']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['scriptpost']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptpost']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['scriptpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['scriptitem'] = {} 	
	-------
	self.op['scriptitem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:scriptitem()
		for a,b in pairs(top.action['scriptitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:scriptitem(newpostparam)
		
	end	
		
  self.action['scriptitem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptitem']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptitem']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptitem']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptitem']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptitem']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['scriptitem']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['scriptitem']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptitem']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptitem']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptitem']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['scriptitem']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptitem']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptitem']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['scriptitem']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptitem']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['scriptitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['scriptmodify'] = {} 	
	-------
	self.op['scriptmodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:scriptmodify()
		for a,b in pairs(top.action['scriptmodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:scriptmodify(newpostparam)
		
	end	
		
  self.action['scriptmodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptmodify']['group_id'] = { ['title'] = '所属分组,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptmodify']['format_id'] = { ['title'] = '对应的格式,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptmodify']['separator'] = { ['title'] = '`separator`' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptmodify']['separator_list'] = { ['title'] = 'separator_list' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptmodify']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['scriptmodify']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['scriptmodify']['thumb_url'] = { ['title'] = 'thumb_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptmodify']['photo_url'] = { ['title'] = 'photo_url' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['scriptmodify']['priority'] = { ['title'] = 'priority' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['scriptmodify']['tags'] = { ['title'] = 'tags' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['scriptmodify']['f_id'] = { ['title'] = 'f_id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptmodify']['is_lock'] = { ['title'] = 'is_lock' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['scriptmodify']['margin'] = { ['title'] = '毛利率,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['scriptmodify']['script_type'] = { ['title'] = '工艺类型0门:1窗,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['scriptmodify']['global_format'] = { ['title'] = '全局属性' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }
  self.action['scriptmodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mscriptmgr.check_fields_validate = function(self,key,postparam)
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


 
mscriptmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mscriptmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mscriptmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mscriptmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mscriptmgr.run = function(self,key,ui)
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


mscriptmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mscriptmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mscriptmgr.get_net_page error ',methon)
	end		
end




mscriptmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['scriptlist']) do
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


mscriptmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['scriptlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mscriptmgr.init_table = function(self)
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


	