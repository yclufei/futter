	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

useridnmodifyareaArea = inherit(GmCtrl.ControlBase):name("useridnmodifyareaArea")

useridnmodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "useridnmodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.realname = GmCtrl.ItemInputCtrl(self.scrollcontainer,'realname','真实姓名', '',		function(k,v)  top.realname:set(v,v)  end)
						
	self.idcardtype = GmCtrl.ItemSelectCtrl(self.scrollcontainer,'idcardtype','证件类型', {['1'] = '身份证',['2'] = '护照',['3'] = '驾驶证'},	function(k,v,ctrl) 
		print('self.idcardtype',k,v) 
		ctrl:set(v,v)  
	end)
						
	self.idcard = GmCtrl.ItemInputCtrl(self.scrollcontainer,'idcard','证件号码', '',		function(k,v)  top.idcard:set(k,v)  end)
						

	self.birthdata = { [ "community" ] = { [ 30213 ] = "春城街道" }, [ "dist" ] = { [ 3134 ] = "阳春" }, [ "city" ] = { [ 303 ] = "阳江" }, [ "province" ] = { [ 19 ] = "广东" } }
	self.birth = GmCtrl.ItemAddressCtrl(self.scrollcontainer,'birth','证件地址', self.birthdata, function(k,v)
		top.birthdata = v
		top.birth:set('birth',v)
	end)
	
	
	self.birthprovince = {}
	self.birthprovince.get_text = function(tb)
		if top.birthdata['province'] then
			for a,b in pairs(top.birthdata['province']) do
				print('self.birthprovince.get_text',b)
				return b
			end
		end
		return nil
	end
	self.birthcity = {}
	self.birthcity.get_text = function(tb)
		if top.birthdata['city'] then
			for a,b in pairs(top.birthdata['city']) do
				print('self.birthcity.get_text',b)
				return b
			end
		end
		return nil
	end
	self.birthdist = {}
	self.birthdist.get_text = function(tb)
		if top.birthdata['dist'] then
			for a,b in pairs(top.birthdata['dist']) do
				print('self.birthdist.get_text',b)
				return b
			end
		end
		return nil
	end
	self.birthcommunity = {}
	self.birthcommunity.get_text = function(tb)
		if top.birthdata['community'] then
			for a,b in pairs(top.birthdata['community']) do
				print('self.birthcommunity.get_text',b)
				return b
			end
		end
		return nil
	end
	
	--[[
	self.action['spacecp_profile_info']['birthyear'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }
	self.action['spacecp_profile_info']['birthmonth'] = 				{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	self.action['spacecp_profile_info']['birthday'] = 					{ ['t'] = 's' ,['title'] = '' , ['max'] = 50 }	
	]]
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)
	

	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'space_profile_info'	

	GmBase.discuznet.get_instance():add_callback('discuznet.space_profile',self)	

end



useridnmodifyareaArea.save = function(self)
	print('useridnmodifyareaArea rightfunc save',self.mgr)
	-- todo
	self.mgr:run('spacecp_profile_info',self)
end



useridnmodifyareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)

	print('useridnmodifyareaArea.callback',callbackey,tbname,postparam,data,sortkey,ids)
	
	if 'discuznet.space_profile' == callbackey then
		
		--table.print(postparam)
--		table.print(data)
		
		
		local sdata = data['data']
		
		for a,b in pairs(sdata) do
			if self[a] and type(self[a]) == 'table' and self[a].set_text then
				self[a]:set_text(b)
			end
		end
		
		self.birthdata = { [ "community" ] = { [ 0 ] = sdata['birthcommunity'] }, [ "dist" ] = { [ 0 ] = sdata['birthdist'] }, [ "city" ] = { [ 0 ] = sdata['birthcity'] }, [ "province" ] = { [ 0 ] = sdata['birthprovince'] } }
		self.birth:set('birth',self.birthdata)
	
		local idcardtype = sdata['idcardtype']
		if idcardtype then
			self.idcardtype:set(idcardtype,idcardtype)
		end
		
		return true
	end
	return false
	
end






useridnmodifyareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


useridnmodifyareaArea.set_data = function(self,data)
	self.data = data
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


