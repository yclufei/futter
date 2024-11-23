
		

gr_module("gm_xinbanchunzhongyun")

clientlistareaArea = inherit(GmBase.objectlistArea):name("clientlistareaArea")

clientlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "clientlistareaArea"
	GmBase.objectlistArea.init(self,parent,'member_uid',20,5)

	
	
	self.mgr = gm_xinbanchunzhongyun.clsclientmgr(self.movecount)
	
	self:show_scroll_bar(true)
	
	
	
	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	    


	self.is_init_data = false
	
end



clientlistareaArea.on_show = function(self,key)
	self:init_attrs()
	self:init_net_data()
end


clientlistareaArea.on_hide = function(self,key)
	self:clean()
end


clientlistareaArea.set_data = function(self,data)
	if data then
		self.data = data
	end
end





clientlistareaArea.init_attrs = function(self)

	if self.data and self.net and self.netmethon then
		local _,_,keys = self.net[self.netmethon](self.net)
		for k,_ in pairs(keys) do
			if self.data[k] then
				self:set_attr(k,self.data[k])
				print('init_attrs',k,self.data[k])
			end
		end
	end
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
	
end
	




clientlistareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
	local top = self
	self:clean()
	self:updatetick(true)
	self.toploading:set_word("reflash")
	self.toploading:set_loading(true)
	self:updatetick(true)
	self.mgr:get_prev_page(self,function(key,mgr,count)
													print('get_prev_page',key,mgr,count)
													top:init_item_data()
													top.toploading:set_loading(false)
													top:updatetick(true)
												 end)
end





clientlistareaArea.alloc_item_ctrl = function(self,idx)
	return gm_xinbanchunzhongyun.clientitemItem(self.itemParent,'item'..idx)
end


clientlistareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end


clientlistareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end
