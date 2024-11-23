
gr_module("GmBase")


discuznet = inherit(GmSql.list,GmBase.CallBack):name("discuznet")

discuznet.instance = nil

discuznet.get_instance = function(pagecount)
	if GmBase.discuznet.instance == nil then
		GmBase.discuznet.instance = GmBase.discuznet()
		GmBase.discuznet.instance:init_table()
	end
	return GmBase.discuznet.instance
end



discuznet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'tm/api/dz.php?version=4&prj='..g_mainModule..'&module='
	
	self.tpp = 20
	
end



discuznet.init_table = function(self)

	local tablefield = {}
	
	tablefield['oid'] = { ["i"] = 20, }
	tablefield['refrank'] = { ["i"] = 20, }
	tablefield['reftable'] = { ["v"] = 20, }
	tablefield['tablekey'] = { ["v"] = 20, }
	tablefield['reftype'] = { ["v"] = 20, }
	tablefield['refview'] = { ["v"] = 20, }
	tablefield['odeby'] = { ["v"] = 20, }
	tablefield['data'] = { ["t"] = 1, }
	
	self:create_table( 'discuz_forum_ranklist', tablefield)
	
	self.idPair['discuz_forum_ranklist'] = {}
	self.idPair['discuz_forum_ranklist']['prev'] = '0'
	self.idPair['discuz_forum_ranklist']['next'] = '0'
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	tablefield = {}
	
	tablefield['groupiconid'] = { ["v"] = 20, }
	tablefield['dbdateline'] = { ["v"] = 20, }
	tablefield['number'] = { ["i"] = 20, }
	tablefield['pid'] = { ["i"] = 20, }
	tablefield['fid'] = { ["i"] = 20, }
	tablefield['tid'] = { ["i"] = 20, }
	tablefield['avatar'] = { ["v"] = 256, }
	tablefield['imgsrc'] = { ["v"] = 256, }	
	tablefield['pic'] = { ["v"] = 256, }
	tablefield['thumbpath'] = { ["v"] = 256, }
	tablefield['summary'] = { ["v"] = 120, }
	tablefield['first'] = { ["i"] = 20, }
	tablefield['author'] = { ["v"] = 120, }
	tablefield['username'] = { ["v"] = 120, }	
	tablefield['authorid'] = { ["i"] = 20, }	
	tablefield['adminid'] = { ["i"] = 20, }	
	tablefield['subject'] = { ["v"] = 120, }
	tablefield['dateline'] = { ["v"] = 20, }
	tablefield['message'] = { ["v"] = 500, }
	tablefield['image'] = { ["v"] = 255, }
	tablefield['useip'] = { ["v"] = 120, }
	tablefield['port'] = { ["v"] = 6, }
	tablefield['invisible'] = { ["i"] = 2, }
	tablefield['anonymous'] = { ["i"] = 2, }
	tablefield['usesig'] = { ["v"] = 2, }
	tablefield['htmlon'] = { ["v"] = 2, }
	tablefield['bbcodeoff'] = { ["v"] = 2, }
	tablefield['smileyoff'] = { ["v"] = 2, }
	tablefield['parseurloff'] = { ["v"] = 2, }
	tablefield['attachment'] = { ["v"] = 2, }
	tablefield['rate'] = { ["v"] = 2, }
	tablefield['ratetimes'] = { ["v"] = 2, }
	tablefield['status'] = { ["v"] = 10, }
	tablefield['tags'] = { ["v"] = 2, }
	tablefield['comment'] = { ["v"] = 1, }
	tablefield['replycredit'] = { ["v"] = 10, }
	tablefield['position'] = { ["v"] = 8, }	
	tablefield['price'] = { ["i"] = 20, }
	tablefield['maxposition'] = { ["i"] = 20, }
	tablefield['icon'] = { ["i"] = 20, }
	tablefield['closed'] = { ["i"] = 20, }
	tablefield['views'] = { ["i"] = 20, }
	tablefield['isgroup'] = { ["i"] = 20, }
	tablefield['readperm'] = { ["i"] = 20, }
	tablefield['recommends'] = { ["i"] = 20, }
	tablefield['lastpost'] = { ["i"] = 20, }
	tablefield['posttableid'] = { ["i"] = 20, }
	tablefield['highlight'] = { ["i"] = 20, }
	tablefield['recommend_add'] = { ["i"] = 20, }
	tablefield['special'] = { ["i"] = 20, }
	tablefield['comments'] = { ["i"] = 20, }
	tablefield['displayorder'] = { ["i"] = 20, }
	tablefield['cover'] = { ["i"] = 20, }
	tablefield['hidden'] = { ["i"] = 20, }
	tablefield['stickreply'] = { ["i"] = 20, }
	tablefield['relatebytag'] = { ["i"] = 20, }
	tablefield['lastposter'] = { ["i"] = 20, }
	tablefield['stamp'] = { ["i"] = 20, }
	tablefield['sortid'] = { ["v"] = 20, }
	tablefield['sharetimes'] = { ["i"] = 20, }
	tablefield['heats'] = { ["i"] = 20, }
	tablefield['favtimes'] = { ["i"] = 20, }
	tablefield['moderated'] = { ["i"] = 20, }
	tablefield['recommend_sub'] = { ["i"] = 20, }
	tablefield['replies'] = { ["i"] = 20, }
	tablefield['pushedaid'] = { ["i"] = 20, }
	tablefield['digest'] = { ["i"] = 20, }
	tablefield['typeid'] = { ["i"] = 20, }
	tablefield['groupid'] = { ["i"] = 20, }
	tablefield['memberstatus'] = { ["i"] = 20, }
	tablefield['selectpid'] = { ["i"] = 20, }
	tablefield['data'] = { ["t"] = 1, }
	
	self:create_table( 'discuz_forum_reward', tablefield)
	
	self.idPair['discuz_forum_reward'] = {}
	self.idPair['discuz_forum_reward']['prev'] = '0'
	self.idPair['discuz_forum_reward']['next'] = '0'
	
	
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
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
	
	self:create_table( 'discuz_forum_profile', tablefield)
	
	self.idPair['discuz_forum_profile'] = {}
	self.idPair['discuz_forum_profile']['prev'] = '0'
	self.idPair['discuz_forum_profile']['next'] = '0'
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	local tablefield = {}
	tablefield['pid'] = { ["v"] = 20, }
	tablefield['fid'] = { ["v"] = 20, }
	tablefield['tid'] = { ["v"] = 20, }
	tablefield['avatar'] = { ["v"] = 256, }
	tablefield['imgsrc'] = { ["v"] = 256, }	
	tablefield['pic'] = { ["v"] = 256, }
	tablefield['thumbpath'] = { ["v"] = 256, }
	tablefield['summary'] = { ["v"] = 120, }
	tablefield['first'] = { ["v"] = 2, }
	tablefield['author'] = { ["v"] = 120, }
	tablefield['authorid'] = { ["v"] = 20, }
	tablefield['subject'] = { ["v"] = 120, }
	tablefield['dateline'] = { ["v"] = 20, }
	tablefield['message'] = { ["v"] = 255, }
	tablefield['image'] = { ["v"] = 255, }
	tablefield['useip'] = { ["v"] = 120, }
	tablefield['port'] = { ["v"] = 6, }
	tablefield['invisible'] = { ["i"] = 2, }
	tablefield['anonymous'] = { ["i"] = 2, }
	tablefield['usesig'] = { ["v"] = 2, }
	tablefield['htmlon'] = { ["v"] = 2, }
	tablefield['bbcodeoff'] = { ["v"] = 2, }
	tablefield['smileyoff'] = { ["v"] = 2, }
	tablefield['parseurloff'] = { ["v"] = 2, }
	tablefield['attachment'] = { ["v"] = 2, }
	tablefield['rate'] = { ["v"] = 2, }
	tablefield['ratetimes'] = { ["v"] = 2, }
	tablefield['status'] = { ["v"] = 10, }
	tablefield['tags'] = { ["v"] = 2, }
	tablefield['comment'] = { ["v"] = 1, }
	tablefield['replycredit'] = { ["v"] = 10, }
	tablefield['position'] = { ["v"] = 8, }	
	tablefield['price'] = { ["i"] = 20, }
	tablefield['maxposition'] = { ["i"] = 20, }
	tablefield['icon'] = { ["i"] = 20, }
	tablefield['closed'] = { ["i"] = 20, }
	tablefield['isgroup'] = { ["i"] = 20, }
	tablefield['readperm'] = { ["i"] = 20, }
	tablefield['recommends'] = { ["i"] = 20, }
	tablefield['lastpost'] = { ["i"] = 20, }
	tablefield['posttableid'] = { ["i"] = 20, }
	tablefield['highlight'] = { ["i"] = 20, }
	tablefield['recommend_add'] = { ["i"] = 20, }
	tablefield['special'] = { ["i"] = 20, }
	tablefield['comments'] = { ["i"] = 20, }
	tablefield['displayorder'] = { ["i"] = 20, }
	tablefield['cover'] = { ["i"] = 20, }
	tablefield['hidden'] = { ["i"] = 20, }
	tablefield['stickreply'] = { ["i"] = 20, }
	tablefield['relatebytag'] = { ["i"] = 20, }
	tablefield['lastposter'] = { ["i"] = 20, }
	tablefield['stamp'] = { ["i"] = 20, }
	tablefield['sortid'] = { ["v"] = 20, }
	tablefield['sharetimes'] = { ["i"] = 20, }
	tablefield['heats'] = { ["i"] = 20, }
	tablefield['favtimes'] = { ["i"] = 20, }
	tablefield['moderated'] = { ["i"] = 20, }
	tablefield['recommend_sub'] = { ["i"] = 20, }
	tablefield['replies'] = { ["i"] = 20, }
	tablefield['views'] = { ["i"] = 20, }
	tablefield['pushedaid'] = { ["i"] = 20, }
	tablefield['digest'] = { ["i"] = 20, }
	tablefield['typeid'] = { ["v"] = 20, }
	tablefield['data'] = { ["t"] = 1, }
	
	self:create_table( 'discuz_forum_thread', tablefield)
	
	self.idPair['discuz_forum_thread'] = {}
	self.idPair['discuz_forum_thread']['prev'] = '0'
	self.idPair['discuz_forum_thread']['next'] = '0'
	
	
	local tablefield = {}
	tablefield['pid'] = { ["i"] = 10, }
	tablefield['fid'] = { ["i"] = 10, }
	tablefield['tid'] = { ["i"] = 10, }
	tablefield['replyer'] = { ["i"] = 10, }
	tablefield['first'] = { ["i"] = 10, }
	tablefield['author'] = { ["v"] = 120, }
	tablefield['authorid'] = { ["i"] = 10, }
	tablefield['dateline'] = { ["i"] = 10, }
	tablefield['port'] = { ["i"] = 10, }
	tablefield['invisible'] = { ["i"] = 10, }
	tablefield['anonymous'] = { ["i"] = 10, }
	tablefield['usesig'] = { ["i"] = 10, }
	tablefield['htmlon'] = { ["i"] = 10, }
	tablefield['bbcodeoff'] = { ["i"] = 10, }
	tablefield['smileyoff'] = { ["i"] = 10, }
	tablefield['parseurloff'] = { ["i"] = 10, }
	tablefield['attachment'] = { ["i"] = 10, }
	tablefield['rate'] = { ["i"] = 10, }
	tablefield['ratetimes'] = { ["i"] = 10, }
	tablefield['comment'] = { ["i"] = 10, }
	tablefield['status'] = { ["i"] = 10, }	
	tablefield['replycredit'] = { ["i"] = 10, }
	tablefield['position'] = { ["i"] = 10, }
	tablefield['subject'] = { ["v"] = 120, }
	tablefield['dateline'] = { ["v"] = 20, }
	tablefield['message'] = { ["v"] = 255, }
	tablefield['avatar'] = { ["v"] = 256, }
	tablefield['useip'] = { ["v"] = 256, }
	tablefield['tags'] = { ["v"] = 256, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_forum_post', tablefield)
	
	
	
	local tablefield = {}
	tablefield['classid'] = { ["i"] = 10, }
	tablefield['classname'] = { ["v"] = 50, }
	tablefield['classorder'] = { ["i"] = 4, }
	tablefield['parentid'] = { ["i"] = 10, }
	tablefield['imgsrc'] = { ["v"] = 150, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_active_class', tablefield)
	
	
	local tablefield = {}
	tablefield['ctid'] = { ["i"] = 10, }
	tablefield['uid'] = { ["i"] = 10, }
	tablefield['username'] = { ["v"] = 20, }
	tablefield['name'] = { ["v"] = 20, }
	tablefield['dateline'] = { ["i"] = 10, }
	tablefield['follownum'] = { ["i"] = 10, }
	tablefield['threadnum'] = { ["i"] = 10, }
	tablefield['commentnum'] = { ["i"] = 10, }
	tablefield['desc'] = { ["v"] = 50, }
	tablefield['lastupdate'] = { ["i"] = 10, }
	tablefield['rate'] = { ["i"] = 10, }
	tablefield['ratenum'] = { ["i"] = 10, }
	tablefield['lastpost'] = { ["i"] = 10, }
	tablefield['lastsubject'] = { ["v"] = 50, }
	tablefield['lastposttime'] = { ["i"] = 10, }
	tablefield['lastposter'] = { ["i"] = 10, }
	tablefield['lastvisit'] = { ["i"] = 10, }
	tablefield['pic'] = { ["v"] = 100, }
	tablefield['keyword'] = { ["v"] = 50, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_collection', tablefield)



	local tablefield = {}
	tablefield['typeid'] = { ["i"] = 20, }
	tablefield['fid'] = { ["i"] = 20, }
	tablefield['icon'] = { ["v"] = 256, }
	tablefield['description'] = { ["v"] = 120, }
	tablefield['name'] = { ["v"] = 120, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_forum_threadtype', tablefield)


	
	local tablefield = {}
	tablefield['allowanonymous'] = { ["i"] = 1, }
	tablefield['allowappend'] = { ["i"] = 1, }
	tablefield['allowbbcode'] = { ["i"] = 1, }
	tablefield['alloweditpost'] = { ["i"] = 1, }
	tablefield['alloweditrules'] = { ["i"] = 1, }
	tablefield['allowfeed'] = { ["i"] = 1, }
	tablefield['allowglobalstick'] = { ["i"] = 1, }
	tablefield['allowhtml'] = { ["i"] = 1, }
	tablefield['allowimgcode'] = { ["i"] = 1, }
	tablefield['allowmediacode'] = { ["i"] = 1, }
	tablefield['allowpostspecial'] = { ["i"] = 6, }
	tablefield['allowside'] = { ["i"] = 1, }
	tablefield['allowsmilies'] = { ["i"] = 1, }
	tablefield['allowspecialonly'] = { ["i"] = 1, }
	tablefield['archive'] = { ["i"] = 1, }
	tablefield['autoclose'] = { ["i"] = 6, }
	tablefield['catforumcolumns'] = { ["i"] = 3, }
	tablefield['commoncredits'] = { ["i"] = 10, }
	tablefield['disablecollect'] = { ["i"] = 1, }
	tablefield['disablethumb'] = { ["i"] = 1, }
	tablefield['disablewatermark'] = { ["i"] = 1, }
	tablefield['displayorder'] = { ["i"] = 6, }
	tablefield['domain'] = { ["v"] = 15, }
	tablefield['favtimes'] = { ["i"] = 8, }
	tablefield['fid'] = { ["i"] = 8, }
	tablefield['forumcolumns'] = { ["i"] = 3, }
	tablefield['fup'] = { ["i"] = 8, }
	tablefield['inheritedmod'] = { ["i"] = 1, }
	tablefield['jammer'] = { ["i"] = 1, }
	tablefield['lastpost'] = { ["v"] = 110, }
	tablefield['level'] = { ["i"] = 6, }
	tablefield['modnewposts'] = { ["i"] = 1, }
	tablefield['modworks'] = { ["i"] = 1, }
	tablefield['name'] = { ["v"] = 50, }
	tablefield['imgsrc'] = { ["v"] = 50, }
	tablefield['oldrank'] = { ["i"] = 6, }
	tablefield['posts'] = { ["i"] = 8, }
	tablefield['rank'] = { ["i"] = 6, }
	tablefield['recommend'] = { ["i"] = 6, }
	tablefield['recyclebin'] = { ["i"] = 1, }
	tablefield['sharetimes'] = { ["i"] = 8, }
	tablefield['simple'] = { ["i"] = 1, }
	tablefield['status'] = { ["i"] = 1, }
	tablefield['styleid'] = { ["i"] = 6, }
	tablefield['threadcaches'] = { ["i"] = 1, }
	tablefield['threads'] = { ["i"] = 8, }
	tablefield['todayposts'] = { ["i"] = 8, }
	tablefield['type'] = { ["v"] = 10, }
	tablefield['yesterdayposts'] = { ["i"] = 8, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_forum_forum', tablefield)
	
	self.idPair['discuz_forum_forum'] = {}
	self.idPair['discuz_forum_forum']['prev'] = '0'
	self.idPair['discuz_forum_forum']['next'] = '0'


	local tablefield = {}
	tablefield['fid'] = { ["i"] = 10, }
	tablefield['name'] = { ["v"] = 50, }
	tablefield['description'] = { ["v"] = 50, }
	tablefield['icon'] = { ["v"] = 250, }
	tablefield['founderuid'] = { ["i"] = 10, }
	tablefield['foundername'] = { ["v"] = 50, }
	tablefield['threads'] = { ["i"] = 10, }
	tablefield['posts'] = { ["i"] = 10, }
	tablefield['todayposts'] = { ["i"] = 10, }
	tablefield['lastupdate'] = { ["i"] = 10, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_group', tablefield)
	
	self.idPair['discuz_group'] = {}
	self.idPair['discuz_group']['prev'] = '0'
	self.idPair['discuz_group']['next'] = '0'
	
	local tablefield = {}
	tablefield["favid"] = { ["i"] = 10, }
	tablefield["uid"] = { ["i"] = 10, }
	tablefield["id"] = { ["i"] = 10, }
	tablefield["idtype"] = { ["v"] = 50, }
	tablefield["spaceuid"] = { ["i"] = 10, }
	tablefield["title"] = { ["v"] = 250, }
	tablefield["description"] = { ["v"] = 250, }
	tablefield["dateline"] = { ["v"] = 50, }
	tablefield["icon"] = { ["v"] = 250, }
	tablefield["url"] = { ["v"] = 250, }
	tablefield["message"] = { ["v"] = 450, }
	tablefield["pid"] = { ["i"] = 10, }
	tablefield["useip"] = { ["i"] = 10, }
	tablefield["comment"] = { ["v"] = 250, }
	tablefield["ratetimes"] = { ["v"] = 250, }
	tablefield["status"] = { ["i"] = 10, }
	tablefield['data'] = { ["t"] = 1, }
	self:create_table( 'discuz_favorite', tablefield)
	
	
	self.idPair['discuz_favorite'] = {}
	self.idPair['discuz_favorite']['prev'] = '0'
	self.idPair['discuz_favorite']['next'] = '0'
	
	
	local tablefield = {}
	tablefield[ "cost_verify" ] = { ["i"] = 10, }
	tablefield[ "cost_youhui" ] = { ["i"] = 10, }
	tablefield[ "cost_endtime" ] = { ["i"] = 10, }
	tablefield[ "cost_checktime" ] = { ["i"] = 10, }
	tablefield[ "class" ] = { ["i"] = 10, }
	tablefield[ "cost_number_max" ] = { ["i"] = 10, }
	tablefield[ "cost_credits" ] = { ["i"] = 10, }
	tablefield[ "event_address" ] = { ["v"] = 50, }
	tablefield[ "eid" ] = { ["i"] = 10, }
	tablefield[ "event_number" ] = { ["i"] = 10, }
	tablefield[ "use_cost" ] = { ["v"] = 50, }
	tablefield[ "dateline" ] = { ["i"] = 10, }
	tablefield[ "use_extcredits" ] = { ["i"] = 10, }
	tablefield[ "userfield_message" ] = { ["i"] = 10, }
	tablefield[ "userfield_mobile" ] = { ["i"] = 10, }
	tablefield[ "userfield_realname" ] = { ["i"] = 10, }
	tablefield[ "userfield_field" ] = { ["i"] = 10, }
	tablefield[ "area" ] = { ["v"] = 50, }
	tablefield[ "starttime" ] = { ["i"] = 10, }
	tablefield[ "eventorder" ] = { ["i"] = 10, }
	tablefield[ "cost_number" ] = { ["i"] = 10, }
	tablefield[ "cost_name" ] = { ["v"] = 50, }
	tablefield[ "audit" ] = { ["i"] = 10, }
	tablefield[ "avatar" ] = { ["v"] = 250, }
	tablefield[ 'pic' ] = { ["v"] = 256, }
	tablefield[ "cost_number_min" ] = { ["i"] = 10, }
	tablefield[ "id" ] = { ["i"] = 10, }
	tablefield[ "cost_starttime" ] = { ["i"] = 10, }
	tablefield[ "uid" ] = { ["i"] = 10, }
	tablefield[ "subject" ] = { ["v"] = 50, }
	tablefield[ "citys" ] = { ["v"] = 50, }
	tablefield[ "verify" ] = { ["v"] = 50, }
	tablefield[ "cost_price" ] = { ["i"] = 10, }
	tablefield[ "tid" ] = { ["i"] = 10, }
	tablefield[ "endtime" ] = { ["i"] = 10, }	
	tablefield[ "authorid" ] = { ["i"] = 10, }	
	tablefield[ "recommend_sub" ] = { ["i"] = 10, }
	tablefield[ "icon" ] = { ["i"] = 10, }
	tablefield[ "hidden" ] = { ["i"] = 10, }
	tablefield[ "closed" ] = { ["i"] = 10, }
	tablefield[ "isgroup" ] = { ["i"] = 10, }
	tablefield[ "recommends" ] = { ["i"] = 10, }
	tablefield[ "lastpost" ] = { ["i"] = 10, }
	tablefield[ "highlight" ] = { ["i"] = 10, }
	tablefield[ "displayorder" ] = { ["i"] = 10, }
	tablefield[ "stickreply" ] = { ["i"] = 10, }
	tablefield[ "lastposter" ] = { ["v"] = 50, }
	tablefield[ "stamp" ] = { ["i"] = 10, }
	tablefield[ "sortid" ] = { ["v"] = 10, }
	tablefield[ "sharetimes" ] = { ["i"] = 10, }
	tablefield[ "author" ] = { ["v"] = 50, }
	tablefield[ "bgcolor" ] = { ["v"] = 50, }
	tablefield[ "price" ] = { ["i"] = 10, }
	tablefield[ "fid" ] = { ["i"] = 10, }
	tablefield[ "maxposition" ] = { ["i"] = 10, }
	tablefield[ "replycredit" ] = { ["i"] = 10, }
	tablefield[ "status" ] = { ["i"] = 10, }
	tablefield[ "rate" ] = { ["i"] = 10, }
	tablefield[ "views" ] = { ["i"] = 10, }
	tablefield[ "readperm" ] = { ["i"] = 10, }
	tablefield[ "heats" ] = { ["i"] = 10, }
	tablefield[ "digest" ] = { ["i"] = 10, }
	tablefield[ "recommend_add" ] = { ["i"] = 10, }
	tablefield[ "moderated" ] = { ["i"] = 10, }
	tablefield[ "favtimes" ] = { ["i"] = 10, }
	tablefield[ "comments" ] = { ["i"] = 10, }
	tablefield[ "attachment" ] = { ["i"] = 10, }
	tablefield[ "pushedaid" ] = { ["i"] = 10, }
	tablefield[ "relatebytag" ] = { ["i"] = 10, }
	tablefield[ "typeid" ] = { ["i"] = 10, }
	tablefield[ "posttableid" ] = { ["i"] = 10, }
	tablefield[ "replies" ] = { ["i"] = 10, }
	tablefield[ "special" ] = { ["i"] = 10, }
	tablefield[ "cover" ] = { ["i"] = 10, }
	tablefield['data'] = { ["t"] = 1, }
	                	
	self:create_table( 'discuz_activity', tablefield)
           
	self:initTableStruct()
	
end



discuznet.productpost = function(self,tb) --全部小组列表
	local top = self
	local callbackey = 'discuznet.productpost'
	
	if tb == nil then
		local tb = {}
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_thread',callbackey,tb
	end	
	print('discuznet.productpost')
--	table.print(tb)
	return 'discuz_forum_thread',callbackey	
end


-- upload/source/plugin/mobile/mobile.php?version=3&module=threadtype&typeid=23


-- http://esdo.vicp.net/tm/api/dz.php?version=4&module=profile
discuznet.profile = function(self,tb) --全部小组列表
	local top = self
	local callbackey = 'discuznet.profile'
	
	if tb == nil then
		local tb = {}
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_profile',callbackey,tb
	end	
	
	local url = self.base..'profile'	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top.tablename = 'discuz_forum_profile'
			top:SetDirty(true)
			top:AddorUpdateRecord('uid',netdata['data'])
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_profile',tb,netdata)
		end
	end,tb)	
	return 'discuz_forum_profile',callbackey	
end



discuznet.group_all = function(self) --全部小组列表
	local top = self
	local url = self.base..'group_all'
	print('discuznet.group_all',url)
	gxo_curl(url..'&prj='..g_mainModule ,function(data)	
		--table.print(data)		
		if data['errornum'] == 'E00000' then
			self.tablename = 'discuz_group'
			for a,b in GSortedPairs4(data['data']) do
				top:SetDirty(true)
				top:AddorUpdateRecord('classid',b)
			end
			top:SetDirty(true)
			top:handle_callback('discuznet.group_all')
		end
	end)
end


-- 全部小组列表 http://120.24.2.101/discuz/root/appapi/index.php?mod=collection_list
discuznet.collection_list = function(self)
	local top = self
	local url = self.base..'collection_list'
	print('discuznet.collection_list',url)
	gxo_curl(url..'&prj='..g_mainModule ,function(data)	
		if data['errornum'] == 'E00000' then
			self.tablename = 'discuz_collection'
			for a,b in GSortedPairs4(data['data']) do
				--table.print(data)		
				top:SetDirty(true)
				b['pic'] = 'http://120.24.2.105/discuz/root/data/attachment/forum/'..b['pic']
				top:AddorUpdateRecord('ctid',b)
			end
			top:SetDirty(true)
			top:handle_callback('discuznet.collection_list')
		end
	end)
	return 'discuz_collection','discuznet.collection_list'
end



-- http://esdo.vicp.net/upload/source/plugin/mobile/mobile.php?version=1&module=sendreply&mod=post&action=reply&fid=2&tid=1513&extra=&replysubmit=yes
--[[

mod: post
infloat: yes
action: reply
fid: 2
extra: 
tid: 1566
replysubmit: yes
inajax: 1

------------------------------------

formhash: 3e5d5601
handlekey: reply
noticeauthor: 
noticetrimstr: 
noticeauthormsg: 
usesig: 1
subject: 1111111
message: fgdfgdfgdfgdfgdfgdfgdfgdfgdfgdfg
]]
discuznet.send_reply = function(self,tb,cbkey) 
	local top = self
	local callbackey = cbkey or 'discuznet.send_reply'	
	if tb == nil then
		local tb = {}
		tb.mod='post'
		tb.action='reply'
		tb.module='sendreply'
		tb.net = "discuznet"
		tb.methon = "send_reply"
		tb.infloat='yes'
		tb.fid = ''
		tb.tid = ''
		tb.pid = ''
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_reward',callbackey,tb
	end	
	
	tb.uid = tb.authorid
	tb.wysiwyg = 1
	tb.usesig = 1
	tb.infloat = 'yes'
	
	local fid = tostring(tb.fid or 0)
	local tid = tostring(tb.tid or 0)
	local format =  g_serverRoot.."upload/source/plugin/mobile/mobile.php?version=4&module=sendreply&mod=post&action=reply&fid=%s&tid=%s&extra=&replysubmit=yes"
	local url = string.format(format,fid,tid)	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top:handle_callback(callbackey,tb)
		end
	end,tb)	
	return 'discuz_forum_post',callbackey	
end


-- 删除
--[[
frommodcp: 
reason: 
formhash: 8366ab4f
fid: 2
redirect: http://192.168.1.105/upload/forum.php?mod=viewthread&tid=1527&extra=page%3D1%26filter%3Dsortid%26sortid%3D1
listextra: page%3D1%26filter%3Dsortid%26sortid%3D1
handlekey: mods
moderate[]: 1527

]]
discuznet.rewardremove = function(self,tb)
	local top = self
	local callbackey = 'discuznet.rewardremove'	
	if tb == nil then
		local tb = {}
		tb.fid = ''
		tb.tid = ''
		return 'discuz_forum_post',callbackey,tb
	end	

	tb.uid = GmBase.usernet.member_uid
	
	tb.frommodcp = ''
	tb.reason = '' 
	tb.formhash = GmBase.usernet.formhash	
	tb.fmtformhash = GmBase.usernet.formhash	
	tb.redirect = ''
	tb.listextra = 'page%%3D1%%26filter%%3Dsortid%%26sortid%%3D1'
	tb.handlekey = 'mods'
	tb['moderate[]'] = tb.tid
	tb['operations[]'] = 'delete'
	
	table.print(tb)
	
	local url = g_serverRoot.."upload/forum.php?mod=topicadmin&action=moderate&optgroup=3&modsubmit=yes&infloat=yes&ajax=true&inajax=1"
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			-- todo 还刪除本地
			top:handle_callback(callbackey,tb)
		end
	end,tb)	
	
	return 'discuz_forum_post',callbackey	
end


--[[
我来回答\投标
]]
discuznet.rewardreplypost = function(self,tb)
	local top = self
	local callbackey = 'discuznet.rewardreplypost'	
	if tb == nil then
		local tb = {}
		tb.fid = ''
		tb.tid = ''
		tb.subject = ''
		tb.message = ''
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_reward',callbackey,tb
	end	

	tb.noticeauthor = '' 
	tb.noticetrimstr = ''  
	tb.noticeauthormsg = '' 
	tb.usesig = 1
	tb.handlekey='reply'
	tb.dateline = os.time()
	tb.posttime = os.time()
	
	local fid = tostring(tb.fid or 0)
	local tid = tostring(tb.tid or 0)
	local format = g_serverRoot.."upload/forum.php?mod=post&action=reply&fid=%s&tid=%s&extra=&replysubmit=yes&infloat=yes&ajax=true&ajaxdata=json"
	local url = string.format(format,fid,tid)	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top:handle_callback(callbackey,tb)
		end
	end,tb)	
	return 'discuz_forum_post',callbackey	
end


--[[
添加商品、服务
http://192.168.1.105/upload/forum.php?mod=post&action=reply&fid=93&tid=1783&extra=&replysubmit=yes


wysiwyg: 1
noticeauthor: 
noticetrimstr: 
noticeauthormsg: 
special: 2
subject: 

trade: yes
item_type: 1
item_name: sdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
item_number: 1
item_quality: 1
transport: offline
item_price: 1
item_costprice: 
item_credit: 
item_costcredit: 
postage_mail: 
postage_express: 
postage_ems: 
paymethod: 1
tenpay_account: 
sortid: 4
item_locus: 
item_expiration: 2024-03-02
tradeaid: 1490
tradeaid_url: 202401/31/034026xgcjc2pdeens2s6z.png
message: 
usesig: 1
rewardprice: 1
replysubmit: true
save: 
]]
discuznet.productpost = function(self,tb)
	local top = self
	local callbackey = 'discuznet.productpost'	
	if tb == nil then
		local tb = {}
		tb.fid = ''
		tb.tid = ''
		tb.subject = ''
		tb.message = ''
		tb.tradeaid = ''
		tb.tradeaid_url = ''
		tb.sortid = ''
		tb.item_price = '1'
		return 'discuz_forum_thread',callbackey,tb
	end	

	tb.item_name = tb.subject
	
	tb.uid = GmBase.usernet.member_uid
	tb.authorid = GmBase.usernet.member_uid
	tb.formhash = GmBase.usernet.formhash	
	tb.fmtformhash = GmBase.usernet.formhash	
	tb.posttime = os.time()

	tb.wysiwyg = '1'
	tb.special = '2'
	tb.item_type = '1'
	tb.trade = 'yes'
	tb.item_number = '1'
	tb.item_quality = '1'
	tb.transport = 'offline'
	tb.paymethod = '1'
	tb.item_expiration = '2024-05-02'
	
	tb.usesig = '1'
	tb.rewardprice = '1'

	tb.noticeauthor = ''
	tb.noticetrimstr = ''
	tb.noticeauthormsg = ''
	tb.item_costprice = ''
	tb.item_credit = ''
	tb.item_costcredit = ''
	tb.postage_mail = ''
	tb.postage_express = ''
	tb.postage_ems = ''
	tb.tenpay_account = ''
	tb.item_locus = ''
	tb.message = ''
	tb.save = ''
	
--	table.print(tb)

	
	local fid = tostring(tb.fid or 0)
	local tid = tostring(tb.tid or 0)
	local format = g_serverRoot.."upload/forum.php?mod=post&action=reply&fid=%s&tid=%s&extra=&replysubmit=yes&ajax=true"
	local url = string.format(format,fid,tid)
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top:handle_callback(callbackey,tb)
		end
	end,tb)
	
	return 'discuz_forum_thread',callbackey	
end

--[[

选择投标

]]
discuznet.best_answer = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.'..debug.getinfo(1).name		
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "best_answer"
		tb.tid = ''
		tb.pid = ''
		tb.page = '1'
		tb.optgroup= ''
    tb.operation= ''
    tb.listextra= ''
    tb.first='0'
		return 'discuz_forum_reward',callbackey,tb
	end	
	
	tb.uid = GmBase.usernet.member_uid
	tb.authorid = GmBase.usernet.member_uid
	tb.formhash = GmBase.usernet.formhash	
	tb.fmtformhash = GmBase.usernet.formhash	
	
	local formhash = tostring(tb.formhash)
	local tid = tostring(tb.tid)
	local pid = tostring(tb.pid)
	local uid = tostring(tb.uid)
	local authorid = tostring(tb.authorid)
	local format =  g_serverRoot.."tm/api/dz.php?version=4&module=bestanswer&formhash=%s&mod=misc&action=bestanswer&tid=%s&pid=%s&from=&bestanswersubmit=yes&uid=%s&authorid=%s"
	local url = string.format(format,formhash,tid,pid,uid,authorid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top:handle_callback('discuznet.best_answer',tb)
		end
	end,tb)	
	return 'discuz_forum_reward',callbackey	
end




--[[
发布悬赏 

selectsortid: 1
sortid: 1
typeoption[email]: 12
typeoption[price]: 12
typeoption[esjy_isshangjia]: 1
typeoption[esjy_area]: 阳春11111111111111
typeoption[esjy_tel]: 18802525783
subject: 制作网站
rewardprice: 1
message: 


unused[]: 1423
unused[]: 1422
formhash: b48a48b0
posttime: 1703396158
wysiwyg: 1
special: 3
readperm: 
tags: 
rushreplyfrom: 
rushreplyto: 
rewardfloor: 
replylimit: 
stopfloor: 
creditlimit: 
cronpublishdate: 
allownoticeauthor: 1
addfeed: 1
usesig: 1
topicsubmit: true
save: 
adddynamic: true

]]
discuznet.rewardpost = function(self,tb)

	local top = self
	local callbackey = 'discuznet.rewardpost'	
	if tb == nil then
	
		local tb = {}
		tb['fid'] = '0'
		tb['sortid'] = '1'
		tb['typeoption[email]'] = '12'
		tb['typeoption[price]'] = '12'
		tb['typeoption[esjy_class]'] = '1'
		tb['typeoption[esjy_isshangjia]'] = '1'
		tb['typeoption[esjy_area]'] = '-'
		tb['typeoption[esjy_tel]'] = '-'
		tb['subject'] = '-'
		tb['rewardprice'] = 0
		tb['message'] = '-'

		return 'discuz_forum_thread',callbackey,tb
	end
	
	tb.net = "discuznet"
	tb.methon = "rewardpost"
	
	tb['fid'] = '2'
	tb['selectsortid'] = tb['sortid']
		
	tb['unused[]'] = '1423'
	tb['unused[]'] = '1422'
	tb['formhash'] = GmBase.usernet.formhash	
	tb['posttime'] = os.time()
	tb['wysiwyg'] = '1'
	tb['special'] = '3'
	tb['readperm'] = ''
	tb['rushreplyfrom'] = ''
	tb['rushreplyto'] = '' 
	tb['rewardfloor'] = '' 
	tb['replylimit'] = ''
	tb['stopfloor'] = ''
	tb['creditlimit'] = ''
	tb['cronpublishdate'] = ''
	tb['allownoticeauthor'] = '1'
	tb['addfeed'] = '1'
	tb['usesig'] = '1'
	tb['topicsubmit'] = true
	tb['save'] = ''
	tb['adddynamic'] = true
	
	--table.print(tb)
		
	local url =  g_serverRoot..'upload/forum.php?ajaxdata=json&ajax=true&mod=post&action=newthread&fid='..tostring(tb['fid'])..'&extra=&topicsubmit=yes'
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		--table.print(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			top:handle_callback(callbackey,tb,netdata)
		end
	end,tb)
	
	return 'discuz_forum_post',callbackey
	
end



discuznet.forum_misc = function(self,tb)
	local top = self
	local callbackey = 'discuznet.forum_misc'	
	if tb == nil then
		local tb = {}
		tb.fid = ''
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_reward',callbackey,tb
	end
	
	local fid = tostring(tb.fid or 0)
	local format = g_serverRoot.."upload/forum.php?mod=misc&action=upload&fid=%s&type=image&infloat=yes&handlekey=upload&inajax=1&ajaxtarget=fwin_content_upload&ajax=true"
	local url = string.format(format,fid,tid)	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)

		top:handle_callback(callbackey,tb,netdata)
	end)	
	return 'discuz_forum_post',callbackey	
	
