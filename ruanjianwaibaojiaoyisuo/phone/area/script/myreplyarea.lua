			
gr_module("gm_ruanjianwaibaojiaoyisuo")

myreplyareaArea = inherit(GmBase.objectlistArea):name("myreplyareaArea")

myreplyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "myreplyareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',20,5)

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_post',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_guide',10)
	    end, __G__TRACKBACK__)

	self.is_init_data = false
	self.data = nil

end


myreplyareaArea.on_show = function(self,key)
	-- print('myreplyareaArea.on_show',key)
	if self.is_init_data == false then
		self:init_attrs()
		self:init_net_data()
		self.is_init_data = true
	end
end



myreplyareaArea.on_hide = function(self,key)
	-- print('myreplyareaArea.on_hide',key)
	self.data = nil
end


myreplyareaArea.set_data = function(self,data)
	if data then
		self.data = data
	end
end





myreplyareaArea.init_attrs = function(self)

	if self.data == nil then
		self.data = {}
		self.data['uid'] = GmBase.usernet.member_uid
		self.data['authorid'] = GmBase.usernet.member_uid
	end
	
	self.data['fid'] = '2'
	self.data['view'] = 'rewardreply'

	if self.data and self.net and self.netmethon then
		local _,_,keys = self.net[self.netmethon](self.net)
		for k,_ in pairs(keys) do
			if self.data[k] then
				self:set_attr(k,self.data[k])
			end
		end
	end
	
	self:set_attr('replyer',self.data['uid'])
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
	
end
	




myreplyareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
	local top = self
	self:clean()
	self:updatetick(true)
	self.toploading:set_word("更新數據")
	self.toploading:set_loading(true)
	self:updatetick(true)
	self.mgr:get_prev_page(self,function(key,mgr,count)
													print('get_prev_page',key,mgr,count)
													top:init_item_data()
													top.toploading:set_loading(false)
													top:updatetick(true)
												 end)
end





myreplyareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.rewarditemItem(self.itemParent,'item'..idx)
end


myreplyareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end


myreplyareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end



