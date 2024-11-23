
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_ruanjianwaibaojiaoyisuo")


mprofilemgr = inherit(GmSql.list,GmBase.CallBack):name("mprofilemgr")



mprofilemgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_profile')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_profile','uid')
	
	
	self.action = {}
	self.op  = {}
	
	
  
	self.session = {}
	
end   





musermgr.check_fields_validate = function(self,key,postparam)
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


 
musermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

musermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	--table.print(self.session)
	return self.session[key] ~= nil
end
 
 
musermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


musermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
musermgr.run = function(self,key,ui)
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


mprofilemgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.discuznet.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mprofilemgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mprofilemgr.get_net_page error ',methon)
	end		
end




mprofilemgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['profilelist']) do
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


mprofilemgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['profilelist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mprofilemgr.init_table = function(self)

	local tablefield = {}
	tablefield['uid'] = { ["i"] = 20, }
 	tablefield['mobilenum'] = { ["v"] = 20, }
 	tablefield['username'] = { ["v"] = 20, }
 	tablefield['status'] = { ["i"] = 20, }
 	tablefield['mobilenumstatus'] = { ["i"] = 20, }
 	tablefield['avatarstatus'] = { ["i"] = 20, }
 	tablefield['videophotostatus'] = { ["i"] = 20, }
 	tablefield['adminid'] = { ["i"] = 20, }
 	tablefield['groupid'] = { ["i"] = 20, }
 	tablefield['groupexpiry'] = { ["i"] = 20, }
 	tablefield['extgroupids'] = { ["v"] = 20, }
 	tablefield['regdate'] = { ["v"] = 20, }
 	tablefield['credits'] = { ["i"] = 20, }
 	tablefield['notifysound'] = { ["i"] = 20, }
 	tablefield['timeoffset'] = { ["i"] = 20, }
 	tablefield['newpm'] = { ["i"] = 20, }
 	tablefield['newprompt'] = { ["i"] = 20, }
 	tablefield['accessmasks'] = { ["i"] = 20, }
 	tablefield['allowadmincp'] = { ["i"] = 20, }
 	tablefield['onlyacceptfriendpm'] = { ["i"] = 20, }
 	tablefield['conisbind'] = { ["i"] = 20, }
 	tablefield['freeze'] = { ["i"] = 20, }
 	tablefield['self'] = { ["i"] = 20, }
 	tablefield['extcredits1'] = { ["i"] = 20, }
 	tablefield['extcredits2'] = { ["i"] = 20, }
 	tablefield['extcredits3'] = { ["i"] = 20, }
 	tablefield['extcredits4'] = { ["i"] = 20, }
 	tablefield['extcredits5'] = { ["i"] = 20, }
 	tablefield['extcredits6'] = { ["i"] = 20, }
 	tablefield['extcredits7'] = { ["i"] = 20, }
 	tablefield['extcredits8'] = { ["i"] = 20, }
 	tablefield['friends'] = { ["i"] = 20, }
 	tablefield['posts'] = { ["i"] = 20, }
 	tablefield['threads'] = { ["i"] = 20, }
 	tablefield['digestposts'] = { ["i"] = 20, }
 	tablefield['doings'] = { ["i"] = 20, }
 	tablefield['blogs'] = { ["i"] = 20, }
 	tablefield['albums'] = { ["i"] = 20, }
 	tablefield['sharings'] = { ["i"] = 20, }
 	tablefield['attachsize'] = { ["v"] = 20, } 
 	tablefield['views'] = { ["i"] = 20, }
 	tablefield['oltime'] = { ["i"] = 20, }
 	tablefield['todayattachs'] = { ["i"] = 20, }
 	tablefield['todayattachsize'] = { ["i"] = 20, }
 	tablefield['feeds'] = { ["i"] = 20, }
 	tablefield['follower'] = { ["i"] = 20, }
 	tablefield['following'] = { ["i"] = 20, }
 	tablefield['newfollower'] = { ["i"] = 20, }
 	tablefield['blacklist'] = { ["i"] = 20, }
 	tablefield['videophoto'] = { ["v"] = 20, }
 	tablefield['spacename'] = { ["v"] = 20, }
 	tablefield['spacedescription'] = { ["v"] = 20, }
 	tablefield['domain'] = { ["v"] = 20, }
 	tablefield['addsize'] = { ["i"] = 20, }
 	tablefield['addfriend'] = { ["i"] = 20, }
 	tablefield['menunum'] = { ["i"] = 20, }
 	tablefield['theme'] = { ["v"] = 20, }
 	tablefield['spacecss'] = { ["v"] = 20, }
 	tablefield['blockposition'] = { ["v"] = 20, }
 	tablefield['recentnote'] = { ["v"] = 20, }
 	tablefield['spacenote'] = { ["v"] = 20, }
	tablefield['privacy_feed_doing'] = { ["i"] = 20, }
	tablefield['privacy_feed_blog'] = { ["i"] = 20, }
	tablefield['privacy_feed_upload'] = { ["i"] = 20, }
	tablefield['privacy_feed_poll'] = { ["i"] = 20, }
	tablefield['privacy_feed_newthread'] = { ["i"] = 20, }
	tablefield['privacy_view_index'] = { ["i"] = 20, }
	tablefield['privacy_view_profile'] = { ["i"] = 20, }
	tablefield['privacy_view_friend'] = { ["i"] = 20, }
	tablefield['privacy_view_wall'] = { ["i"] = 20, }
	tablefield['privacy_view_home'] = { ["i"] = 20, }
	tablefield['privacy_view_doing'] = { ["i"] = 20, }
	tablefield['privacy_view_blog'] = { ["i"] = 20, }
	tablefield['privacy_view_album'] = { ["i"] = 20, }
	tablefield['privacy_view_share'] = { ["i"] = 20, }
	tablefield['privacy_profile_realname'] = { ["i"] = 20, }
	tablefield['privacy_profile_gender'] = { ["i"] = 20, }
	tablefield['privacy_profile_birthday'] = { ["i"] = 20, }
	tablefield['privacy_profile_birthcity'] = { ["i"] = 20, }
	tablefield['privacy_profile_residecity'] = { ["i"] = 20, }
	tablefield['privacy_profile_affectivestatus'] = { ["i"] = 20, }
	tablefield['privacy_profile_lookingfor'] = { ["i"] = 20, }
	tablefield['privacy_profile_bloodtype'] = { ["i"] = 20, }
 	tablefield['feedfriend'] = { ["v"] = 20, }
 	tablefield['magicgift'] = { ["v"] = 20, }
 	tablefield['stickblogs'] = { ["v"] = 20, }
 	tablefield['publishfeed'] = { ["i"] = 20, }
 	tablefield['customshow'] = { ["i"] = 20, }
 	tablefield['customstatus'] = { ["v"] = 20, }
 	tablefield['medals'] = { ["v"] = 20, }
 	tablefield['sightml'] = { ["v"] = 20, }
 	tablefield['groupterms'] = { ["v"] = 20, }
 	tablefield['authstr'] = { ["v"] = 20, }
 	tablefield['groups'] = { ["v"] = 20, }
 	tablefield['attentiongroup'] = { ["v"] = 20, }
 	tablefield['realname'] = { ["v"] = 20, }
 	tablefield['gender'] = { ["i"] = 20, }
 	tablefield['birthyear'] = { ["v"] = 20, }
 	tablefield['birthmonth'] = { ["v"] = 20, }
 	tablefield['birthday'] = { ["v"] = 20, }
 	tablefield['constellation'] = { ["v"] = 20, }
 	tablefield['zodiac'] = { ["v"] = 20, }
 	tablefield['nationality'] = { ["v"] = 20, }
 	tablefield['birthprovince'] = { ["v"] = 20, }
 	tablefield['birthcity'] = { ["v"] = 20, }
 	tablefield['birthdist'] = { ["v"] = 20, }
 	tablefield['birthcommunity'] = { ["v"] = 20, }
 	tablefield['resideprovince'] = { ["v"] = 20, }
 	tablefield['residecity'] = { ["v"] = 20, }
 	tablefield['residedist'] = { ["v"] = 20, }
 	tablefield['residecommunity'] = { ["v"] = 20, }
 	tablefield['residesuite'] = { ["v"] = 20, }
 	tablefield['graduateschool'] = { ["v"] = 20, }
 	tablefield['company'] = { ["v"] = 20, }
 	tablefield['education'] = { ["v"] = 20, }
 	tablefield['occupation'] = { ["v"] = 20, }
 	tablefield['position'] = { ["v"] = 20, }
 	tablefield['revenue'] = { ["v"] = 20, }
 	tablefield['affectivestatus'] = { ["v"] = 20, }
 	tablefield['lookingfor'] = { ["v"] = 20, }
 	tablefield['bloodtype'] = { ["i"] = 20, }
 	tablefield['height'] = { ["v"] = 20, }
 	tablefield['weight'] = { ["v"] = 20, }
 	tablefield['site'] = { ["v"] = 20, }
 	tablefield['bio'] = { ["v"] = 20, }
 	tablefield['interest'] = { ["v"] = 20, }
 	tablefield['field1'] = { ["v"] = 20, }
 	tablefield['field2'] = { ["v"] = 20, }
 	tablefield['field3'] = { ["v"] = 20, }
 	tablefield['field4'] = { ["v"] = 20, }
 	tablefield['field5'] = { ["v"] = 20, }
 	tablefield['field6'] = { ["v"] = 20, }
 	tablefield['field7'] = { ["v"] = 20, }
 	tablefield['field8'] = { ["v"] = 20, }
 	tablefield['port'] = { ["i"] = 20, }
 	tablefield['lastvisit'] = { ["v"] = 20, }
 	tablefield['lastactivity'] = { ["v"] = 20, }
 	tablefield['lastpost'] = { ["v"] = 20, }
 	tablefield['lastsendmail'] = { ["i"] = 20, }
 	tablefield['invisible'] = { ["i"] = 20, }
 	tablefield['buyercredit'] = { ["i"] = 20, }
 	tablefield['sellercredit'] = { ["i"] = 20, }
 	tablefield['favtimes'] = { ["i"] = 20, }
 	tablefield['sharetimes'] = { ["i"] = 20, }
 	tablefield['profileprogress'] = { ["i"] = 20, }
  tablefield['group_grouptitle'] = { ["v"] = 20, }
	tablefield['group_type'] = { ["v"] = 20, }
	tablefield['group_creditshigher'] = { ["i"] = 20, }
	tablefield['group_creditslower'] = { ["i"] = 20, }
	tablefield['group_stars'] = { ["i"] = 20, }
	tablefield['group_color'] = { ["v"] = 20, }
	tablefield['group_icon'] = { ["v"] = 20, }
	tablefield['group_readaccess'] = { ["i"] = 20, }
	tablefield['group_allowgetattach'] = { ["i"] = 20, }
	tablefield['group_allowgetimage'] = { ["i"] = 20, }
	tablefield['group_allowmediacode'] = { ["i"] = 20, }
	tablefield['group_maxsigsize'] = { ["i"] = 20, }
	tablefield['group_allowbegincode'] = { ["i"] = 20, }
	tablefield['group_userstatusby'] = { ["i"] = 20, }
 	tablefield['lastactivitydb'] = { ["i"] = 20, }
 	tablefield['buyerrank'] = { ["i"] = 20, }
 	tablefield['sellerrank'] = { ["i"] = 20, }
 	tablefield['groupiconid'] = { ["i"] = 20, }
 	tablefield['upgradecredit'] = { ["i"] = 20, }
 	tablefield['upgradeprogress'] = { ["i"] = 20, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	