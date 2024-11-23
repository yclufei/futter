
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mrewardmgr = inherit(GmSql.list,GmBase.CallBack):name("mrewardmgr")



mrewardmgr.init = function (self,pagecount)

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
	self.action['rewardpost'] = {} 	
	-------
	self.op['rewardpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardpost()
		for a,b in pairs(top.action['rewardpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardpost(newpostparam)
		
	end	
		
  self.action['rewardpost']['sortid'] = { ['title'] = '分类' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardpost']['cover'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardpost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardpost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['rewardpost']['tags'] = { ['title'] = '标签' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardpost']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardpost']['invisible'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['anonymous'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['usesig'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['allownoticeauthor'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['wysiwyg'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['special'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['addfeed'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['uploadalbum'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardpost']['adddynamic'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['rewardpost']['mod'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardpost']['action'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardpost']['rewardprice'] = { ['title'] = '悬赏金额' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardpost']['fmtuploadtype'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['rewardpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewarditem'] = {} 	
	-------
	self.op['rewarditem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewarditem()
		for a,b in pairs(top.action['rewarditem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewarditem(newpostparam)
		
	end	
		
  self.action['rewarditem']['typeid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['sortid'] = { ['title'] = '分类' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['cover'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarditem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarditem']['summary'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarditem']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarditem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarditem']['tags'] = { ['title'] = '标签' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarditem']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarditem']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarditem']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarditem']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarditem']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarditem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['rewarditem']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['avatar'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarditem']['first'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarditem']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarditem']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['invisible'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarditem']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarditem']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['rewarditem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewarddetail'] = {} 	
	-------
	self.op['rewarddetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewarddetail()
		for a,b in pairs(top.action['rewarddetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewarddetail(newpostparam)
		
	end	
		
  self.action['rewarddetail']['typeid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['sortid'] = { ['title'] = '分类' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['cover'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarddetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarddetail']['summary'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarddetail']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarddetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarddetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['rewarddetail']['tags'] = { ['title'] = '标签' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarddetail']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarddetail']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarddetail']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarddetail']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarddetail']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewarddetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['rewarddetail']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['avatar'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewarddetail']['first'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['useip'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewarddetail']['port'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['rewarddetail']['invisible'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['anonymous'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['usesig'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['htmlon'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['bbcode'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['smiley'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['parseurl'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['digest'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['rate'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['closed'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['ratetimes'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['status'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['rewarddetail']['replycredit'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['rewarddetail']['special'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewarddetail']['uid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewarddetail']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['rewarddetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['rewardlist'] = {} 	
	-------
	self.op['rewardlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:rewardlist()
		for a,b in pairs(top.action['rewardlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:rewardlist(newpostparam)
		
	end	
		
  self.action['rewardlist']['typeid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardlist']['sortid'] = { ['title'] = '分类' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardlist']['cover'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardlist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardlist']['summary'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardlist']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardlist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['rewardlist']['comments'] = { ['title'] = '点评数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardlist']['favtimes'] = { ['title'] = '收藏数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardlist']['sharetimes'] = { ['title'] = '分享数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardlist']['replies'] = { ['title'] = '回复次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardlist']['views'] = { ['title'] = '浏览次数' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['rewardlist']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardlist']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardlist']['avatar'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['rewardlist']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['rewardlist']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['rewardlist']['status'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }
  self.action['rewardlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mrewardmgr.check_fields_validate = function(self,key,postparam)
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


 
mrewardmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mrewardmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mrewardmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mrewardmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mrewardmgr.run = function(self,key,ui)
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


mrewardmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mrewardmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mrewardmgr.get_net_page error ',methon)
	end		
end




mrewardmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['rewardlist']) do
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


mrewardmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['rewardlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mrewardmgr.init_table = function(self)
	local tablefield = {}
	
	-- other
	tablefield['typeid'] = { ["v"] = 20, }
		
	-- other
	tablefield['sortid'] = { ["v"] = 20, }
		
	--string
	tablefield['cover'] = { ["v"] = 256, }
    
	--string
	tablefield['thumbpath'] = { ["v"] = 256, }
    
	--string
	tablefield['summary'] = { ["v"] = 120, }
    
	-- other
	tablefield['author'] = { ["v"] = 120, }
		
	--string
	tablefield['subject'] = { ["v"] = 120, }
    
	--string
	tablefield['message'] = { ["v"] = 255, }
    
	--string
	tablefield['tags'] = { ["v"] = 256, }
    
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
	tablefield['position'] = { ["v"] = 8, }
		
	-- other
	tablefield['pid'] = { ["v"] = 20, }
		
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
	-- other
	tablefield['tid'] = { ["v"] = 20, }
		
	--string
	tablefield['avatar'] = { ["v"] = 256, }
    
	-- other
	tablefield['first'] = { ["v"] = 2, }
		
	-- other
	tablefield['authorid'] = { ["v"] = 2, }
		
	--string
	tablefield['dateline'] = { ["v"] = 20, }
    
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
	tablefield['bbcode'] = { ["v"] = 2, }
		
	-- other
	tablefield['smiley'] = { ["v"] = 2, }
		
	-- other
	tablefield['parseurl'] = { ["v"] = 2, }
		
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
	tablefield['replycredit'] = { ["v"] = 10, }
		
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
	tablefield['rewardprice'] = { ["i"] = 20, }
    
	--number
	tablefield['posttime'] = { ["i"] = 20, }
    
	-- other
	tablefield['fmtuploadtype'] = { ["v"] = 20, }
		
	--number
	tablefield['selectsortid'] = { ["i"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	