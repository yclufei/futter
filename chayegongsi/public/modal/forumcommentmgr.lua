
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mforumcommentmgr = inherit(GmSql.list,GmBase.CallBack):name("mforumcommentmgr")



mforumcommentmgr.init = function (self,pagecount)

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
	self.action['forumcommentitem'] = {} 	
	-------
	self.op['forumcommentitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumcommentitem()
		for a,b in pairs(top.action['forumcommentitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumcommentitem(newpostparam)
		
	end	
		
  self.action['forumcommentitem']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentitem']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentitem']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentitem']['thumbpath'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentitem']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentitem']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentitem']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumcommentitem']['useip'] = { ['title'] = 'IP' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentitem']['port'] = { ['title'] = '端口' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumcommentitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentitem']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumcommentitem']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumcommentitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumcommentlist'] = {} 	
	-------
	self.op['forumcommentlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumcommentlist()
		for a,b in pairs(top.action['forumcommentlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumcommentlist(newpostparam)
		
	end	
		
  self.action['forumcommentlist']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentlist']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentlist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentlist']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentlist']['thumbpath'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentlist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentlist']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentlist']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentlist']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentlist']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumcommentlist']['useip'] = { ['title'] = 'IP' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentlist']['port'] = { ['title'] = '端口' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumcommentlist']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['parseurloff'] = { ['title'] = '解释URL' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentlist']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentlist']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumcommentlist']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentlist']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumcommentlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumcommentdetail'] = {} 	
	-------
	self.op['forumcommentdetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumcommentdetail()
		for a,b in pairs(top.action['forumcommentdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumcommentdetail(newpostparam)
		
	end	
		
  self.action['forumcommentdetail']['pid'] = { ['title'] = 'PID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentdetail']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentdetail']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentdetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentdetail']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentdetail']['thumbpath'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentdetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentdetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentdetail']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentdetail']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentdetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumcommentdetail']['useip'] = { ['title'] = 'IP' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentdetail']['port'] = { ['title'] = '端口' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumcommentdetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['parseurloff'] = { ['title'] = '解释URL' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['rate'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentdetail']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentdetail']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumcommentdetail']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentdetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumcommentdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumcommentpost'] = {} 	
	-------
	self.op['forumcommentpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumcommentpost()
		for a,b in pairs(top.action['forumcommentpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumcommentpost(newpostparam)
		
	end	
		
  self.action['forumcommentpost']['fid'] = { ['title'] = 'FID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentpost']['tid'] = { ['title'] = 'TID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentpost']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['forumcommentpost']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentpost']['authorid'] = { ['title'] = '用户ID' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['forumcommentpost']['dateline'] = { ['title'] = '发布时间' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['forumcommentpost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['forumcommentpost']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['rate'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['ratetimes'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentpost']['tags'] = { ['title'] = 'tag' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['forumcommentpost']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumcommentpost']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumcommentpost']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumcommentpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mforumcommentmgr.check_fields_validate = function(self,key,postparam)
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


 
mforumcommentmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mforumcommentmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mforumcommentmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mforumcommentmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mforumcommentmgr.run = function(self,key,ui)
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


mforumcommentmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mforumcommentmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mforumcommentmgr.get_net_page error ',methon)
	end		
end




mforumcommentmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumcommentlist']) do
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


mforumcommentmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumcommentlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mforumcommentmgr.init_table = function(self)
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
		
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	