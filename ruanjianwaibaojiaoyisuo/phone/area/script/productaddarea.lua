	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

productaddareaArea = inherit(GmCtrl.ControlBase):name("productaddareaArea")

productaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "productaddareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	
	self.productimage = GmCtrl.ItemImageCtrl(self.scrollcontainer,'productimage','图片', g_serverRoot..'uc_server/avatar.php?uid='..tostring(31),	function(k,v)
		local net = GmBase.discuznet.get_instance()
	  net:add_callback('discuznet.image_post',self)
	  local tb = {}
		tb.handlekey = "upload"
		tb.hash = top.hash:get_text()
		tb.Filedata = k
	  net:image_post(tb)
		top.productimage:set(k,v) 
	end)
	
	
	self.fid = self:get_child('fid')
	
	self.tid = self:get_child('tid')

	
	
	self.sortid = GmCtrl.ItemPopCtrl(self.scrollcontainer,'sortid','分类', '', function(k,v,ctrl)
		ctrl:set(v.typeid,v.name)
	end)
	self.sortid:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('objectlist',true)
		pop:set_title('选择分类')
		pop:set_data({ ['fid'] = '2' },ctrl.callback,ctrl)
	end)

	
	self.subject = self:get_child('subject')

	self.message = self:get_child('message')

	self.hash = self:get_child('hash')
	
	self.tradeaid = self:get_child('tradeaid')
	self.tradeaid_url = self:get_child('tradeaid_url')
	
		
		
	
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsproductmgr.get_instance()
	self.mgr:add_ui('productaddareaArea',self)
	
		
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('productpost',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)

end


	

productaddareaArea.on_show = function(self,k)	
	local net = GmBase.discuznet.get_instance()
	net:add_callback('discuznet.forum_misc',self)
	local tb = {}
	tb.fid = "93"
	net:forum_misc(tb)
end

	
productaddareaArea.callback = function(self,key,tb,netdata)
	print(key)
	if key == 'discuznet.forum_misc' then
		self:set_ref_data(netdata['data'])
	elseif key == 'discuznet.image_post' then
		self.tradeaid:set_text(netdata['aid'])
		self.tradeaid_url:set_text(netdata['attachment'])
	
	else
		self.hostWindow:delTopNavFrame()
	end
end



productaddareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] and self[a].set_text ~= nil then
			self[a]:set_text(b)
		end
	end
end


productaddareaArea.set_data = function(self,data)
	self.data = data
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


