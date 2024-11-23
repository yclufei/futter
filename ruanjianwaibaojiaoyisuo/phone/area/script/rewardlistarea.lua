
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardlistareaArea = inherit(GmBase.objectlistArea):name("rewardlistareaArea")

rewardlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardlistareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',10,2)

	self.is_init_data = false

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)

	
end


rewardlistareaArea.on_show = function(self,key)
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


rewardlistareaArea.on_hide = function(self,key)
	if key == 2 then
		self:clean()
		self.is_init_data = false
	end
end


rewardlistareaArea.set_data = function(self,data)
	
	if data then
		self:clean()
		self.is_init_data = false
		self.data = data
		if self.data['sortid'] == nil and self.data['typeid'] then
			self.data['sortid'] = self.data['typeid']
		end
	end
end


rewardlistareaArea.init_attrs = function(self)

	if self.data and self.net and self.netmethon then
		local _,_,keys = self.net[self.netmethon](self.net)
		for k,_ in pairs(keys) do
			if self.data[k] then
				self:set_attr(k,self.data[k])
				print('--------------------- rewardlistareaArea.init_attrs',k,self.data[k])
			else
				
			end
		end
	end
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
	
end
	
	

rewardlistareaArea.alloc_item_ctrl = function(self,idx)
	local item = gm_ruanjianwaibaojiaoyisuo.rewarditemItem(self.itemParent,'item'..idx)
	return item
end


rewardlistareaArea.get_prev_local_data = function(self,id,count)
	if count > 0 then
		self:init_attrs()
		local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
		local otherwherestr = self.mgr:GetWhereChildSql()
		if otherwherestr and string.len(otherwherestr) > 3 then
			wherestr = wherestr..' and '..otherwherestr
		end
		local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
		self.mgr:SetDirty(true)
		print('rewardlistareaArea.get_prev_local_data',id,count ,wherestr , orderstr)
		local tb =  self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
		return tb
	end
	return {}
end


rewardlistareaArea.get_next_local_data = function(self,id,count)
	if count > 0 then
		self:init_attrs()
		local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
		local otherwherestr = self.mgr:GetWhereChildSql()
		if otherwherestr and string.len(otherwherestr) > 3 then
			wherestr = wherestr..' and '..otherwherestr
		end
		local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
		self.mgr:SetDirty(true)
		print('rewardlistareaArea.get_next_local_data',id,count ,wherestr, orderstr)
		local tb =  self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
		return tb
	end
	return {}
end
