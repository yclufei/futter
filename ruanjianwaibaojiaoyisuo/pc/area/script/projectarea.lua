
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

projectareaArea = inherit(GmBase.objectlistArea):name("projectareaArea")

projectareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "projectareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',3,5)

	
    
    
  
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.searchnav = gm_ruanjianwaibaojiaoyisuo.searchnavArea(self)
		
	
	if self.searchnav.set then
	
	self.searchnav:set('class','heightNav')
	
	self.searchnav:set('left','')
	
	self.searchnav:set('leftcss','fa-angle-left font45')
	
	self.searchnav:set('parentclass','GmCtrl.ControlBase')
	
	self.searchnav:set('right','productadd')
	
	self.searchnav:set('rightcss','fa-angle-left font45')
		
	end

	
	
	--1
	------------ _include.lua.xsl 97

			
	
	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	
	 
	self.advmulbig:set_height(180)
	
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_project_advmulbig")
		
	self.advmulbig.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'foruminfo', data)
	end
	
	
	--1
	self.advmulbig:init_net_data()
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"93")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")
	
	
	
	--1

	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 62
			
	self.iconlist = gm_ruanjianwaibaojiaoyisuo.iconlistArea(self)
	self.iconlist:set_column(4)
	
	
	self.iconlist:init_control('discuz_forum_threadtype',' order by typeid desc ', GmBase.discuznet.get_instance(),'threadtypelist',8)
	
	self.iconlist:SetAttrDirect('fid',"93")
		
	self.iconlist.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'servicelist', data)
	end
	
	
	--1
	self.iconlist:init_net_data()
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsservicemgr(self.movecount)
	
	self:show_scroll_bar(true)
	
	
	local fid = '93'
	if fid == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('fid','93')
	end	
	
	local closed = '0'
	if closed == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('closed','0')
	end	
	
	
	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	    


	self.is_init_data = false
	
end



projectareaArea.on_show = function(self,key)
	self:init_attrs()
	self:init_net_data()
end


projectareaArea.on_hide = function(self,key)
	self:clean()
end


projectareaArea.set_data = function(self,data)
	if data then
		self.data = data
	end
end





projectareaArea.init_attrs = function(self)

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
	




projectareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)
end

projectareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
end

projectareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)
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