end


-- 
--[[
formhash: 8af14a6e
posttime: 1689690840
wysiwyg: 1
subject: %E5%88%86%E7%B1%BB2%E5%B8%96%E5%AD%90%E6%B5%8B%E8%AF%951
selectsortid: 10
sortid: 10
typeoption%5Bcity%5D: 1.1.1
message: %E5%88%86%E7%B1%BB2%E5%B8%96%E5%AD%90%E6%B5%8B%E8%AF%951%0D%0A
replycredit_times: 1
replycredit_extcredits: 0
replycredit_membertimes: 1
replycredit_random: 100
readperm: 
price: 
tags: 
rushreplyfrom: 
rushreplyto: 
rewardfloor: 
replylimit: 
stopfloor: 
creditlimit: 
cronpublishdate: 
allownoticeauthor: 1
usesig: 1
save: 
file: 
uploadalbum: -2
newalbum: %E8%AF%B7%E8%BE%93%E5%85%A5%E7%9B%B8%E5%86%8C%E5%90%8D%E7%A7%B0
file: 

]]
discuznet.forumpost = function(self,tb,cbkey)


	local top = self
	local callbackey =  cbkey or 'discuznet.forumpost'	
	if tb == nil then
		local tb = {}
		tb.fid = '2'
		tb.lastid = ''
		tb.first = ''	
		tb.sortid = '1'	
		tb.subject = ''	
		tb.message = ''	
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_thread',callbackey,tb
	end
	
	tb.uid = GmBase.usernet.member_uid
	tb.authorid = tb.uid
	tb.selectsortid = tb.sortid
	tb.posttime = os.time()
	tb.wysiwyg = 1
	tb.mod="post"
	tb.action = "newthread"
	tb.net = "discuznet"
	tb.methon = "forum_post"
	
	
	local fid = tostring(tb.fid)
	local format =  g_serverRoot.."upload/source/plugin/mobile/mobile.php?version=4&module=newthread&mod=post&action=newthread&fid=%s&topicsubmit=yes"
	local url = string.format(format,fid)
	for a,b in pairs(tb) do
		if string.len(tostring(b)) < 20 then
			url = url..'&'..tostring(a)..'='..tostring(b)
		end
	end
	if tb.price then
		url = url..'&rewardprice='..tostring(tb.price)
	end
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
--		table.print(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			local data = netdata['data']
			self.tablename = 'discuz_forum_thread'		
			top:SetDirty(true)	
			local a,b,c = top:AddorUpdateRecord('tid',data)
			top:reset_maxminid('discuz_forum_thread','tid')
			print(callbackey,' handle_callback')
			top:handle_callback(callbackey,tb)
		end
	end,tb)
	return 'discuz_forum_post',callbackey
	
