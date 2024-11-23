
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mforummgr = inherit(GmSql.list,GmBase.CallBack):name("mforummgr")



mforummgr.init = function (self,pagecount)

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
	self.action['forumpost'] = {} 	
	-------
	self.op['forumpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumpost()
		for a,b in pairs(top.action['forumpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumpost(newpostparam)
		
	end	
		
  self.action['forumpost']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumpost']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumpost']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumpost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumpost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumpost']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['addfeed'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['uploadalbum'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumpost']['adddynamic'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumpost']['mod'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumpost']['action'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumpost']['fmtuploadtype'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['forumpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumdetail'] = {} 	
	-------
	self.op['forumdetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumdetail()
		for a,b in pairs(top.action['forumdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumdetail(newpostparam)
		
	end	
		
  self.action['forumdetail']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumdetail']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumdetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumdetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumdetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumdetail']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumdetail']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumdetail']['useip'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumdetail']['port'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumdetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['usesig'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['htmlon'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['bbcodeoff'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['parseurloff'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['rate'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['ratetimes'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumdetail']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumdetail']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumdetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumdetail']['allownoticeauthor'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['wysiwyg'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumdetail']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumdetail']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['forumdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumlist'] = {} 	
	-------
	self.op['forumlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumlist()
		for a,b in pairs(top.action['forumlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumlist(newpostparam)
		
	end	
		
  self.action['forumlist']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumlist']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumlist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumlist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumlist']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumlist']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumlist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumlist']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumlist']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumlist']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumlist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumlist']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumlist']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumlist']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumlist']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumlist']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['forumlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumitem'] = {} 	
	-------
	self.op['forumitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumitem()
		for a,b in pairs(top.action['forumitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumitem(newpostparam)
		
	end	
		
  self.action['forumitem']['fid'] = { ['title'] = '栏目' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumitem']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumitem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['author'] = { ['title'] = '用户名称' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumitem']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumitem']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['attachment'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumitem']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumitem']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['rewardprice'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumitem']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['forumitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mforummgr.check_fields_validate = function(self,key,postparam)
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


 
mforummgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mforummgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mforummgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mforummgr.run = function(self,key,ui)
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


mforummgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mforummgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mforummgr.get_net_page error ',methon)
	end		
end




mforummgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumlist']) do
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


mforummgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mforummgr.init_table = function(self)
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


	