
gr_module("GmBase")

popObjectListFrame = inherit(GmBase.objectlistArea):name("popObjectListFrame")

popObjectListFrame.init = function (self,parent)

	local top = self
	
	
	GmBase.objectlistArea.init(self,parent,'typeid',20,5,nil,'popObjectListFrame')

	self.popmanager = parent

	--self.mgr = gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr(5)
	
	self:show_scroll_bar(true)

	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_threadtype',self:get_sort_order(), GmBase.discuznet.get_instance(),'threadtypelist',10)
	    end, __G__TRACKBACK__)

	self.is_init_data = false
	
	self.navbar = parent:get_child('navbar')
	
	self.navbar.title = self.navbar:get_child('title')
	
	self.navbar.cancel = self.navbar:get_child('cancel')
	self.navbar.cancel:set_click(function(ctrl)
		top.popmanager:show_pop('objectlist',false)
	end)
	
	self:set_visible(false)
	
end


popObjectListFrame.set_title = function(self,title)
	self.navbar.title:set_inner_text(title)
end


popObjectListFrame.on_show = function(self,key)

end


popObjectListFrame.on_hide = function(self,key)

end


popObjectListFrame.set_data = function(self,pdata,callback,ctrl)

	self.data = pdata
	self.callbackfunc = callback
	self.ctrl = ctrl
	
	self:init_attrs()
	self:init_net_data()
end



popObjectListFrame.init_attrs = function(self)

	print('popObjectListFrame.init_attrs')
	for a,b in pairs(self.data) do
		self:set_attr(a,b)
	end

	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
	
end
	
	
popObjectListFrame.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
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


popObjectListFrame.alloc_item_ctrl = function(self,idx)
	local top = self
	local item = GmControl.popItem(self.itemParent,'item'..idx)
	item.select = function(ctrl,data)
		local p = top.popmanager:show_pop('objectlist',false)
		p:set_visible(false)
		top.callbackfunc('key',data,top.ctrl)
	end
	return item
end


popObjectListFrame.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
	self.mgr:SetDirty(true)
	print('popObjectListFrame.get_prev_local_data',wherestr)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end


popObjectListFrame.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	self.mgr:SetDirty(true)
	print('popObjectListFrame.get_next_local_data',wherestr)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end

