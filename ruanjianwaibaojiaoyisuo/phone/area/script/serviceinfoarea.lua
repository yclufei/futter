	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceinfoareaArea = inherit(GmCtrl.ControlBase):name("serviceinfoareaArea")

serviceinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "serviceinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.tid = self.scrollcontainer:get_child('tid')
		
		-- form.lua.xsl form 38
	self.message = self.scrollcontainer:get_child('message')
	self.message:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.useip = self.scrollcontainer:get_child('useip')
	self.useip:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.port = self:get_child('port')
	self.port:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.anonymous = self:get_child('anonymous')
	self.anonymous:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.usesig = self:get_child('usesig')
	self.usesig:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.htmlon = self:get_child('htmlon')
	
	self.bbcodeoff = self:get_child('bbcodeoff')
	
		-- form.lua.xsl form 38
	self.smileyoff = self:get_child('smileyoff')
	self.smileyoff:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.parseurloff = self:get_child('parseurloff')
	
	self.attachment = self:get_child('attachment')
	self.attachment:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.rate = self:get_child('rate')
	self.rate:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.ratetimes = self:get_child('ratetimes')
	self.ratetimes:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.status = self:get_child('status')
	self.status:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.comment = self:get_child('comment')
	self.comment:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.replycredit = self:get_child('replycredit')
	self.replycredit:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.itemctrl = GmCtrl.ItemFieldCtrl(self)
	
	self.ItemHead = GmCtrl.ItemHeadCtrl(self,'serviceinfo')
	
	self.head = GmCtrl.UserHead68Ctrl(self)
	
  self.pic = self:get_child("mainpic")
  self.pic.set_inner_text = function(ctrl,path)
  	if path and string.len(path) > 3 then
	  	local src = g_serverRoot..'discuz/upload/'..path
	  	ctrl:set_src(src)
  	end
  end
  
	self.page = 0
	
	self.itemparent = self.scrollcontainer:get_child('itemparent')
	self.items = {}
	for i = 1,20 do
		self.items[i] = gm_ruanjianwaibaojiaoyisuo.childServiceitemItem(self.itemparent,'item'..tostring(i))
		self.items[i]:set_visible(false)
	end
	
	self.productadd = self:get_child('productadd')
	self.productadd:set_click(function(ctrl)
		local ttop = top
		top.hostWindow:addNavFrame('productadd',nil,function(frame)
				frame:set_data(ttop.data)
			end)
	end)
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr.get_instance()
	self.mgr:add_ui('serviceinfoareaArea',self)
	
	self:show_scroll_bar(true)

end




serviceinfoareaArea.on_operation = function(self,k,v,c)
	-- print('serviceinfoareaArea.on_operation',k,v,c)
	local top = self
	if k == 2 then
			self.hostWindow:addNavFrame('servicemodify',nil,function(frame)
				frame:set_data(top.data)
			end)
	end
end




serviceinfoareaArea.on_hide = function(self,key)
	print('serviceinfoareaArea.on_hide',key)
	if key == 2 then
		for i = 1,20 do
			self.items[i]:set_visible(false)
		end
	end
end

serviceinfoareaArea.on_show = function(self,key)
	--self:set_visible(true)
end





serviceinfoareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end



	
serviceinfoareaArea.callback = function(self,key,tb,param,netdata,sortid,ids)
	print('serviceinfoareaArea.callback',key)
	if netdata['success'] then
		local data = netdata['data']
		if data and table.size(data) > 0 then
			if key == 'discuznet.viewtradethread' then
				self:_set_data(data)
			end
		end
	end
	
end



serviceinfoareaArea._set_data = function(self,data)
	
	if data then
		self.data = data
	end
	
	if self.data['data'] then
		local itemdata = StringToTable( self.data['data'] )
		for k,v in pairs(itemdata) do
			self.data[k] = v
		end
	end
	
	self.tid:set_text(self.data.tid)
	self.itemctrl:set_data(self.data)
	self.ItemHead:set_data(self.data)
	self.head:set_data(self.data)
	
	for a,b in pairs(self.data) do
		if self[a] ~= nil and type(self[a]) == 'table' and self[a].set_inner_text ~= nil then
			self[a]:set_inner_text(tostring(b))
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
	
end


serviceinfoareaArea.set_data = function(self,data)

	if data then
		self.data = data
	end
	
	self.tid:set_text(self.data.tid)
	
	--self:_set_data(data)
	
	--self:layout()
	
	self.mgr:run('servicedetail',self)
	
end


