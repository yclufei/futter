
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mforumforummgr = inherit(GmSql.list,GmBase.CallBack):name("mforumforummgr")



mforumforummgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_forum')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_forum','fid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['forumforummodify'] = {} 	
	-------
	self.op['forumforummodify'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumforummodify()
		for a,b in pairs(top.action['forumforummodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumforummodify(newpostparam)
		
	end	
		
  self.action['forumforummodify']['fid'] = { ['title'] = '论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforummodify']['type'] = { ['title'] = '类型' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '10' }
  self.action['forumforummodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumforumdetail'] = {} 	
	-------
	self.op['forumforumdetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumforumdetail()
		for a,b in pairs(top.action['forumforumdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumforumdetail(newpostparam)
		
	end	
		
  self.action['forumforumdetail']['allowanonymous'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowappend'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowbbcode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['alloweditpost'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['alloweditrules'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowfeed'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowglobalstick'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowhtml'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowimgcode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowmediacode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowpostspecial'] = { ['title'] = '允许发表特殊主题' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['allowside'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowsmilies'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['allowspecialonly'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['archive'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['autoclose'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['catforumcolumns'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '3' }	
  self.action['forumforumdetail']['commoncredits'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumforumdetail']['disablecollect'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['disablethumb'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['disablewatermark'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['displayorder'] = { ['title'] = '显示顺序' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['domain'] = { ['title'] = '' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '15' }	
  self.action['forumforumdetail']['favtimes'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['fid'] = { ['title'] = '论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['forumcolumns'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '3' }	
  self.action['forumforumdetail']['fup'] = { ['title'] = '上级论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['inheritedmod'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['jammer'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['lastpost'] = { ['title'] = '最后发表' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '110' }	
  self.action['forumforumdetail']['level'] = { ['title'] = '群组等级' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['modnewposts'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['modworks'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['name'] = { ['title'] = '名称' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['forumforumdetail']['oldrank'] = { ['title'] = '前天排名' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['posts'] = { ['title'] = '帖子数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['rank'] = { ['title'] = '排名' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['recommend'] = { ['title'] = '推荐到的版块' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['recyclebin'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['sharetimes'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['simple'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['status'] = { ['title'] = '状态' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['styleid'] = { ['title'] = '风格id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumdetail']['threadcaches'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumdetail']['threads'] = { ['title'] = '主题数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['todayposts'] = { ['title'] = '今日发帖数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumdetail']['type'] = { ['title'] = '类型' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumforumdetail']['yesterdayposts'] = { ['title'] = '昨日发帖数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumforumdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumforumpost'] = {} 	
	-------
	self.op['forumforumpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumforumpost()
		for a,b in pairs(top.action['forumforumpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumforumpost(newpostparam)
		
	end	
		
  self.action['forumforumpost']['fid'] = { ['title'] = '论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumpost']['name'] = { ['title'] = '名称' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '50' }
  self.action['forumforumpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumforumlist'] = {} 	
	-------
	self.op['forumforumlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumforumlist()
		for a,b in pairs(top.action['forumforumlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumforumlist(newpostparam)
		
	end	
		
  self.action['forumforumlist']['allowanonymous'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowappend'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowbbcode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['alloweditpost'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['alloweditrules'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowfeed'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowglobalstick'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowhtml'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowimgcode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowmediacode'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowpostspecial'] = { ['title'] = '允许发表特殊主题' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['allowside'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowsmilies'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['allowspecialonly'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['archive'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['autoclose'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['catforumcolumns'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '3' }	
  self.action['forumforumlist']['commoncredits'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumforumlist']['disablecollect'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['disablethumb'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['disablewatermark'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['displayorder'] = { ['title'] = '显示顺序' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['domain'] = { ['title'] = '' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '15' }	
  self.action['forumforumlist']['favtimes'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['fid'] = { ['title'] = '论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['forumcolumns'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '3' }	
  self.action['forumforumlist']['fup'] = { ['title'] = '上级论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['inheritedmod'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['jammer'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['lastpost'] = { ['title'] = '最后发表' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '110' }	
  self.action['forumforumlist']['level'] = { ['title'] = '群组等级' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['modnewposts'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['modworks'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['name'] = { ['title'] = '名称' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['forumforumlist']['oldrank'] = { ['title'] = '前天排名' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['posts'] = { ['title'] = '帖子数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['rank'] = { ['title'] = '排名' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['recommend'] = { ['title'] = '推荐到的版块' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['recyclebin'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['sharetimes'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['simple'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['status'] = { ['title'] = '状态' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['styleid'] = { ['title'] = '风格id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['forumforumlist']['threadcaches'] = { ['title'] = '' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['forumforumlist']['threads'] = { ['title'] = '主题数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['todayposts'] = { ['title'] = '今日发帖数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumlist']['type'] = { ['title'] = '类型' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['forumforumlist']['yesterdayposts'] = { ['title'] = '昨日发帖数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }
  self.action['forumforumlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forumforumitem'] = {} 	
	-------
	self.op['forumforumitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forumforumitem()
		for a,b in pairs(top.action['forumforumitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forumforumitem(newpostparam)
		
	end	
		
  self.action['forumforumitem']['fid'] = { ['title'] = '论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumitem']['fup'] = { ['title'] = '上级论坛id' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumitem']['name'] = { ['title'] = '名称' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['forumforumitem']['posts'] = { ['title'] = '帖子数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumitem']['threads'] = { ['title'] = '主题数量' , ['t'] = 'i' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['forumforumitem']['type'] = { ['title'] = '类型' , ['t'] = 'v' , ['min'] = 'NaN' , ['max'] = '10' }
  self.action['forumforumitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mforumforummgr.check_fields_validate = function(self,key,postparam)
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


 
mforumforummgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mforumforummgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mforumforummgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mforumforummgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mforumforummgr.run = function(self,key,ui)
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


mforumforummgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mforumforummgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mforumforummgr.get_net_page error ',methon)
	end		
end




mforumforummgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumforumlist']) do
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


mforumforummgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['forumforumlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mforumforummgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['allowanonymous'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowappend'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowbbcode'] = { ["v"] = 1, }
		
	-- other
	tablefield['alloweditpost'] = { ["v"] = 1, }
		
	-- other
	tablefield['alloweditrules'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowfeed'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowglobalstick'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowhtml'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowimgcode'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowmediacode'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowpostspecial'] = { ["v"] = 6, }
		
	-- other
	tablefield['allowside'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowsmilies'] = { ["v"] = 1, }
		
	-- other
	tablefield['allowspecialonly'] = { ["v"] = 1, }
		
	-- other
	tablefield['archive'] = { ["v"] = 1, }
		
	-- other
	tablefield['autoclose'] = { ["v"] = 6, }
		
	-- other
	tablefield['catforumcolumns'] = { ["v"] = 3, }
		
	-- other
	tablefield['commoncredits'] = { ["v"] = 10, }
		
	-- other
	tablefield['disablecollect'] = { ["v"] = 1, }
		
	-- other
	tablefield['disablethumb'] = { ["v"] = 1, }
		
	-- other
	tablefield['disablewatermark'] = { ["v"] = 1, }
		
	-- other
	tablefield['displayorder'] = { ["v"] = 6, }
		
	-- other
	tablefield['domain'] = { ["v"] = 15, }
		
	-- other
	tablefield['favtimes'] = { ["v"] = 8, }
		
	-- other
	tablefield['fid'] = { ["v"] = 8, }
		
	-- other
	tablefield['forumcolumns'] = { ["v"] = 3, }
		
	-- other
	tablefield['fup'] = { ["v"] = 8, }
		
	-- other
	tablefield['inheritedmod'] = { ["v"] = 1, }
		
	-- other
	tablefield['jammer'] = { ["v"] = 1, }
		
	-- other
	tablefield['lastpost'] = { ["v"] = 110, }
		
	-- other
	tablefield['level'] = { ["v"] = 6, }
		
	-- other
	tablefield['modnewposts'] = { ["v"] = 1, }
		
	-- other
	tablefield['modworks'] = { ["v"] = 1, }
		
	-- other
	tablefield['name'] = { ["v"] = 50, }
		
	-- other
	tablefield['oldrank'] = { ["v"] = 6, }
		
	-- other
	tablefield['posts'] = { ["v"] = 8, }
		
	-- other
	tablefield['rank'] = { ["v"] = 6, }
		
	-- other
	tablefield['recommend'] = { ["v"] = 6, }
		
	-- other
	tablefield['recyclebin'] = { ["v"] = 1, }
		
	-- other
	tablefield['sharetimes'] = { ["v"] = 8, }
		
	-- other
	tablefield['simple'] = { ["v"] = 1, }
		
	-- other
	tablefield['status'] = { ["v"] = 1, }
		
	-- other
	tablefield['styleid'] = { ["v"] = 6, }
		
	-- other
	tablefield['threadcaches'] = { ["v"] = 1, }
		
	-- other
	tablefield['threads'] = { ["v"] = 8, }
		
	-- other
	tablefield['todayposts'] = { ["v"] = 8, }
		
	-- other
	tablefield['type'] = { ["v"] = 10, }
		
	-- other
	tablefield['yesterdayposts'] = { ["v"] = 8, }
		
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	