
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

projectareaArea = inherit(GmBase.objectlistArea):name("projectareaArea")

projectareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "projectareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',5,5)

	
    
	self.linkmove:set_style('display:block')
	self.linkmove:set_click(function(button)
		print('linkmove')
		local newdata = {}
		newdata['fid'] = '93'
		newdata['sortid'] = '1'
		top.hostWindow:exec_action(top ,'servicelist', newdata)
	end)
	
    
  
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.searchnav = gm_ruanjianwaibaojiaoyisuo.searchnavArea(self)
	self.searchnav:set('parentclass','GmCtrl.ControlBase')
	self.searchnav:set('right','serviceadd')
	self.searchnav:set('rightcss','fa_file_medical font42')
	
		

	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	self.advmulbig:set_height(180)
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_project_advmulbig")
	self.advmulbig:SetAttrDirect('is_display',"1")
	self.advmulbig.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'foruminfo', data)
	end
	
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"93")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")
		
	self.threeobjectdescconciseleftarea.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'serviceinfo', data)
	end
	
	
	
	--1

	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 62
			
	self.iconlist = gm_ruanjianwaibaojiaoyisuo.iconlistArea(self)
	self.iconlist:set_column(4)
	self.iconlist:SetAttrDirect('fid',"93")
	self.iconlist:SetAttrDirect('closed',"0")
	self.iconlist:init_control('discuz_forum_threadtype',' order by typeid ', GmBase.discuznet.get_instance(),'threadtypelist',16)
	self.iconlist.on_select = function(self,data)
		data.fid = '93'
		self.hostWindow:exec_action(self ,'servicelist', data)
	end
	
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr(self.movecount)
	
	self:show_scroll_bar(true)

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)

	self.is_init_data = false
	
		
end


projectareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_attrs()
		self.threeobjectdescconciseleftarea:init_net_data()
		self.iconlist:init_net_data()
		self.advmulbig:init_net_data()
		self:init_net_data()	
		self.is_init_data = true
	end
end



projectareaArea.on_hide = function(self,key)
	-- self:set_visible(false)
end





projectareaArea.set_data = function(self,data)
	if data then
		self.data = data
	end
end





projectareaArea.init_attrs = function(self)

	self:set_attr('fid','93')
	self:set_attr('closed','0')
	
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
	





projectareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
end


projectareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)
	print('projectareaArea.on_scroll_stop')
end





projectareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.serviceitemItem(self.itemParent,'item'..idx)
end


projectareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int)  '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end


projectareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id)
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	self.mgr:SetDirty(true)
	return self.mgr:GetPage2({},0, count ,wherestr ,orderstr )
end
