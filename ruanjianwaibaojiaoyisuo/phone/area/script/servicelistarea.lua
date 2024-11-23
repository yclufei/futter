
gr_module("gm_ruanjianwaibaojiaoyisuo")

servicelistareaArea = inherit(GmBase.objectlistArea):name("servicelistareaArea")

servicelistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "servicelistareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',20,5)

	self.is_init_data = false
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	
	
end


servicelistareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:clean()
		self.toploading:set_word("获取数据")
		self.toploading:set_loading(true)
		self:updatetick()
		self:init_attrs()
		self:init_net_data()
		self.is_init_data = true
	end
end


servicelistareaArea.on_hide = function(self,key)
	if key == 2 then
		self:clean()
		self.is_init_data = false
	end
end


servicelistareaArea.set_data = function(self,data)
	if data then
		self:clean()
		self.is_init_data = false
		self.servicedata = data
	end
end


servicelistareaArea.init_attrs = function(self)

	if self.servicedata and self.net and self.netmethon then
		local _,_,keys = self.net[self.netmethon](self.net)
		for k,_ in pairs(keys) do
			if self.servicedata[k] then
				self:set_attr(k,self.servicedata[k])
				print('servicelistareaArea.init_attrs',k,self.servicedata[k])
			end
		end
	end

	if self._ID == 'objectlistarea' then
		self:SetAttrDirect('list_source',self.parent._ID)
	else
		self:SetAttrDirect('list_source',self.parent.parent._ID..'_'..self._ID)
	end

end


servicelistareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.serviceitemItem(self.itemParent,'item'..idx)
end
