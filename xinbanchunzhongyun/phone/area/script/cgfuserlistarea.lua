
		

gr_module("gm_xinbanchunzhongyun")

cgfuserlistareaArea = inherit(GmBase.objectlistArea):name("cgfuserlistareaArea")

cgfuserlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "cgfuserlistareaArea"
	GmBase.objectlistArea.init(self,parent,'id',20,5)

	
	
	self.mgr = gm_xinbanchunzhongyun.clscgfusermgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('czy_user',self:get_sort_order(), GmBase.czynet.get_instance(),'cgfuserlist',10)
	    end, __G__TRACKBACK__)



	self.is_init_data = false
	
end


cgfuserlistareaArea.callback = function(self,callbackey,tbname,postparam,data)
	local cap,_ = GmBase.objectlistArea.callback(self,callbackey,tbname,postparam,data)
	if cap == false and callbackey == 'czynet.cgfuserlist' then
	
		local top = self
		self:clean()
		self:layout()
		self.hostWindow:updatetick(true)
		self.toploading:set_word("更新数据")
		self.toploading:set_loading(true)
		self.hostWindow:updatetick(true)
		self.mgr:get_prev_page(self,function(key,mgr,count)
														print('get_prev_page',key,mgr,count)
														top:init_item_data()
														top.threeobjectdescconciseleftarea:init_net_data()
														top:updatetick(true)
														top.toploading:set_loading(false)
													 end)
		
		return true,false
	end
	
	return false,true
end


cgfuserlistareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_attrs()
		self:init_net_data()	
	end
end



cgfuserlistareaArea.on_hide = function(self,key)
	self:clean()
end


cgfuserlistareaArea.set_data = function(self,data)
	if data then
		self.data = data
	end
end





cgfuserlistareaArea.init_attrs = function(self)

	
	
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
	




cgfuserlistareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
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





cgfuserlistareaArea.alloc_item_ctrl = function(self,idx)
	return gm_xinbanchunzhongyun.cgfuseritemItem(self.itemParent,'item'..idx)
end


cgfuserlistareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end


cgfuserlistareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end