end



--http://120.24.2.101/discuz/root/appapi/index.php?mod=forum_post&lastid=11&first=1&act=prev
discuznet.forum_post = function(self,tb,cbkey) 
	local top = self
	local callbackey = cbkey or 'discuznet.'..debug.getinfo(1).name		
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "forum_post"
		tb.fid = 0
		tb.lastid = nil
		tb.first = nil	
		tb.sortid = 0
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash	
		return 'discuz_forum_thread',callbackey,tb
	end
	
	tb.uid = GmBase.usernet.member_uid
	tb.selectsortid = tb.sortid
	tb.posttime = os.time()
	
	local fid = tostring(tb.fid)
	local format =  g_serverRoot.."upload/source/plugin/mobile/mobile.php?version=4&module=newthread&mod=post&action=newthread&fid=%s&topicsubmit=yes"
	local url = string.format(format,fid)
	for a,b in pairs(tb) do
		if string.len(tostring(b)) < 20 then
			url = url..'&'..tostring(a)..'='..tostring(b)
		end
	end
	if tb.price then
		url = url..'&rewardprice='..tostring(tb.price)
	end
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
--		table.print(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			local data = netdata['data']
			self.tablename = 'discuz_forum_thread'		
			top:SetDirty(true)	
			local a,b,c = top:AddorUpdateRecord('tid',data)
			top:reset_maxminid('discuz_forum_thread','tid')
		
			print('discuznet.forum_post handle_callback')
			top:handle_callback('discuznet.forum_post',tb)
		end
	end,tb)
	return 'discuz_forum_post','discuznet.forum_post'
