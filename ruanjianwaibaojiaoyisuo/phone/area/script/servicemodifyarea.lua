	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

servicemodifyareaArea = inherit(GmCtrl.ControlBase):name("servicemodifyareaArea")

servicemodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "servicemodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	
	self.fid = self:get_child('fid')
	self.tags = self:get_child('tags')
	
	
	

	self.mainpic = self:get_child('localimgurl')
	
	self.mainpic = GmCtrl.ItemImageCtrl(self.scrollcontainer,'localimgurldiv','封面', g_serverRoot..'uc_server/avatar.php?uid='..tostring(31),	function(k,v)
		local net = GmBase.discuznet.get_instance()
	  net:add_callback('discuznet.image_post',self)
	  local tb = {}
		tb.ctrl = "localimgurldiv"
		tb.handlekey = "upload"
		tb.hash = top.hash:get_text()
		tb.Filedata = k
	  net:image_post(tb)
		top.mainareadiv:set(k,v) 
	end)
	
		
	
	
	
	self.subject = self:get_child('subject')
	
	self.message = self:get_child('message')
	

	self.sortid = GmCtrl.ItemPopCtrl(self.scrollcontainer,'sortid','分类', '', function(k,v,ctrl)
		ctrl:set(v.typeid,v.name)
	end)
	self.sortid:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('objectlist',true)
		pop:set_title('选择分类')
		pop:set_data({ ['fid'] = '2' },ctrl.callback,ctrl)
	end)



	self.itemparent = self.scrollcontainer:get_child('itemparent')
	self.items = {}
	for i = 1,20 do
		self.items[i] = gm_ruanjianwaibaojiaoyisuo.childServiceitemItem(self.itemparent,'item'..tostring(i))
		self.items[i]:set_visible(false)
	end
	
	
			
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr.get_instance()
	self.mgr:add_ui('serviceaddareaArea',self)
	
		
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('servicemodify',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)

end



servicemodifyareaArea.save = function(self)
		self.mgr:run('spacecp_profile_base',self)
end




servicemodifyareaArea.on_show = function(self,k)	
	local net = GmBase.discuznet.get_instance()
	net:add_callback('discuznet.forum_misc',self)
	local tb = {}
	tb.fid = "93"
	net:forum_misc(tb)
end

	
servicemodifyareaArea.callback = function(self,key,tb,netdata)
	if key == 'discuznet.forum_misc' then
		self:set_ref_data(netdata['data'])
	elseif key == 'discuznet.image_post' then
		self.mainarea:set_text(netdata['attachment'])
	elseif key == 'discuznet.viewtradethread' then
		local data = netdata['data']
		if data and table.size(data) > 0 then
			if key == 'discuznet.viewtradethread' then
				self:_set_data(data)
			end
		end
	end
end


servicemodifyareaArea.set_ref_data = function(self,data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end



servicemodifyareaArea.set_data = function(self,data)

	self.data = data
	
	if self.data['data'] then
		local itemdata = StringToTable( self.data['data'] )
		for k,v in pairs(itemdata) do
			self.data[k] = v
		end
	end
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
	if self.data['replyitems'] then
		local replayidx = 1
		for k,v in pairs(self.data['replyitems']) do	
			self.items[replayidx]:set_visible(true)
			self.items[replayidx]:set_data(v)
			replayidx = replayidx + 1
		end	
	end
	
	self.mgr:run('servicedetail',self)
	
end



