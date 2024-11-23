	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

usermodifyareaArea = inherit(GmCtrl.ControlBase):name("usermodifyareaArea")

usermodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "usermodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	    
	self.goidn = self:get_child('goidn')
	self.goidn:set_click(function(ctrl)
		top.hostWindow:addNavFrame('useridnmodify')
	end)
		
			
	self.goedu = self:get_child('goedu')
	self.goedu:set_click(function(ctrl)
		top.hostWindow:addNavFrame('useredumodify')
	end)
		
			
	self.gocontact = self:get_child('gocontact')
	self.gocontact:set_click(function(ctrl)
		print('gocontact')
		top.hostWindow:addNavFrame('usercontactmodify')
	end)
		
			
	self.gowork = self:get_child('gowork')
	self.gowork:set_click(function(ctrl)
		top.hostWindow:addNavFrame('userworkmodify')
	end)


	self.field1data = {[2] = '个人',[1] = '团队'}
	self.genderdata = {[1] = '男',[2] = '女'}


	
	self.accountarea = self:get_child('accountarea')
	
	self.Image = GmCtrl.ItemImageCtrl(self.accountarea,'head','头像', g_serverRoot..'uc_server/avatar.php?uid='..tostring(GmBase.usernet.member_uid),	function(k,v) 
		local net = GmBase.usernet.get_instance()
		local _,callbackey,tb = net:postavatar()
		net:add_callback(callbackey,top)	
		tb.file = v
		net:postavatar(tb)
		top.Image:set(k,v) 
	end)
	
	self.field1 = GmCtrl.ItemSelectCtrl(self.accountarea,'field1','组织', self.field1data,	function(k,v) 
		print('self.field1',k,v) 
		top.field1:set(v,v)  
	end)
	
	self.gender = GmCtrl.ItemSelectCtrl(self.accountarea,'gender','性别', self.genderdata,	function(k,v) top.gender:set(k,v) end)
	
	self.username = GmCtrl.ItemInputCtrl(self.accountarea,'username','用户名称', 'username',		function(k,v)  top.username:set(k,v)  end)
	
	self.affectivestatus = GmCtrl.ItemInputCtrl(self.accountarea,'affectivestatus','个人签名', ' ',		function(k,v)  top.affectivestatus:set(k,v)  end)
	
	
	self.bio = GmCtrl.ItemTextareaCtrl(self.accountarea,'bio','自我介绍', ' ',	function(k,v)  top.bio:set(k,v)  end)


	self.resideprovince = {}
	self.resideprovince.get_text = function(tb)
		if top.addressdata['province'] then
			for a,b in pairs(top.addressdata['province']) do
				print('self.resideprovince.get_text',b)
				return b
			end
		end
		return nil
	end
	self.residecity = {}
	self.residecity.get_text = function(tb)
		if top.addressdata['city'] then
			for a,b in pairs(top.addressdata['city']) do
				print('self.residecity.get_text',b)
				return b
			end
		end
		return nil
	end
	self.residedist = {}
	self.residedist.get_text = function(tb)
		if top.addressdata['dist'] then
			for a,b in pairs(top.addressdata['dist']) do
				print('self.residedist.get_text',b)
				return b
			end
		end
		return nil
	end
	self.residecommunity = {}
	self.residecommunity.get_text = function(tb)
		if top.addressdata['community'] then
			for a,b in pairs(top.addressdata['community']) do
				print('self.residecommunity.get_text',b)
				return b
			end
		end
		return nil
	end
	

	self.addressdata = { [ "community" ] = { [ 30213 ] = "春城街道" }, [ "dist" ] = { [ 3134 ] = "阳春" }, [ "city" ] = { [ 303 ] = "阳江" }, [ "province" ] = { [ 19 ] = "广东" } }
	self.reside = GmCtrl.ItemAddressCtrl(self.accountarea,'reside','城市', self.addressdata, function(k,v)
		top.addressdata = v
		top.reside:set('reside',v)
	end)
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)
	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'space_profile'	
	GmBase.usernet.get_instance():add_callback('usernet.loginform',self)	

end


usermodifyareaArea.save = function(self)
		self.mgr:run('spacecp_profile_base',self)
end



usermodifyareaArea.on_show = function(self,key)
	local usr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance():get_session('default')
	if usr then
		
		local a,b,c = usr:GetSingleRecord()
		self:set_data(c)
	
		self.Image:set(c['avatar'],c['avatar']) 
		
		self:SetAttrDirect('uid',GmBase.usernet.member_uid)
		self:init_net_data()
		
	end
	self:layout()
	self.hostWindow:layout()
	self.hostWindow:updatetickMsg()
end


usermodifyareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)

	print('usermodifyareaArea.callback',callbackey,tbname,postparam,data,sortkey,ids)
	
	if 'usernet.loginform' == callbackey then
	
		self:SetAttrDirect('uid',data[ "user" ][ "member_uid" ])
		self:init_net_data()
		return true
		
	elseif 'discuznet.space_profile' == callbackey then		
	
		local sdata = data['data']
		
		local usr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance():get_session('default')
		if usr then
			local a,b,c = usr:GetSingleRecord()
			sdata['avatar'] = c['avatar']
			self.Image:set_text(sdata['avatar'])
		end
		
		--table.print(data)
		
		for a,b in pairs(sdata) do
			if self[a] and type(self[a]) == 'table' and self[a].set_text then
				self[a]:set_text(b)
			end
		end
		
		self.addressdata = { [ "community" ] = { [ 0 ] = sdata['residecommunity'] }, [ "dist" ] = { [ 0 ] = sdata['residedist'] }, [ "city" ] = { [ 0 ] = sdata['residecity'] }, [ "province" ] = { [ 0 ] = sdata['resideprovince'] } }
		self.reside:set('reside',self.addressdata)
		
		
		local gender = sdata['gender']
		if gender then
			self.gender:set(gender,self.genderdata[tonumber(gender)])
		end
		
		local field1 = sdata['field1']
		if field1 then
			for k,v in pairs(self.field1data) do
				if v == field1 then
					self.field1:set(v,v)
				end
			end
		end
		
		return true
		
	elseif 'discuznet.spacecp_profile' == callbackey then		
		
--		table.print(postparam)
--		table.print(data)
		return true
	end
	return false
end


usermodifyareaArea.init_net_data = function(self)
	if self.net ~= nil and self.netmethon ~= nil and self.net[self.netmethon] ~= nil then
			local tbname,key,postparam = self.net[self.netmethon](self.net)
			local attrs = self:GetAttrs()
			for k,v in pairs(attrs) do
				postparam[k] = v
			end
			self.net:add_callback(self.net.classname..'.'..self.netmethon,self)
			self.net[self.netmethon](self.net,postparam)
	else
		cerror('ControlBase.init_net_data error',self._ID,self.parent._ID,self.net,self.netmethon)
	end
end
	





usermodifyareaArea.set_ref_data = function(self,data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


usermodifyareaArea.set_data = function(self,data)
	self.data = data
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