end



--[[

formhash: 7e188551
posttime: 1693144436
wysiwyg: 1
special: 2
subject: 555
unused[]: 1381
unused[]: 1380
unused[]: 1379
unused[]: 1374
unused[]: 1373
unused[]: 1372
unused[]: 1371
unused[]: 1370
unused[]: 1369
unused[]: 1367
unused[]: 1366
unused[]: 1364
unused[]: 1361
unused[]: 1359
trade: yes
item_type: 1
item_name: 555
item_number: 55
item_quality: 1
transport: offline
item_price: 55
item_costprice: 555
item_credit: 5
item_costcredit: 555
postage_mail: 
postage_express: 
postage_ems: 
paymethod: 1
tenpay_account: 
sortid: 5
item_locus: 
item_expiration: 2023-09-27
tradeaid: 1382
tradeaid_url: 202308/27/135404h7ormuar55kbzraz.png
message: 5555555555
readperm: 
tags: 
cronpublishdate: 
allownoticeauthor: 1
addfeed: 1
usesig: 1
save: 
file: 
uploadalbum: -2
newalbum: 请输入相册名称
file: 
﻿
upload/forum.php?mod=post&action=newtrade&fid=3&extra=&topicsubmit=yes
-------------------------------------------------------------------------------------------

mod: post
action: newtrade
fid: 93
extra: 
topicsubmit: yes
formhash: 73339b00
posttime: 1711070317
wysiwyg: 1
special: 2
fmtformhash: 73339b00
fmtuploadtype: local
remoteimgurl: 
localimgurl: 202403/22/011927tffz73cfe3c66w44.png
sortid: 1
subject: 11111111111
item_name: 111111111111
item_number: 1
item_quality: 1
transport: offline
item_price: 1
item_costprice: 
item_credit: 
item_costcredit: 
postage_mail: 
postage_express: 
postage_ems: 
paymethod: 1
tenpay_account: 
sortid: 1
item_locus: 
item_expiration: 2024-04-22
tradeaid: 
tradeaid_url: 
unused[]: 1569
unused[]: 1568
unused[]: 1490
unused[]: 1478
unused[]: 1476
unused[]: 1471
unused[]: 1470
unused[]: 1469
unused[]: 1467
unused[]: 1461
unused[]: 1458
unused[]: 1442
unused[]: 1429
unused[]: 1428
unused[]: 1427
unused[]: 1426
unused[]: 1425
unused[]: 1423
unused[]: 1422
selectsortid: 1
typeoption[esjy_class]: 2
typeoption[esjy_isshangjia]: 1
typeoption[esjy_area]: 1
message: 
readperm: 
tags: 
cronpublishdate: 
allownoticeauthor: 1
usesig: 1
rewardprice: 1
topicsubmit: true
save: 


]]
discuznet.trade_post = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.'..debug.getinfo(1).name		
	if tb == nil then
		local tb = {}


		tb.sortid = '0'
		tb.subject = ''
		tb.message = ''
		
		
		tb.localimgurl = ''
		
		tb.tradeaid = ''
		tb.tradeaid_url = ''
		
		tb.item_type = '' -- 全新/二手
		tb.item_number = '99999' -- 商品数量
		
		tb.item_price = '' -- 现价
		tb.item_costprice = '' -- 原价
		tb.item_credit = '' -- 现价积分
		tb.item_costcredit = '' -- 原价积分
		
		tb.tenpay_account = ''
		
		tb.item_locus = '' -- 所在地点:
		tb.item_expiration = '' -- 有效期至
		
		tb.tags = ''
		tb.file = ''
		
		return 'discuz_forum_thread',callbackey,tb
	end
	
	tb.authorid = GmBase.usernet.member_uid
	tb.uid = GmBase.usernet.member_uid
	tb.formhash = GmBase.usernet.formhash	
	tb.fmtformhash = GmBase.usernet.formhash	
	
	tb.net = "discuznet"
	tb.methon = "trade_post"
	
	tb.posttime = os.time()
	tb.cronpublishdate = ''
	tb.allownoticeauthor = '1'
	tb.usesig = '1'
	tb.wysiwyg = '1'
	tb.special = '2'
	tb.trade = 'yes'
	tb.transport = 'seller'
	tb.cronpublishdate = ''
	tb.allownoticeauthor = '1'
	tb.addfeed = '1'
	tb.usesig = '1'
	tb.save = ''
	tb.readperm = ''
	tb.uploadalbum = "-2"
	tb.newalbum = "请输入相册名称"
	tb.item_quality = '1'
	tb.transport = 'offline'
	tb.paymethod = '1' -- 交易方式

	tb.fmtuploadtype = 'local'
	tb.remoteimgurl = '' 
	tb.item_name = tb.subject
	
	tb.postage_mail = 0 -- 平邮
	tb.postage_express = 0 -- 快递
	tb.postage_ems = 0 -- EMS
		
	local format =  g_serverRoot.."upload/forum.php?mod=post&action=newtrade&fid=%s&extra=&topicsubmit=yes&ajax=true&inajax=yes&infloat=yes&simple=2"
	local url = string.format(format,tostring(tb.fid))
	
	print('discuznet.trade_post',url)
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		-- table.print(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			local data = netdata['data']
			self.tablename = 'discuz_forum_thread'		
			top:SetDirty(true)	
			local a,b,c = top:AddorUpdateRecord('tid',data)
			top:reset_maxminid('discuz_forum_thread','tid')
			top:handle_callback('discuznet.forum_post',tb)
		end
	end,tb)
	return 'discuz_forum_post','discuznet.trade_post'
