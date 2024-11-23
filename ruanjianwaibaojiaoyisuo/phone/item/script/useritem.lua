

gr_module("gm_ruanjianwaibaojiaoyisuo")

useritemItem = inherit(GmCtrl.ControlBase):name("useritemItem")

useritemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "useritemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	self.head = GmCtrl.UserHead68Ctrl(self)
	
	self.bio = self:get_child('bio')
	
	self.gender = self:get_child('gender')
	self.residecity = self:get_child('residecity')
	self.resideprovince = self:get_child('resideprovince')
	self.residedist = self:get_child('residedist')
	
	self.birthyear = self:get_child('birthyear')
	self.birthday = self:get_child('birthday')
	self.birthmonth = self:get_child('birthmonth')
	
	self.albums = self:get_child('albums')
	self.groupid = self:get_child('groupid')
	
	self.following = self:get_child('following')
	self.follower = self:get_child('follower')
	self.newfollower = self:get_child('newfollower')
	self.friends = self:get_child('friends')
	
	self.views = self:get_child('views')
	
	self.credits = self:get_child('credits')
	
	self.todayattachs = self:get_child('todayattachs')
	self.doings = self:get_child('doings')
	
	self.extcredits1 = self:get_child('extcredits1')
	self.extcredits2 = self:get_child('extcredits2')
	self.extcredits3 = self:get_child('extcredits3')
	self.extcredits4 = self:get_child('extcredits4')
	self.extcredits5 = self:get_child('extcredits5')
	self.extcredits6 = self:get_child('extcredits6')
	self.extcredits7 = self:get_child('extcredits7')
	self.extcredits8 = self:get_child('extcredits8')
	
	
	
	self.field1 = self:get_child('field1')
	self.field2 = self:get_child('field2')
	self.field3 = self:get_child('field3')
	self.field4 = self:get_child('field4')
	self.field5 = self:get_child('field5')
	self.field6 = self:get_child('field6')
	self.field7 = self:get_child('field7')
	self.field8 = self:get_child('field8')
	
	self.feeds = self:get_child('feeds')
	self.clientid = self:get_child('clientid')
	self.videophotostatus = self:get_child('videophotostatus')
	self.oltime = self:get_child('oltime')
	self.threads = self:get_child('threads')
	self.todayattachsize = self:get_child('todayattachsize')
	self.blogs = self:get_child('blogs')
	self.uid = self:get_child('uid')
	self.blacklist = self:get_child('blacklist')
	self.attachsize = self:get_child('attachsize')
	self.digestposts = self:get_child('digestposts')
	self.sharings = self:get_child('sharings')
	
	self.ursCount = GmCtrl.ursCountCtrl(self)
	
	
	
	
	self.realname = self:get_child('realname')
	self.realname:set_click(function(ctrl)
		ctrl.hostWindow:addNavFrame('userinfo',nil,function(ctrl) 
																	if ctrl.set_data then
																		ctrl:set_data(top.data)
																	end
																end,true)
		
	end)
	
end


useritemItem.set_data = function(self,data)

	table.print(data)
	
	
	if data then
		self.data = data
	end
	
	self:set_childs_inner_text(self.data)
	
	self.head:set_data(self.data)
	self.ursCount:set_data(self.data)
	
	for a,b in pairs(self.data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(self.data[a]))
		end
	end
	
	self.realname:set_inner_text(tostring(self.data['realname'] or self.data['username']))
	
end


	