	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceaddareaArea = inherit(GmCtrl.ControlBase):name("serviceaddareaArea")

serviceaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "serviceaddareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.fid = self:get_child('fid')
	self.item_price = self:get_child('item_price')
	self.item_name = self:get_child('item_name')
	self.tags = self:get_child('tags')
	
	self.hash = self:get_child('hash')
	self.tradeaid = self:get_child('tradeaid')
	self.tradeaid_url = self:get_child('tradeaid_url')


	self.serviceimage = GmCtrl.ItemImageCtrl(self.scrollcontainer,'serviceimage','案例图片', g_serverRoot..'uc_server/avatar.php?uid='..tostring(31),	function(k,v)
		local net = GmBase.discuznet.get_instance()
	  net:add_callback('discuznet.image_post',self)
	  local tb = {}
		tb.ctrl = "serviceimage"
		tb.handlekey = "upload"
		tb.hash = top.hash:get_text()
		tb.Filedata = k
	  net:image_post(tb)
		top.serviceimage:set(k,v) 
	end)
	
	self.localimgurl = self:get_child('localimgurl')
	
	self.localimgurldiv = GmCtrl.ItemImageCtrl(self.scrollcontainer,'localimgurldiv','封面', g_serverRoot..'uc_server/avatar.php?uid='..tostring(31),	function(k,v)
		local net = GmBase.discuznet.get_instance()
	  net:add_callback('discuznet.image_post',self)
	  local tb = {}
		tb.ctrl = "localimgurldiv"
		tb.handlekey = "upload"
		tb.hash = top.hash:get_text()
		tb.Filedata = k
	  net:image_post(tb)
		top.localimgurldiv:set(k,v) 
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
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr.get_instance()
	self.mgr:add_ui('serviceaddareaArea',self)
	
		
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('servicepost',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)
	

end


serviceaddareaArea.on_show = function(self,k)	
	local net = GmBase.discuznet.get_instance()
	net:add_callback('discuznet.forum_misc',self)
	local tb = {}
	tb.fid = "93"
	net:forum_misc(tb)
end

	
serviceaddareaArea.callback = function(self,key,tb,netdata)

	if key == 'discuznet.forum_misc' then
		self:set_ref_data(netdata['data'])
	elseif key == 'discuznet.image_post' then
		if tb.ctrl == 'serviceimage' then
			self.tradeaid:set_text(netdata['aid'])
			self.tradeaid_url:set_text(netdata['attachment'])
		else
			self.localimgurl:set_text(netdata['attachment'])
		end
	else
		self.hostWindow:delTopNavFrame()
	end
end




serviceaddareaArea.set_ref_data = function(self,data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


serviceaddareaArea.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