end



--[[

mod: swfupload
operation: upload
type: image
inajax: yes
infloat: yes
simple: 2


handlekey: upload
uid: 31

]]
discuznet.image_post = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.image_post'	
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "image_post"
		tb.handlekey = "upload"
		tb.hash = ''
		tb.Filedata = ''
		tb.fid = ''
		return 'discuz_forum_thread',callbackey,tb
	end
	tb.uid = GmBase.usernet.member_uid
	local url = g_serverRoot.."upload/misc.php?mod=swfupload&operation=upload&type=image&inajax=yes&infloat=yes&simple=2&ajax=true"
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
			--table.print(netdata)
			top:handle_callback(callbackey,tb,netdata)
	end,tb)
	return 'discuz_forum_post',callbackey
end






discuznet.viewreward = function(self,tb)

	local top = self
	local callbackey = 'discuznet.viewreward'
	local tbname = 'discuz_forum_thread'
	
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "viewthread"
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash		
		tb.tid = '0'
		tb.page = 1
		tb.filter = 'typeid'
		return tbname,callbackey,tb
	end
	
	local tid = tostring(tb.tid)
	local url = g_serverRoot..'upload/forum.php?mod=viewthread&ajax=1'
	for a,b in pairs(tb) do
		if string.len(tostring(b)) < 20 then
			url = url..'&'..tostring(a)..'='..tostring(b)
		end
	end
	
	--print('discuznet.viewreward',url)
	--debug.pause(true)

	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			--table.print(netdata)
			top.tablename = tbname
			local data = netdata['data']
			local ids = "0"
			if data and table.size(data) > 0 then
				for k,v in GSortedPairs4(data) do
					top:SetDirty(true)
					ids = ids..','..tostring(v['pid'])
					local a,b,c = top:AddorUpdateRecord('pid',v)
				end
			end
			top:SetDirty(true)
			cwarn('discuznet.viewreward result',callbackey,tbname,tb,netdata,'pid',ids)
			top:handle_callback(callbackey,tbname,tb,netdata,'pid',ids)
			top:reset_maxminid(tbname,'pid')
		end
	end,tb)
	
	return tbname,'discuznet.viewreward'
	
end


