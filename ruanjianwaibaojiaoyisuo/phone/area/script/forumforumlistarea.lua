
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

forumforumlistareaArea = inherit(GmBase.objectlistArea):name("forumforumlistareaArea")

forumforumlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "forumforumlistareaArea"
	GmBase.objectlistArea.init(self,parent,'fid',20,5)

	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsforumforummgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)

	self.is_init_data = false
	
end


forumforumlistareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_attrs()
		self:init_net_data()	
	end
end



forumforumlistareaArea.on_hide = function(self,key)
	if key ~= 1 then
		self:clean()
	end
end


forumforumlistareaArea.set_data = function(self,data)
	self:clean()
	if data then
		self.data = data
	end
end





forumforumlistareaArea.init_attrs = function(self)

	
	
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
	





forumforumlistareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.forumforumitemItem(self.itemParent,'item'..idx)
end

