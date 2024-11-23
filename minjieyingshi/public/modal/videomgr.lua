
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_minjieyingshi")


mvideomgr = inherit(GmSql.list,GmBase.CallBack):name("mvideomgr")



mvideomgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_thread')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_thread','tid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['videolist'] = {} 	
	-------
	self.op['videolist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()
		
		local tbname,callbackey,newpostparam = net:videolist()
		for a,b in pairs(top.action['videolist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		local tb,callbackey = net:videolist(newpostparam)
		net:add_callback(callbackey,ui)	
		
	end	
		
  self.action['videolist']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videolist']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videolist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videolist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videolist']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videolist']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videolist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videolist']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['videolist']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videolist']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videolist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['videolist']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['videolist']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['videolist']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videolist']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videolist']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['videolist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['videoitem'] = {} 	
	-------
	self.op['videoitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()
		
		local tbname,callbackey,newpostparam = net:videoitem()
		for a,b in pairs(top.action['videoitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		local tb,callbackey = net:videoitem(newpostparam)
		net:add_callback(callbackey,ui)	
		
	end	
		
  self.action['videoitem']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videoitem']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videoitem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videoitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videoitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videoitem']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videoitem']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['videoitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['videoitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['videoitem']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videoitem']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videoitem']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['videoitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['videopost'] = {} 	
	-------
	self.op['videopost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()
		
		local tbname,callbackey,newpostparam = net:videopost()
		for a,b in pairs(top.action['videopost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		local tb,callbackey = net:videopost(newpostparam)
		net:add_callback(callbackey,ui)	
		
	end	
		
  self.action['videopost']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videopost']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videopost']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videopost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videopost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['videopost']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['addfeed'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['uploadalbum'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videopost']['adddynamic'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['videopost']['mod'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videopost']['action'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videopost']['fmtuploadtype'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['videopost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['videodetail'] = {} 	
	-------
	self.op['videodetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()
		
		local tbname,callbackey,newpostparam = net:videodetail()
		for a,b in pairs(top.action['videodetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		local tb,callbackey = net:videodetail(newpostparam)
		net:add_callback(callbackey,ui)	
		
	end	
		
  self.action['videodetail']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videodetail']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videodetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['videodetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videodetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videodetail']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videodetail']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['videodetail']['useip'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['videodetail']['port'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['videodetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['usesig'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['htmlon'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['bbcodeoff'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['parseurloff'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['rate'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['ratetimes'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['videodetail']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['videodetail']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['videodetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['videodetail']['allownoticeauthor'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['wysiwyg'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['videodetail']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['videodetail']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['videodetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mvideomgr.check_fields_validate = function(self,key,postparam)
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


 
mvideomgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mvideomgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mvideomgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mvideomgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mvideomgr.run = function(self,key,ui)
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


mvideomgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mvideomgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mvideomgr.get_net_page error ',methon)
	end		
end




mvideomgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['videolist']) do
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


mvideomgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['videolist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mvideomgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
	--number
	tablefield['sortid'] = { ["i"] = 20, }
    
	--number
	tablefield['selectsortid'] = { ["i"] = 20, }
    
	-- other
	tablefield['pid'] = { ["v"] = 20, }
		
	-- other
	tablefield['tid'] = { ["v"] = 20, }
		
	--string
	tablefield['avatar'] = { ["v"] = 256, }
    
	--string
	tablefield['pic'] = { ["v"] = 256, }
    
	--string
	tablefield['thumbpath'] = { ["v"] = 256, }
    
	--string
	tablefield['summary'] = { ["v"] = 120, }
    
	-- other
	tablefield['first'] = { ["v"] = 2, }
		
	-- other
	tablefield['author'] = { ["v"] = 120, }
		
	-- other
	tablefield['authorid'] = { ["v"] = 2, }
		
	--string
	tablefield['subject'] = { ["v"] = 120, }
    
	--string
	tablefield['dateline'] = { ["v"] = 20, }
    
	--string
	tablefield['message'] = { ["v"] = 255, }
    
	-- other
	tablefield['useip'] = { ["v"] = 120, }
		
	-- other
	tablefield['port'] = { ["v"] = 6, }
		
	--number
	tablefield['invisible'] = { ["i"] = 2, }
    
	--number
	tablefield['anonymous'] = { ["i"] = 2, }
    
	-- other
	tablefield['usesig'] = { ["v"] = 2, }
		
	-- other
	tablefield['htmlon'] = { ["v"] = 2, }
		
	-- other
	tablefield['bbcodeoff'] = { ["v"] = 2, }
		
	-- other
	tablefield['smileyoff'] = { ["v"] = 2, }
		
	-- other
	tablefield['parseurloff'] = { ["v"] = 2, }
		
	-- other
	tablefield['attachment'] = { ["v"] = 2, }
		
	-- other
	tablefield['rate'] = { ["v"] = 2, }
		
	-- other
	tablefield['ratetimes'] = { ["v"] = 2, }
		
	-- other
	tablefield['status'] = { ["v"] = 10, }
		
	-- other
	tablefield['tags'] = { ["v"] = 2, }
		
	-- other
	tablefield['comment'] = { ["v"] = 1, }
		
	-- other
	tablefield['replycredit'] = { ["v"] = 10, }
		
	-- other
	tablefield['position'] = { ["v"] = 8, }
		
	--number
	tablefield['allownoticeauthor'] = { ["i"] = 2, }
    
	--number
	tablefield['wysiwyg'] = { ["i"] = 2, }
    
	--number
	tablefield['special'] = { ["i"] = 2, }
    
	--number
	tablefield['addfeed'] = { ["i"] = 2, }
    
	--number
	tablefield['uploadalbum'] = { ["i"] = 2, }
    
	--string
	tablefield['adddynamic'] = { ["v"] = 6, }
    
	--string
	tablefield['mod'] = { ["v"] = 20, }
    
	--string
	tablefield['action'] = { ["v"] = 20, }
    
	--number
	tablefield['uid'] = { ["i"] = 20, }
    
	--number
	tablefield['rewardprice'] = { ["i"] = 20, }
    
	--number
	tablefield['posttime'] = { ["i"] = 20, }
    
	--string
	tablefield['fmtuploadtype'] = { ["v"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	