discuznet.rewarddetail = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.rewarddetail'		
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "rewarddetail"
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash		
		tb.tid = '1500'
		tb.page = 1
		tb.filter = 'typeid'
		tb.typeid = 1		
		return 'discuz_forum_thread',callbackey,tb
	end
	local tid = tostring(tb.tid)
	local format = g_serverRoot.."upload/forum.php?mod=viewthread&tid=%s&ajax=true"
	-- local format = g_serverRoot.."upload/source/plugin/mobile/mobile.php?version=4&module=viewthread&filter=typeid&page=1&tid=%s&typeid=1"
	local url = string.format(format,tid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			self.tablename = 'discuz_forum_thread'
			local data = netdata['data']
			
			local a,b,c = top:AddorUpdateRecord('tid',data)
			
			
			local ids = "0"
			if data['replyitems'] and table.size(data['replyitems']) > 0 then
				for k,v in GSortedPairs4(data['replyitems']) do
					top:SetDirty(true)
					ids = ids..','..tostring(v['tid'])
					local a,b,c = top:AddorUpdateRecord('tid',v)
					--print('discuznet.rewarddetail',a,b,c)
				end
			end
			
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_thread',tb,netdata,'tid',ids)
			top:reset_maxminid('discuz_forum_thread','tid')
		end
	end,tb)
	return 'discuz_forum_post','discuznet.rewarddetail'
end




discuznet.viewthread = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.viewthread'		
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "viewthread"	
		tb.tid = '1500'
		tb.page = 1
		
		tb.filter = 'typeid'
		tb.typeid = 1		
		return 'discuz_forum_thread',callbackey,tb
	end
	
	tb.uid = GmBase.usernet.member_uid
	tb.formhash = GmBase.usernet.formhash	
	tb.fmtformhash = GmBase.usernet.formhash	
	
	local tid = tostring(tb.tid)
	local format = g_serverRoot.."upload/forum.php?mod=viewthread&tid=%s&ajax=true"
	-- local format = g_serverRoot.."upload/source/plugin/mobile/mobile.php?version=4&module=viewthread&filter=typeid&page=1&tid=%s&typeid=1"
	local url = string.format(format,tid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			self.tablename = 'discuz_forum_thread'
			local data = netdata['data']
			local ids = "0"
			if data and table.size(data) > 0 then
				for k,v in GSortedPairs4(data) do
					top:SetDirty(true)
					ids = ids..','..tostring(v['tid'])
					local a,b,c = top:AddorUpdateRecord('tid',v)
				end
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_thread',tb,netdata,'tid',ids)
			top:reset_maxminid('discuz_forum_thread','tid')
		end
	end,tb)
	return 'discuz_forum_post','discuznet.viewthread'
end



discuznet.viewtradethread = function(self,tb) 
	local top = self
	local callbackey = 'discuznet.viewtradethread'		
	if tb == nil then
		local tb = {}
		tb.net = "discuznet"
		tb.methon = "viewthread"
		tb.uid = GmBase.usernet.member_uid
		tb.formhash = GmBase.usernet.formhash	
		tb.fmtformhash = GmBase.usernet.formhash		
		tb.tid = '1500'
		tb.page = 1
		tb.filter = 'typeid'
		tb.typeid = 1		
		return 'discuz_forum_thread',callbackey,tb
	end
	local tid = tostring(tb.tid)
	local format = g_serverRoot.."upload/forum.php?mod=viewthread&tid=%d&ajax=true"
	local url = string.format(format,tid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			self.tablename = 'discuz_forum_thread'
			local data = netdata['data']
			local ids = "0"
			if data and table.size(data) > 0 then
			data.data = TableToString(data)
				local a,b,c = top:AddorUpdateRecord('tid',data)
				if data.replyitems and table.size(data.replyitems) > 0 then
					for k,v in GSortedPairs4(data.replyitems) do
						top:SetDirty(true)
						ids = ids..','..tostring(v['tid'])
						local a,b,c = top:AddorUpdateRecord('tid',v)
						print(5,a,b,c)
					end
				end
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_thread',tb,netdata,'tid',ids)
			top:reset_maxminid('discuz_forum_thread','tid')
		end
	end,tb)
	return 'discuz_forum_post','discuznet.viewthread'
end



discuznet.novellist = function(self,tb,callback)
	local a,b,c = self:forum_thread(tb,callback)
	return a,b,c
end


-- 分类下的帖子列表
-- http://192.168.1.102/upload/forum.php?mod=forumdisplay&fid=2&filter=sortid&sortid=1&sortall=1&ajax=true
discuznet.forum_type_thread = function(self,tb,callback)
	local callbackey = 'discuznet.forum_type_thread'		
	
	if tb == nil then
		local tb = {}
		tb.ajax = 'true'
		tb.digest = 0
		tb.fid = 1
		tb.tpp = self.tpp
		tb.page = 1
		tb.view = 'hot'
		tb.filter = 'sortid'
		tb.sortid = nil
		tb.list_source = 'none'
		return 'discuz_forum_thread',callbackey,tb
	end	
	

	local top = self	 
	local fid = tb.fid
	local page = tb.page
	local view = tb.view
	local sortid = tb.sortid
	local tpp = tb.tpp	
	
	
	local url = g_serverRoot..'upload/forum.php?mod=forumdisplay&ajax=true&'
	if fid then
		url = url..'&fid='..tostring(fid)
	end
	if page then
		url = url..'&page='..tostring(page)
	end
	if view then
		url = url..'&view='..tostring(view)
	end
	if sortid then
		url = url..'&filter=sortid&sortid='..tostring(sortid)
	end
	if tpp then
		url = url..'&tpp='..tostring(tpp)
	end
	
	print("discuznet.forum_type_thread start",url)
	
	gxo_curl(url, callback or function(netdata)
		--print("discuznet.forum_type_thread stop",url)
		--print(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
			self.tablename = 'discuz_forum_thread'
			local data = netdata['data']
			local ids = "0"
			if data and table.size(data) > 0 then
				for k,v in GSortedPairs4(data) do
					-- table.print(v)
					top:SetDirty(true)
					ids = ids..','..tostring(v['tid'])
					local a,b,c = top:AddorUpdateRecord('tid',v)
				end
			end
			top:SetDirty(true)
			--print(callbackey,'discuz_forum_thread',tb,netdata,'tid',ids)
			top:handle_callback(callbackey,'discuz_forum_thread',tb,netdata,'tid',ids)
			top:reset_maxminid('discuz_forum_thread','tid')
		end
	end,tb)
	return 'discuz_forum_thread',callbackey
	
	
	
end


-- http://192.168.1.105/upload/forum.php?mod=forumdisplay&fid=2&sortall=1&sortall=1&filter=sortall&page=1&ajax=1
-- todo http://esdo.vicp.net/tm/api/dz.php?version=4&module=forumdisplay&fid=83&page=1&tpp=20&view=hot&sortid=dateline
discuznet.forum_thread = function(self,tb,callback)

	local callbackey = 'discuznet.forum_thread'		
	
	if tb == nil then
		local tb = {}
		tb.digest = 0
		tb.fid = 0
		tb.sortid = 0
		tb.page = 1
		tb.list_source = 'none'
		return 'discuz_forum_thread',callbackey,tb
	end	
	
	
	
	local top = self	 
	local fid = tb.fid
	local page = tb.page
	local view = tb.view
	local sortid = tb.sortid
	local tpp = tb.tpp
	
	local url = g_serverRoot..'upload/forum.php?mod=forumdisplay&ajax=true'
	if fid ~= nil and tonumber(fid) > 0 then
		url = url..'&fid='..tostring(fid)
	end
	
	if page ~= nil and tonumber(page) > 0 then
		url = url..'&page='..tostring(page)
	end
	
	if sortid ~= nil and tonumber(sortid) > 0 then
		url = url..'&filter=sortid&sortid='..tostring(sortid)
	else
		url = url..'&filter=sortall&sortall=1'
	end
	
	gxo_curl(url,callback or function(netdata)
		if netdata['error'] == 0 and netdata['data'] ~= nil then
		
			local ttop = top
			local ttb = tb
			
			print('discuznet.forum_thread',url)
			
			self.tablename = 'discuz_forum_thread'
			local data = netdata['data']
			local ids = "0"
			if data and table.size(data) > 0 then
				for k,v in GSortedPairs4(data) do
					table.print(v)
					v['data'] = TableToString(v)
					ttop:SetDirty(true)
					ids = ids..','..tostring(v['tid'])
					local a,b,c = ttop:AddorUpdateRecord('tid',v)
				end
			end
			
			ttop:SetDirty(true)
			ttop:reset_maxminid('discuz_forum_thread','tid')
			
			ttop:handle_callback(callbackey,'discuz_forum_thread', ttb, netdata,'tid',ids)
				
		end
	end,tb)
	
	return 'discuz_forum_thread',callbackey
	
end




discuznet.threadtypelist = function(self,postparam)
	local top = self	
	
	local callbackey = 'discuznet.threadtypelist'	
	if postparam == nil then
		local tb = {}
		tb.fid = nil
		tb.typeid = nil
		return 'discuz_forum_threadtype',callbackey,tb
	end	
	
	-- upload/source/plugin/mobile/mobile.php?version=3&module=threadtype&typeid=23
	
	print('###################################　discuznet.threadtypelist')
	table.print(postparam)
	
	local url = ""
	if postparam.fid then
		url = g_serverRoot..'upload/source/plugin/mobile/mobile.php?version=3&module=threadtype&fid='..tostring(postparam.fid)..'&prj='..g_mainModule
	else
		url = g_serverRoot..'upload/source/plugin/mobile/mobile.php?version=3&module=threadtype&typeid='..tostring(postparam.typeid)..'&prj='..g_mainModule
	end
	print(url)
	
	gxo_curl(url..'&prj='..g_mainModule , function(netdata)
		if netdata['success'] and netdata['error'] == 0 then
			top.tablename = 'discuz_forum_threadtype'
			if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
				top:SetDirty(true)
				netdata['data']['typeid'] = postparam.typeid
				netdata['data']['data'] = TableToString(netdata['data'])
				local a,b,c = top:AddorUpdateRecord('typeid',netdata['data'])
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_threadtype',postparam,netdata)	
		end
	end,postparam)
	
	return 'discuz_forum_threadtype',callbackey	
end



discuznet.forumlist = function(self,tb,callback)
	return self:forum_forum(tb,callback)
end

---http://192.168.1.141/tm/api/dz.php?version=4&module=forumnav&fup=38
discuznet.forum_forum = function(self,postparam)

	local callbackey = 'discuznet.forum_forum'
	
	if postparam == nil then
		local tb = {}
		tb.fup = 1
		return 'discuz_forum_forum',callbackey,tb
	end
	
	local top = self
	local url = self.base..'forumnav&fup='..tostring(postparam.fup)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['success'] and netdata['error'] == 0 then
			top.tablename = 'discuz_forum_forum'
			if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
				for a,b in GSortedPairs4(netdata['data']) do
					top:SetDirty(true)
					if b.imgsrc ~= nil then
						b.imgsrc = g_serverRoot..'upload/data/attachment/common/'..b.imgsrc
					end
					b['data'] = TableToString(b)
					top:AddorUpdateRecord('fid',b)
				end
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,'discuz_forum_forum',postparam,netdata)	
		end
	end)
	return 'discuz_forum_forum',callbackey	
