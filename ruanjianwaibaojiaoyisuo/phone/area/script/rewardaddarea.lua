
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardaddareaArea = inherit(GmCtrl.ControlBase):name("rewardaddareaArea")

rewardaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardaddareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)

	self.fid = self:get_child('fid')
	
	self.typeoption = GmBase.formExtendArea(self)
	
	self['typeoption[email]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('email')
	end}
	self['typeoption[price]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('price')
	end}
	self['typeoption[esjy_class]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('esjy_class')
	end}
	self['typeoption[esjy_isshangjia]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('esjy_isshangjia')
	end}
	self['typeoption[esjy_area]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('esjy_area')
	end}
	self['typeoption[esjy_tel]'] = { ['get_text'] = function(ctrl) 
		return top.typeoption:get_text('esjy_tel')
	end}
	
	self.sortid = GmCtrl.ItemPopCtrl(self,'sortid','分类', '', function(k,v,ctrl)
		ctrl:set(v.typeid,v.name)
		top.typeoption:set_data(v.typeid)
	end)
	self.sortid:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('objectlist',true)
		pop:set_title('选择分类')
		pop:set_data({ ['fid'] = '2' },ctrl.callback,ctrl)
	end)

	self.subject = self:get_child('subject')
	
	self.message = self:get_child('message')
	
	self.tags = self:get_child('tags')
		
	self.rewardprice = self:get_child('rewardprice')
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.get_instance()
	self.mgr:add_ui('rewardaddareaArea',self)
	
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('rewardpost',top)
	end)
		
	self.sorkey = ''
	
	self.page = 0
	
	self:show_scroll_bar(true)

end


	
rewardaddareaArea.callback = function(self,callbackey,tb,netdata)
	print('rewardaddareaArea.callback',callbackey,tb,netdata)
--	table.print(netdata)
	if 'discuznet.rewardpost'	== callbackey then
		if netdata['success'] and netdata['error'] == 0 then
			self.hostWindow:showMsg(netdata['message'])
			self.hostWindow:delTopNavFrame()
		end
	end
end




rewardaddareaArea.set_ref_data = function(self,data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


rewardaddareaArea.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


