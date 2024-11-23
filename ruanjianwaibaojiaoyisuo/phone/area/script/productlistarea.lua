
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

productlistareaArea = inherit(GmBase.objectlistArea):name("productlistareaArea")

productlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "productlistareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',20,5)

	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsproductmgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)

	self.is_init_data = false
	
end


productlistareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:clean()
		self:init_attrs()
		self:init_net_data()	
	end
end



productlistareaArea.on_hide = function(self,key)
	if key ~= 1 then
		self:clean()
	end
end


productlistareaArea.set_data = function(self,data)
	self:clean()
	if data then
		self.data = data
	end
end





productlistareaArea.init_attrs = function(self)

	
	
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
	




productlistareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
	local top = self
	self:clean()
	self:updatetick(true)
	self.toploading:set_word("更新数据")
	self.toploading:set_loading(true)
	self:updatetick(true)
	--[[
	self.mgr:get_prev_page(self,function(key,mgr,count)
													print('get_prev_page',key,mgr,count)
													top:init_item_data()
													top.toploading:set_loading(false)
													top:updatetick(true)
												 end)]]
end





productlistareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.productitemItem(self.itemParent,'item'..idx)
end