end



discuznet.forum_guide = function(self,postparam)
	local top = self
	local callbackey = self.classname..'.forum_guide'	
	self.table = 'discuz_forum_post'
	if postparam == nil then
		local tb = {}
		tb.view='new'
		tb.fid='0'
		tb.uid='0'
		tb.tpp=20
		return top.table,callbackey,tb
	end	
	
	local uuid = postparam.uid
			
	postparam.ajax='true'
	
	local url = g_serverRoot..'upload/forum.php?mod=guide&'
	for k,v in pairs(postparam) do
		if v ~= nil then
			url = url..tostring(k)..'='..tostring(v)..'&'
		end
	end
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		if netdata['success'] and netdata['error'] == 0 then
			top.tablename = 'discuz_forum_post'
			if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
				for a,b in GSortedPairs4(netdata['data']) do
					top:SetDirty(true)
					b['data'] = TableToString(b)
					b['replyer'] = uuid
					local a,b,c  = top:AddorUpdateRecord('pid',b)
					--print('discuznet.forum_guide',a,b,c )
				end
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,postparam,netdata)
			
		end
	end)	
	return self.table,callbackey	
end

-- 帖子回复排行 http://192.168.1.105/upload/misc.php?mod=ranklist&type=thread&view=replies&orderby=all
-- 用户积分排行 http://192.168.1.105/upload/misc.php?mod=ranklist&type=member&view=credit
-- http://192.168.1.105/upload/misc.php?mod=ranklist&type=member&view=credit&ajax=true
discuznet.ranklist = function(self,postparam)

	local top = self
	
	local callbackey = self.classname..'.ranklist'
	
	if postparam == nil then
		local tb = {}
		tb.mod='ranklist'
		tb.reftype='thread' -- 'index', 'member', 'thread', 'blog', 'poll', 'picture', 'activity', 'forum', 'group'
		tb.refview='heats'
		tb.odeby='all' -- thisweek thismonth today 
		tb.ajax='true'
		tb.table = 'discuz_forum_thread'
		return tb.table,callbackey,tb
	end	
	
	local newpostparam = {}
	newpostparam['mod'] = postparam['mod']
	newpostparam['type'] = postparam['reftype']
	newpostparam['view'] = postparam['refview']
	newpostparam['orderby'] = postparam['odeby']
	newpostparam.ajax='true'
	
	local url = g_serverRoot..'upload/misc.php?'
	for k,v in pairs(newpostparam) do
		if v ~= nil then
			url = url..tostring(k)..'='..tostring(v)..'&'
		end
	end


	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
	
	
		if netdata['success'] and netdata['error'] == 0 then
			
			if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
				
				for a,b in GSortedPairs4(netdata['data']) do
				
					top.tablename = 'discuz_forum_ranklist'
					top:SetDirty(true)
					
					local dtb = {}
					dtb['reftype'] = postparam['reftype']
					dtb['refview'] = postparam['refview']
					dtb['odeby'] = postparam['odeby']
					dtb['reftable'] = postparam['table']
					dtb['refrank'] = b['rank']
					
					if postparam['reftype'] == 'thread' then
						
						top.tablename = 'discuz_forum_ranklist'
						dtb['tablekey'] = 'tid'

						top:SetAttrs(dtb)
						
						local a,b,c = top:GetRecordsByAttribute2()
						
						if a and b == 0 then
							dtb['oid'] = b['uid']
							top:AddRecord(dtb)
						else
							dtb['clientid'] = c[0]['clientid']
							top:AddorUpdateRecord('clientid',dtb)
						end
						
						top.tablename = 'discuz_forum_thread'
						
						-- todo
						
					elseif postparam['reftype'] == 'member' then
						
						top.tablename = 'discuz_forum_ranklist'
						dtb['tablekey'] = 'uid'						
						top:SetAttrs(dtb)						
						local ua,ub,uc = top:GetRecordsByAttribute2()						
						dtb['oid'] = b['uid']							
						if ua and ub == 0 then
							top:AddRecord(dtb)
						else
							dtb['clientid'] = uc[0]['clientid']
							top:AddorUpdateRecord('clientid',dtb)
						end
					
						-- todo
						top.tablename = 'discuz_forum_member'						
						local status,err = pcall(top.SetDirty,top,true)
						if not status then
						    local code = err.code and tonumber(err.code) or 500
						    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
						    cerror('top.SetDirty ERROR',code,msg )
						end							
						b['member_uid'] = b['uid']						
						local status,err = pcall(top.AddorUpdateRecord,top,'member_uid',b)
						if not status then
						    local code = err.code and tonumber(err.code) or 500
						    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
						    cerror('top.AddorUpdateRecord ERROR',code,msg )
						end	
					
						-- todo
						top.tablename = 'discuz_forum_profile'						
						local status,err = pcall(top.SetDirty,top,true)
						if not status then
						    local code = err.code and tonumber(err.code) or 500
						    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
						    cerror('top.SetDirty ERROR',code,msg )
						end						
						local status,err = pcall(top.AddorUpdateRecord,top,'uid',b)
						if not status then
						    local code = err.code and tonumber(err.code) or 500
						    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
						    cerror('top.AddorUpdateRecord ERROR',code,msg )
						end	
						
					end
			
					
					
				end
			end
			top:SetDirty(true)
			--print("$$$$$$$$$",callbackey)
			top:handle_callback(callbackey,postparam.tablename,postparam,netdata)
		end
	end)	
	return self.table,callbackey	
end


-- http://esdo.vicp.net/upload/home.php?mod=space&do=favorite&type=thread&ajax=true
discuznet.myfavorite = function(self,postparam)
	local top = self
	local callbackey = self.classname..'.myfavorite'	
	self.table = 'discuz_forum_thread'	
	if postparam == nil then
		local tb = {}
		tb.mod 	= 'space'
		tb.type = 'thread'
		tb.ajax =	'true'
		tb.page=1
		tb['do'] = 'favorite'
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end	
	local url =  g_serverRoot..'upload/home.php?'
	for k,v in pairs(postparam) do
		if v ~= nil then
			url = url..tostring(k)..'='..tostring(v)..'&'
		end
	end
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)
		--table.print(netdata)
		if netdata['success'] and netdata['error'] == 0 then		
			if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
				top.tablename = 'discuz_favorite'
				for a,b in GSortedPairs4(netdata['data']) do
					top:SetDirty(true)
					b['data'] = TableToString(b)
					top:AddorUpdateRecord('favid',b)
				end				
				top.tablename = 'discuz_forum_thread'
				for a,b in GSortedPairs4(netdata['data']) do
					top:SetDirty(true)
					top:AddorUpdateRecord('tid',b['thread'])
				end
			end			
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,postparam,netdata)
		end
	end,postparam)	
	return self.table,callbackey	
end



--[[

gender: 1
privacy[gender]: 0
birthyear: 2021
birthmonth: 1
birthday: 2
privacy[birthday]: 0
birthprovince: 北京市
birthcity: 延庆县
birthdist: 沈家营镇
privacy[birthcity]: 0
privacy[residecity]: 0
affectivestatus: 情感状态111
privacy[affectivestatus]: 0
lookingfor: 交友目的111
privacy[lookingfor]: 0
bloodtype: A
privacy[bloodtype]: 0
field1: 团队
privacy[field1]: 0
field2: 定义1
privacy[field2]: 0
field3: 定义2
privacy[field3]: 0
field4: 定义3
privacy[field4]: 0
field5: 定义4
privacy[field5]: 0
field6: 定义5
privacy[field6]: 0
field7: 定义6
privacy[field7]: 0
field8: 定义7
privacy[field8]: 0
profilesubmit: true
profilesubmitbtn: true

home.php?mod=spacecp&ac=profile&op=contact
home.php?mod=spacecp&ac=profile&op=edu
home.php?mod=spacecp&ac=profile&op=work
home.php?mod=spacecp&ac=profile&op=info



一定要非常注意 select 选项，必须是可选项的文字

]]

discuznet.spacecp_profile = function(self,tb)
	local top = self
	local callbackey = 'discuznet.spacecp_profile'	
	self.table = 'discuz_spacecp_profile'	
	if tb == nil then
		local tb = {}
		tb.op 	= 'base'		
		tb.gender = '1'
		tb.field1 = '个人'
		tb.field2 = ''
		tb.resideprovince = ''
		tb.residecity = ''
		tb.residedist = ''
		tb.residecommunity = ''
		tb.affectivestatus = ''
		tb.bio = ''
		tb.profilesubmit = true
		tb.profilesubmitbtn = true		
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end		
	
	
	tb['privacy%5Bgender%5D'] = '0'
	tb['privacy%5Baffectivestatus%5D'] = '0'
	tb['privacy%5Bbio%5D'] = '0'
	tb['privacy%5Bfield1%5D'] = '0'
	tb['privacy%5Bfield2%5D'] = '0'
	tb['privacy%5Bresidecity%5D'] = '0'
	
	
	local url =  g_serverRoot..'upload/home.php?ajax=true&mod=spacecp&ac=profile&op='..tb.op	
	tb.op	= nil
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			table.print(netdata)
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,tb,netdata)
	end,tb)	
	return self.table,callbackey		
end


