
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mservicemgr = inherit(GmSql.list,GmBase.CallBack):name("mservicemgr")



mservicemgr.init = function (self,pagecount)

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
	self.action['servicelist'] = {} 	
	-------
	self.op['servicelist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:servicelist()
		for a,b in pairs(top.action['servicelist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:servicelist(newpostparam)
		
	end	
		
  self.action['servicelist']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicelist']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicelist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicelist']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicelist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicelist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicelist']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicelist']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicelist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicelist']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicelist']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['servicelist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }
  self.action['servicelist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['servicedetail'] = {} 	
	-------
	self.op['servicedetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:servicedetail()
		for a,b in pairs(top.action['servicedetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:servicedetail(newpostparam)
		
	end	
		
  self.action['servicedetail']['pid'] = { ['title'] = 'PID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicedetail']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicedetail']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicedetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicedetail']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicedetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicedetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicedetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicedetail']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicedetail']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicedetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['servicedetail']['useip'] = { ['title'] = 'IP' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicedetail']['port'] = { ['title'] = '端口' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['servicedetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['parseurloff'] = { ['title'] = '解释URL' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['rate'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['servicedetail']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicedetail']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['servicedetail']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['servicedetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['servicedetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['servicepost'] = {} 	
	-------
	self.op['servicepost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:servicepost()
		for a,b in pairs(top.action['servicepost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:servicepost(newpostparam)
		
	end	
		
  self.action['servicepost']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['servicepost']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicepost']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['servicepost']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['servicepost']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['rate'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['servicepost']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['servicepost']['allownoticeauthor'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['wysiwyg'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['addfeed'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['uploadalbum'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['servicepost']['adddynamic'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['servicepost']['mod'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['action'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['fmtuploadtype'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['servicepost']['sortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['servicepost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['serviceitem'] = {} 	
	-------
	self.op['serviceitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:serviceitem()
		for a,b in pairs(top.action['serviceitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:serviceitem(newpostparam)
		
	end	
		
  self.action['serviceitem']['pid'] = { ['title'] = 'PID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['serviceitem']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['serviceitem']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['serviceitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['serviceitem']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['serviceitem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['serviceitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['serviceitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['serviceitem']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['serviceitem']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['serviceitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['serviceitem']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['serviceitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['serviceitem']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['serviceitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['serviceitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mservicemgr.check_fields_validate = function(self,key,postparam)
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


 
mservicemgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mservicemgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mservicemgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mservicemgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mservicemgr.run = function(self,key,ui)
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


mservicemgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mservicemgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mservicemgr.get_net_page error ',methon)
	end		
end




mservicemgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['servicelist']) do
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


mservicemgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['servicelist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mservicemgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['pid'] = { ["v"] = 20, }
		
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
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
    
	--number
	tablefield['selectsortid'] = { ["i"] = 20, }
    
	--number
	tablefield['sortid'] = { ["i"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	