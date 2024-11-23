

gr_module("gm_ruanjianwaibaojiaoyisuo")

foruminfoareaArea = inherit(GmBase.objectlistArea):name("foruminfoareaArea")

foruminfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "foruminfoareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',20,5)

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsforumcommentmgr(self.movecount)
	
	
	self.head = GmCtrl.itemUrsHeadArea(self)	

	self.subject = self:get_child("subject")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	
	
	self.tid = self:get_child("tid")
	self.tid.set_inner_text = function(ctrl,txt)
		ctrl:set_text(txt)
	end
	
	--normalthread_
  
	self.sortid = self:get_child("sortid")
	self.sortid.set_inner_text = function(ctrl,sortid)
		local mgr = gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.get_instance()
		mgr:SetAttr('typeid',tostring(sortid))
		local a,b,c = mgr:GetRecordsByAttribute()
		if a and tonumber(b) == 1 then
			GmBase.Node.set_inner_text(ctrl,c[0]['name'])
		else
			GmBase.Node.set_inner_text(ctrl,tostring(sortid))
		end
	end
	

	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end

	self.message = self:get_child("message")
	self.message.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end

	self:show_scroll_bar(true)

	self:init_attrs()

	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'viewthread',10)
	    end, __G__TRACKBACK__)

end


foruminfoareaArea.callback = function(self,key,tb,param,netdata,sortid,ids)
	if key == 'discuznet.viewthread' then
		print('foruminfoareaArea.callback',key,tb,param,netdata,sortid,ids)
	end
end



foruminfoareaArea.set_data = function(self,data)
	if data then
		self.data = data
		self.data.tid = self.data.id
		
		table.print(data)
		
		self.head:set_data(self.data)
		
		if self.data['data'] then
			local itemdata = StringToTable( self.data['data'] )
			for k,v in pairs(itemdata) do
				self.data[k] = v
			end
		end
	
		
		for a,b in pairs(self.data) do
			if self.data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
				self[a]:set_inner_text(tostring(self.data[a]))
			end
		end
	
		self:clean()
		
		
		self.mgr:run('forumcommentlist',self)
	
	end
end






foruminfoareaArea.on_show = function(self,key)
	self:init_net_data()	
	--self:set_visible(true)
end



foruminfoareaArea.on_hide = function(self,key)
	--self:set_visible(false)
	self.data = nil
end


foruminfoareaArea.init_attrs = function(self)

	if self.data and self.net and self.netmethon then
		local _,_,keys = self.net[self.netmethon](self.net)
		for k,_ in pairs(keys) do
			if self.data[k] then
				self:set_attr(k,self.data[k])
				print('foruminfoareaArea.init_attrs',k,self.data[k])
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
	return gm_ruanjianwaibaojiaoyisuo.forumcommentitemItem(self.itemParent,'item'..idx)
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