--[[

op: info

formhash: 5378fbb3


realname: 卢飞
birthyear: 1979
birthmonth: 11
birthday: 15
idcardtype: 身份证
idcard: 441781111111111



]]
discuznet.spacecp_profile_info = function(self,tb)
	local top = self
	local callbackey = 'discuznet.spacecp_profile'	
	self.table = 'discuz_spacecp_profile'	
	if tb == nil then
		local tb = {}
		tb.op 	= 'info'
		
		tb['realname'] = ''
		
		tb['birthyear'] = ''
		tb['birthmonth'] = ''
		tb['birthday'] = ''
		
		tb['idcardtype'] = ''
		tb['idcard'] = ''
		
		tb['birthprovince'] = ''
		tb['birthcity'] = ''
		tb['birthdist'] = ''
		tb['birthcommunity'] = ''

		tb.profilesubmit = true
		tb.profilesubmitbtn = true
		
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end
	
	tb['customstatus'] = '0'
	tb['sightml'] = '0'
	tb['timeoffset'] = '0'

	tb['privacy%5Bbirthcity%5D'] = '0'
	tb['privacy%5Bidcard%5D'] = '0'
	tb['privacy%5Bbirthday%5D'] = '0'
	tb['privacy%5Bidcardtype%5D'] = '0'
	tb['privacy%5Brealname%5D'] = '0'
		
	local url =  g_serverRoot..'upload/home.php?ajax=true&mod=spacecp&ac=profile&op='..tb.op	
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			--table.print(netdata)
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,tb,netdata)
	end,tb)	
	return self.table,callbackey		
end




discuznet.spacecp_profile_contact = function(self,tb)
	local top = self
	local callbackey = 'discuznet.spacecp_profile_contact'	
	self.table = 'discuz_spacecp_profile'	
	if tb == nil then
		local tb = {}
		tb.op 	= 'contact'
		
		tb['telephone'] = ''
		tb['mobile'] = ''
		tb['icq'] = ''
		tb['qq'] = ''
		tb['msn'] = ''
		tb['taobao'] = ''
		tb['field2'] = ''

		tb.profilesubmit = true
		tb.profilesubmitbtn = true
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end
	
	tb['privacy%5Bfield2%5D'] = '0'
	tb['privacy%5Btelephone%5D'] = '0'
	tb['privacy%5Btaobao%5D'] = '0'
	tb['privacy%5Bqq%5D'] = '0'
	tb['privacy%5Bmobile%5D'] = '0'
	tb['privacy%5Bicq%5D'] = '0'
	tb['privacy%5Bmsn%5D'] = '0'
		
	local url =  g_serverRoot..'upload/home.php?ajax=true&mod=spacecp&ac=profile&op='..tb.op		
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			--table.print(netdata)
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,tb,netdata)
	end,tb)	
	return self.table,callbackey		
end


--[[

graduateschool: fosu university
education: 本科
privacy[education]: 0
privacy[graduateschool]: 0

]]
discuznet.spacecp_profile_edu = function(self,tb)
	local top = self
	local callbackey = 'discuznet.spacecp_profile_edu'	
	self.table = 'discuz_spacecp_profile'	
	if tb == nil then
		local tb = {}
		tb.op 	= 'edu'
		
		tb['graduateschool'] = ''
		tb['education'] = ''
		

		tb.profilesubmit = true
		tb.profilesubmitbtn = true
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end
	
	tb['privacy%5Beducation%5D'] = '0'
	tb['privacy%5Bgraduateschool%5D'] = '0'
	
	local url =  g_serverRoot..'upload/home.php?ajax=true&mod=spacecp&ac=profile&op='..tb.op		
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			--table.print(netdata)
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,tb,netdata)
	end,tb)	
	return self.table,callbackey		
end



--[[
company: gz iinfo scape1
occupation: eengineerr2
position: ceo3
revenue: 60984
site: http://5

]]
discuznet.spacecp_profile_work = function(self,tb)
	local top = self
	local callbackey = 'discuznet.spacecp_profile_work'	
	self.table = 'discuz_spacecp_profile'	
	if tb == nil then
		local tb = {}
		tb.op 	= 'work'

		tb['company'] = ''
		tb['occupation'] = ''
		tb['position'] = ''
		tb['revenue'] = ''
		tb['site'] = ''

		tb.profilesubmit = true
		tb.profilesubmitbtn = true
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end
	
	tb['privacy%5Bsite%5D'] = '0'
	tb['privacy%5Bcompany%5D'] = '0'
	tb['privacy%5Brevenue%5D'] = '0'
	tb['privacy%5Bposition%5D'] = '0'
	tb['privacy%5Boccupation%5D'] = '0'

	local url =  g_serverRoot..'upload/home.php?ajax=true&mod=spacecp&ac=profile&op='..tb.op		
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			--table.print(netdata)
			top:SetDirty(true)
			top:handle_callback(callbackey,top.tablename,tb,netdata)
	end,tb)	
	return self.table,callbackey		
end

-- 获取地区
-- 
discuznet.misc_district = function(self,tb)
	local top = self
	local callbackey = 'discuznet.misc_district'
	if tb == nil then
		local tb = {}
		tb.pid 	= '0'
		tb.level 	= 'province'
		tb.ajax =	'true'
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end		
	local url =  g_serverRoot..'upload/home.php?mod=misc&ajax=true&ac=ajax&op=district&container=residedistrictbox&containertype=reside&province=resideprovince&city=residecity&district=residedist&community=residecommunity&cid=0&did=0&coid=0&level=4&handlekey=residedistrictbox&inajax=1&showdefault=1&inajax=1&ajaxtarget=residedistrictbox&upid='
	url = url..tostring(tb.pid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			if netdata and netdata['success'] and netdata['error'] == 0 then
				local data = netdata['data']	
				--table.print(data)
				top:SetDirty(true)
				top:handle_callback(callbackey,top.tablename,tb,netdata)
			end
	end,tb)	
	return self.table,callbackey		
end



-- 获取用户信息
-- 
discuznet.space_profile = function(self,tb)
	local top = self
	self.table = 'discuz_forum_profile'	
	local callbackey = 'discuznet.space_profile'
	if tb == nil then
		local tb = {}
		tb.uid 	= '0'
		tb['formhash'] = GmBase.usernet.formhash
		return top.table,callbackey,tb
	end		
	local url =  g_serverRoot..'upload/home.php?mod=space&do=profile&ajax=true&uid='..tostring(tb.pid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			if netdata and netdata['success'] and netdata['error'] == 0 then
				local data = netdata['data']
				top:SetDirty(true)
				top:handle_callback(callbackey,top.tablename,tb,netdata)
			end
	end,tb)	
	return self.table,callbackey		
end

-- upload/home.php?mod=space&do=favorite&type=thread

discuznet.space_my_reward = function(self,tb)
	local top = self
	self.table = 'discuz_forum_profile'	
	local callbackey = 'discuznet.space_my_reward'
	if tb == nil then
		local tb = {}
		tb.page = 1
		return top.table,callbackey,tb
	end		
	tb['formhash'] = GmBase.usernet.formhash
	tb.uid = GmBase.usernet.member_uid
	local url =  g_serverRoot..'upload/home.php?mod=space&uid='..tostring(tb.uid)..'&ajax=true&do=reward&view=me&page='..tostring(tb.page)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			if netdata and netdata['success'] and netdata['error'] == 0 then
				local data = netdata['data']
				if netdata['data'] ~= nil and table.size(netdata['data']) > 0 then
					for a,b in GSortedPairs4(netdata['data']) do
						--table.print(b)
						top:SetDirty(true)
						b['data'] = TableToString(b)
						top:AddorUpdateRecord('tid',b)
					end
				end	
				top:SetDirty(true)
				top:handle_callback(callbackey,top.tablename,tb,netdata)
			end
	end)	
	return self.table,callbackey		
end


--[[
-- 表单扩展字段
 upload/forum.php?mod=ajax&inajax=yes&action=extern&ajax=true&sortid=1
]]
discuznet.threadsort = function(self,tb)
	local top = self
	self.table = 'discuz_forum_profile'	
	local callbackey = 'discuznet.threadsort'
	if tb == nil then
		local tb = {}
		tb.sortid = 1
		return top.table,callbackey,tb
	end		
	tb['formhash'] = GmBase.usernet.formhash
	tb.uid = GmBase.usernet.member_uid
	local url =  g_serverRoot..'upload/forum.php?mod=ajax&inajax=yes&action=extern&ajax=true&sortid='..tostring(tb.sortid)
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			if netdata and netdata['success'] and netdata['error'] == 0 then
				top:handle_callback(callbackey,top.tablename,tb,netdata)
			end
	end)	
	return self.table,callbackey		
end



--[[

http://192.168.1.105/upload/forum.php?mod=post&action=edit&extra=&editsubmit=yes

formhash: 73339b00
posttime: 1712433317
delattachop: 0
wysiwyg: 1

fid: 2

tid: 1796
pid: 1093
page: 1
special: 3

fmtformhash: 73339b00
fmtuploadtype: local
remoteimgurl: 
localimgurl: 202403/21/025325e7wdwgdglz31hkr3.png
sortid: 1

selectsortid: 1

typeoption[esjy_class]: 2
typeoption[esjy_isshangjia]: 1
typeoption[esjy_area]: 1

subject: Java网页设计制作
message: 111111111111

rewardprice: 1


readperm: 
tags: 
allownoticeauthor: 1
usesig: 1
delete: 0
editsubmit: true
save: 

]]
discuznet.post_edit = function(self,tb)
	local top = self
	self.table = 'discuz_forum_thread'	
	local callbackey = 'discuznet.post_edit'
	if tb == nil then
		local tb = {}
		tb.sortid = 1
		return top.table,callbackey,tb
	end		
	
	tb['formhash'] = GmBase.usernet.formhash
	tb.uid = GmBase.usernet.member_uid
	
	local url =  g_serverRoot..'upload/forum.php?mod=post&action=edit&extra=&editsubmit=yes'
	
	gxo_curl(url..'&prj='..g_mainModule ,function(netdata)	
			if netdata and netdata['success'] and netdata['error'] == 0 then
				top:handle_callback(callbackey,top.tablename,tb,netdata)
			end
	end)	
	return self.table,callbackey		
end