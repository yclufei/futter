
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_ruanjianwaibaojiaoyisuo")


mrewardreplymgr = inherit(GmSql.list,GmBase.CallBack):name("mrewardreplymgr")



mrewardreplymgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_post')
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
	self.action['rewardreplylist'] = {} 	
	-------
	self.op['rewardreplylist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardreplylist()
		for a,b in pairs(top.action['rewardreplylist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardreplylist(newpostparam)
		
	end	
		
  self.action['rewardreplylist']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplylist']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplylist']['typeid'] = { ['title'] = '主题分类id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplylist']['sortid'] = { ['title'] = '分类信息id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplylist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplylist']['cover'] = { ['title'] = '主题封面' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplylist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplylist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplylist']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplylist']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplylist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplylist']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplylist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['rewardreplylist']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplylist']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplylist']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplylist']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplylist']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }
  self.action['rewardreplylist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewardreplyitem'] = {} 	
	-------
	self.op['rewardreplyitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardreplyitem()
		for a,b in pairs(top.action['rewardreplyitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardreplyitem(newpostparam)
		
	end	
		
  self.action['rewardreplyitem']['pid'] = { ['title'] = 'PID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['typeid'] = { ['title'] = '主题分类id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['sortid'] = { ['title'] = '分类信息id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplyitem']['cover'] = { ['title'] = '主题封面' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplyitem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplyitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplyitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplyitem']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplyitem']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplyitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplyitem']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplyitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplyitem']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplyitem']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplyitem']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplyitem']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplyitem']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplyitem']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplyitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['rewardreplyitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewardreplypost'] = {} 	
	-------
	self.op['rewardreplypost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardreplypost()
		for a,b in pairs(top.action['rewardreplypost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardreplypost(newpostparam)
		
	end	
	
  self.action['rewardreplypost']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplypost']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['rewardreplypost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplypost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['rewardreplypost']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }
  self.action['rewardreplypost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewardreplydetail'] = {} 	
	-------
	self.op['rewardreplydetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardreplydetail()
		for a,b in pairs(top.action['rewardreplydetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardreplydetail(newpostparam)
		
	end	
		
  self.action['rewardreplydetail']['pid'] = { ['title'] = 'PID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['typeid'] = { ['title'] = '主题分类id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['sortid'] = { ['title'] = '分类信息id' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplydetail']['cover'] = { ['title'] = '主题封面' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplydetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardreplydetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplydetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplydetail']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplydetail']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardreplydetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['rewardreplydetail']['useip'] = { ['title'] = 'IP' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardreplydetail']['port'] = { ['title'] = '端口' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['rewardreplydetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['parseurloff'] = { ['title'] = '解释URL' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['digest'] = { ['title'] = '是否精华' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['rate'] = { ['title'] = '是否评分' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['closed'] = { ['title'] = '是否关闭' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['rewardreplydetail']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplydetail']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplydetail']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplydetail']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplydetail']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardreplydetail']['replycredit'] = { ['title'] = '回帖奖励积分主题记录积分值' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['rewardreplydetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['rewardreplydetail']['special'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardreplydetail']['uid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['rewardreplydetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mrewardreplymgr.check_fields_validate = function(self,key,postparam)
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


 
mrewardreplymgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mrewardreplymgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mrewardreplymgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mrewardreplymgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mrewardreplymgr.run = function(self,key,ui)
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


mrewardreplymgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.discuznet.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mrewardreplymgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mrewardreplymgr.get_net_page error ',methon)
	end		
end




mrewardreplymgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['rewardreplylist']) do
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


mrewardreplymgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['rewardreplylist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mrewardreplymgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['pid'] = { ["v"] = 20, }
		
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
	-- other
	tablefield['tid'] = { ["v"] = 20, }
		
	-- other
	tablefield['typeid'] = { ["v"] = 20, }
		
	-- other
	tablefield['sortid'] = { ["v"] = 20, }
		
	--string
	tablefield['avatar'] = { ["v"] = 256, }
    
	--string
	tablefield['cover'] = { ["v"] = 256, }
    
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
	tablefield['digest'] = { ["v"] = 2, }
		
	-- other
	tablefield['rate'] = { ["v"] = 2, }
		
	-- other
	tablefield['closed'] = { ["v"] = 2, }
		
	-- other
	tablefield['ratetimes'] = { ["v"] = 2, }
		
	-- other
	tablefield['status'] = { ["v"] = 10, }
		
	-- other
	tablefield['tags'] = { ["v"] = 2, }
		
	--number
	tablefield['comments'] = { ["i"] = 1, }
    
	--number
	tablefield['favtimes'] = { ["i"] = 1, }
    
	--number
	tablefield['sharetimes'] = { ["i"] = 1, }
    
	--number
	tablefield['replies'] = { ["i"] = 1, }
    
	--number
	tablefield['views'] = { ["i"] = 1, }
    
	-- other
	tablefield['replycredit'] = { ["v"] = 10, }
		
	-- other
	tablefield['position'] = { ["v"] = 8, }
		
	-- other
	tablefield['allownoticeauthor'] = { ["v"] = 2, }
		
	-- other
	tablefield['wysiwyg'] = { ["v"] = 2, }
		
	-- other
	tablefield['special'] = { ["v"] = 2, }
		
	-- other
	tablefield['addfeed'] = { ["v"] = 2, }
		
	-- other
	tablefield['uploadalbum'] = { ["v"] = 2, }
		
	-- other
	tablefield['adddynamic'] = { ["v"] = 6, }
		
	-- other
	tablefield['mod'] = { ["v"] = 20, }
		
	-- other
	tablefield['action'] = { ["v"] = 20, }
		
	-- other
	tablefield['uid'] = { ["v"] = 20, }
		
	--number
	tablefield['rewardreplyprice'] = { ["i"] = 20, }
    
	--number
	tablefield['posttime'] = { ["i"] = 20, }
    
	-- other
	tablefield['fmtuploadtype'] = { ["v"] = 20, }
		
	--number
	tablefield['selectsortid'] = { ["i"] = 20, }
		
	--table
	tablefield['data'] = { ["t"] = 1, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	