
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

discoverareaArea = inherit(GmBase.objectlistArea):name("discoverareaArea")

discoverareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "discoverareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',5,5)

	
	self.linkmove:set_style('display:block')
	self.linkmove:set_click(function(button)
		print('linkmove')
		local newdata = {}
		newdata['fid'] = '91'
		newdata['sortid'] = '12'
		top.hostWindow:exec_action(top ,'forumlist', newdata)
	end)
	
	
	
	self:show_scroll_bar(true)

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsforummgr(self.movecount)


	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	self.advmulbig:set_height(108)
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_discover_advmulbig")
	self.advmulbig:SetAttrDirect('fid',"3")
	self.advmulbig:SetAttrDirect('is_display',"1")
	--
	
	
	
	
	
	
			
	self.vscrollbar = gm_ruanjianwaibaojiaoyisuo.vscrollbarArea(self)
	self.vscrollbar:SetAttrDirect('fid',"91")
	self.vscrollbar:init_control('discuz_forum_threadtype','', GmBase.discuznet.get_instance(),'threadtypelist',30)
	self.vscrollbar.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'forumlist', data)
	end
	
	
	
	
	--ge
	--threeobjectdescconciseleftarea
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"2")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")
		
	self.threeobjectdescconciseleftarea.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'foruminfo', data)
	end
	
	
	
	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	    
	self.is_init_data = false
	
	
	    
end




discoverareaArea.on_show = function(self,key)
	if self.is_init_data == false then		
		self.advmulbig:init_net_data()
		self.vscrollbar:init_net_data()
		self.advmulbig:init_net_data()
		self.vscrollbar:init_net_data()
		self.threeobjectdescconciseleftarea:init_net_data()
		self:init_net_data()	
		self.is_init_data = true
	end
end





discoverareaArea.init_attrs = function(self)
	self:set_attr('fid','91')
	self:set_attr('closed','0')
	self:set_attr('list_source','discoverareaArea')
end
	





discoverareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
end


discoverareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)
	print('discoverareaArea.on_scroll_stop')
end



discoverareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.forumitemItem(self.itemParent,'item'..idx)
end


discoverareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


discoverareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


