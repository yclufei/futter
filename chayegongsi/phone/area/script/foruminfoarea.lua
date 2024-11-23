
		

gr_module("gm_chayegongsi")

foruminfoareaArea = inherit(GmBase.objectlistArea):name("foruminfoareaArea")

foruminfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "foruminfoareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',20,5)

	
	
	self.mgr = gm_chayegongsi.clsforumcommentmgr(self.movecount)
	
	self.mainitem = gm_chayegongsi.forumcommentitemItem(self.itemParent,'mainitem')
	
	

	self:show_scroll_bar(true)

	self:init_attrs()

	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)


end



foruminfoareaArea.set_data = function(self,data)
	if data then
		self.data = data
		self.data.tid = self.data.id
		self.mainitem:set_data(data)
		self:clean()
	end
end





foruminfoareaArea.on_show = function(self,key)
	
	self:init_net_data()	
end



foruminfoareaArea.on_hide = function(self,key)
	self.data = nil
end


foruminfoareaArea.init_attrs = function(self)

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
	
	

foruminfoareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
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


foruminfoareaArea.alloc_item_ctrl = function(self,idx)
	return gm_chayegongsi.forumcommentitemItem(self.itemParent,'item'..idx)
end




foruminfoareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere  and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


foruminfoareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere  and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end

