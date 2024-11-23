
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_ruanjianwaibaojiaoyisuo")


musermgr = inherit(GmSql.list,GmBase.CallBack):name("musermgr")



musermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_member')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_member','member_uid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['userform'] = {} 	
	-------
	self.op['userform'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userform()
		for a,b in pairs(top.action['userform']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userform(newpostparam)
		
	end	
		
  self.action['userform']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userform']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userform']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['userform']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }	
  self.action['userform']['follower'] = { ['title'] = '关注' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userform']['following'] = { ['title'] = '粉丝' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userform']['posts'] = { ['title'] = '发布' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userform']['telephone'] = { ['title'] = '固定电话' , ['t'] = 'h' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userform']['realname'] = { ['title'] = '昵称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['userform']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['loginform'] = {} 	
	-------
	self.op['loginform'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:loginform()
		for a,b in pairs(top.action['loginform']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:loginform(newpostparam)
		
	end	
		
  self.action['loginform']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '50' }	
  self.action['loginform']['password'] = { ['title'] = '用户密码' , ['t'] = 's' , ['min'] = '6' , ['max'] = '50' }
  self.action['loginform']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['forgetform'] = {} 	
	-------
	self.op['forgetform'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:forgetform()
		for a,b in pairs(top.action['forgetform']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:forgetform(newpostparam)
		
	end	
		
  self.action['forgetform']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }
  self.action['forgetform']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['userbighead'] = {} 	
	-------
	self.op['userbighead'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userbighead()
		for a,b in pairs(top.action['userbighead']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userbighead(newpostparam)
		
	end	
		
  self.action['userbighead']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userbighead']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userbighead']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['userbighead']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }	
  self.action['userbighead']['follower'] = { ['title'] = '关注' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userbighead']['following'] = { ['title'] = '粉丝' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userbighead']['posts'] = { ['title'] = '发布' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userbighead']['realname'] = { ['title'] = '昵称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['userbighead']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['userlist'] = {} 	
	-------
	self.op['userlist'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userlist()
		for a,b in pairs(top.action['userlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userlist(newpostparam)
		
	end	
		
  self.action['userlist']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userlist']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userlist']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }
  self.action['userlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['fanslist'] = {} 	
	-------
	self.op['fanslist'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:fanslist()
		for a,b in pairs(top.action['fanslist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:fanslist(newpostparam)
		
	end	
		
  self.action['fanslist']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['fanslist']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['fanslist']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['fanslist']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }
  self.action['fanslist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['usersmallhead'] = {} 	
	-------
	self.op['usersmallhead'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:usersmallhead()
		for a,b in pairs(top.action['usersmallhead']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:usersmallhead(newpostparam)
		
	end	
		
  self.action['usersmallhead']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['usersmallhead']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['usersmallhead']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['usersmallhead']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }
  self.action['usersmallhead']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['userhead'] = {} 	
	-------
	self.op['userhead'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userhead()
		for a,b in pairs(top.action['userhead']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userhead(newpostparam)
		
	end	
		
  self.action['userhead']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userhead']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userhead']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['userhead']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }	
  self.action['userhead']['createdate'] = { ['title'] = '' , ['t'] = 'h' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userhead']['follower'] = { ['title'] = '关注' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userhead']['following'] = { ['title'] = '粉丝' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userhead']['posts'] = { ['title'] = '发布' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userhead']['realname'] = { ['title'] = '昵称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['userhead']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['userdetail'] = {} 	
	-------
	self.op['userdetail'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userdetail()
		for a,b in pairs(top.action['userdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userdetail(newpostparam)
		
	end	
		
  self.action['userdetail']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userdetail']['mobilenum'] = { ['title'] = '手机号码' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['userdetail']['member_uid'] = { ['title'] = '用户ID' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userdetail']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['userdetail']['gender'] = { ['title'] = '性别' , ['t'] = 'n' , ['min'] = '1' , ['max'] = '2' }	
  self.action['userdetail']['birthyear'] = { ['title'] = '年' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '4' }	
  self.action['userdetail']['birthmonth'] = { ['title'] = '月' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['birthday'] = { ['title'] = '日' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['constellation'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['userdetail']['mobile'] = { ['title'] = '手机号码' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['userdetail']['groupid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['createdate'] = { ['title'] = '' , ['t'] = 'h' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['follower'] = { ['title'] = '关注' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['following'] = { ['title'] = '粉丝' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['posts'] = { ['title'] = '发布' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['userdetail']['token'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['userdetail']['telephone'] = { ['title'] = '固定电话' , ['t'] = 'h' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['userdetail']['sightml'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '200' }	
  self.action['userdetail']['realname'] = { ['title'] = '昵称' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['userdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['registerform'] = {} 	
	-------
	self.op['registerform'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:registerform()
		for a,b in pairs(top.action['registerform']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:registerform(newpostparam)
		
	end	
		
  self.action['registerform']['mobilenum'] = { ['title'] = '手机号码' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['registerform']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '50' }	
  self.action['registerform']['password'] = { ['title'] = '用户密码' , ['t'] = 's' , ['min'] = '6' , ['max'] = '50' }	
  self.action['registerform']['password2'] = { ['title'] = '用户密码' , ['t'] = 's' , ['min'] = '6' , ['max'] = '50' }
  self.action['registerform']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['userpost'] = {} 	
	-------
	self.op['userpost'] = function(postparam,ui)
	
		local net = GmBase.usernet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:userpost()
		for a,b in pairs(top.action['userpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:userpost(newpostparam)
		
	end	
		
  self.action['userpost']['avatar'] = { ['title'] = '' , ['t'] = 'g' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['userpost']['mobilenum'] = { ['title'] = '手机号码' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['userpost']['username'] = { ['title'] = '用户昵称' , ['t'] = 's' , ['min'] = '4' , ['max'] = '20' }	
  self.action['userpost']['password'] = { ['title'] = '用户密码' , ['t'] = 's' , ['min'] = '6' , ['max'] = '20' }
  self.action['userpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
	-----------------------------
	-------
	self.op['spacecp_profile_base'] = function(postparam,ui)
		print('spacecp_profile_base')
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:spacecp_profile()
		for a,b in pairs(top.action['spacecp_profile_base']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
--		table.print(newpostparam)
		local tb,callbackey = net:spacecp_profile(newpostparam)
	end			
	self.action['spacecp_profile_base'] = {} 		
	self.action['spacecp_profile_base']['gender'] = 						{ ['t'] = 'n' ,['title'] = '性别' ,  ['min'] = '0' , ['default'] = '0' }		
	self.action['spacecp_profile_base']['resideprovince'] = 		{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_base']['residecity'] = 				{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_base']['residedist'] = 				{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_base']['residecommunity'] = 		{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_base']['affectivestatus'] = 		{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_base']['bio'] = 								{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_base']['field1'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_base']['field2'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	

 
	-----------------------------
	-------
	self.op['spacecp_profile_info'] = function(postparam,ui)
		print('spacecp_profile_info')
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:spacecp_profile_info()
		for a,b in pairs(top.action['spacecp_profile_info']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
--		table.print(newpostparam)
		local tb,callbackey = net:spacecp_profile_info(newpostparam)
	end			
	self.action['spacecp_profile_info'] = {} 	
	self.action['spacecp_profile_info']['realname'] = 					{ ['t'] = 'n' ,['title'] = '真实姓名' ,  ['min'] = '0' , ['default'] = '0' }	
	self.action['spacecp_profile_info']['birthprovince'] = 			{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthcity'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthdist'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthcommunity'] = 		{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }		
	self.action['spacecp_profile_info']['birthyear'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthmonth'] = 				{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthday'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }		
	self.action['spacecp_profile_info']['idcardtype'] = 				{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_info']['idcard'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	
	
 
	-----------------------------
	-------
	self.op['spacecp_profile_contact'] = function(postparam,ui)
		print('spacecp_profile_contact')
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:spacecp_profile_contact()
		for a,b in pairs(top.action['spacecp_profile_contact']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)
		local tb,callbackey = net:spacecp_profile_contact(newpostparam)
	end			
	self.action['spacecp_profile_contact'] = {} 		
	self.action['spacecp_profile_contact']['telephone'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_contact']['mobile'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_contact']['icq'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_contact']['qq'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_contact']['msn'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_contact']['taobao'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_contact']['field2'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
					
					
 
	-----------------------------
	-------
	self.op['spacecp_profile_edu'] = function(postparam,ui)
		print('spacecp_profile_edu')
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:spacecp_profile_edu()
		for a,b in pairs(top.action['spacecp_profile_edu']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)
		local tb,callbackey = net:spacecp_profile_edu(newpostparam)
	end			
	self.action['spacecp_profile_edu'] = {} 		
	self.action['spacecp_profile_edu']['graduateschool'] = 						{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_edu']['education'] = 								{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	
	
 
	-----------------------------
	-------
	self.op['spacecp_profile_work'] = function(postparam,ui)
		print('spacecp_profile_work')
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:spacecp_profile_work()
		for a,b in pairs(top.action['spacecp_profile_work']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)
		local tb,callbackey = net:spacecp_profile_work(newpostparam)
	end			
	self.action['spacecp_profile_work'] = {} 
	self.action['spacecp_profile_work']['company'] = { ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_work']['occupation'] = { ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_work']['position'] = { ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_work']['revenue'] = { ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_work']['site'] = { ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	
	
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
		if type(value) == 'number' and value > tonumber(fm) then
			print('musermgr.check_fields_validate' ,type(value) ,string.len(value) , tonumber(fm))
			return false
		elseif type(value) == 'string' and string.len(value) > tonumber(fm) then
			print('musermgr.check_fields_validate' ,type(value) ,string.len(value) , tonumber(fm))
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
						return false,tostring(format[fkey]['title']).." "..tostring(fmkey).." "..tostring(fmvalue).." Error"
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
--		table.print(tb)
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


musermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.usernet.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('musermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('musermgr.get_net_page error ',methon)
	end		
end




musermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['userlist']) do
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


musermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['userlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



musermgr.init_table = function(self)
	local tablefield = {}
	
	--url
	tablefield['avatar'] = { ["v"] = 120, }
    
	--string
	tablefield['mobilenum'] = { ["v"] = 11, }
    
	--number
	tablefield['member_uid'] = { ["i"] = 20, }
    
	--string
	tablefield['username'] = { ["v"] = 20, }
    
	--string
	tablefield['password'] = { ["v"] = 20, }
    
	--string
	tablefield['password2'] = { ["v"] = 20, }
    
	--number
	tablefield['gender'] = { ["i"] = 2, }
    
	--number
	tablefield['birthyear'] = { ["i"] = 4, }
    
	--number
	tablefield['birthmonth'] = { ["i"] = 2, }
    
	--number
	tablefield['birthday'] = { ["i"] = 2, }
    
	--string
	tablefield['constellation'] = { ["v"] = 6, }
    
	--string
	tablefield['mobile'] = { ["v"] = 11, }
    
	--number
	tablefield['groupid'] = { ["i"] = 2, }
    
	--time
	tablefield['createdate'] = { ["i"] = 2, }
    
	--number
	tablefield['follower'] = { ["i"] = 2, }
    
	--number
	tablefield['following'] = { ["i"] = 2, }
    
	--number
	tablefield['posts'] = { ["i"] = 2, }
    
	--string
	tablefield['token'] = { ["v"] = 200, }
    
	--time
	tablefield['telephone'] = { ["i"] = 20, }
    
	--string
	tablefield['sightml'] = { ["v"] = 200, }
    
	--string
	tablefield['realname'] = { ["v"] = 20, }
		
	--table
	tablefield['data'] = { ["t"] = 1, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	