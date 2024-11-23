
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

firstareaArea = inherit(GmBase.objectlistArea):name("firstareaArea")

firstareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "firstareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',3,5)

	
	self.linkmove:set_style('display:block')
	self.linkmove:set_click(function(button)
		print('linkmove')
	end)
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr(self.movecount)
	
	
    
    
  
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.searchnav = gm_ruanjianwaibaojiaoyisuo.searchnavArea(self)
		
	
	if self.searchnav.set then
	
	self.searchnav:set('class','heightNav')
	
	self.searchnav:set('parentclass','GmCtrl.ControlBase')
		
	end

	
	
	--0
	------------ _include.lua.xsl 97

			
	
	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	
	 
	self.advmulbig:set_height(220)
	
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_first_advmulbig")
	
	self.advmulbig:SetAttrDirect('fid',"2")
	
	
	--1
	self.advmulbig:init_net_data()
	

	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 62
			
	self.iconlist = gm_ruanjianwaibaojiaoyisuo.iconlistArea(self)
	self.iconlist:set_column(4)
	
	
	self.iconlist:init_control('discuz_forum_threadtype',' order by typeid desc ', GmBase.discuznet.get_instance(),'threadtypelist',8)
	
	self.iconlist:SetAttrDirect('fid',"2")
	
	self.iconlist:SetAttrDirect('closed',"0")
	
	self.iconlist:SetAttrDirect('__tobject',"rewardlist")
	
	
	--1
	self.iconlist:init_net_data()
	
	self.postreward = self:get_child("postreward")
	self.postreward:set_click(function(link)			
			
		top.hostWindow:addNavFrame('postreward',nil,function(frame)
				
		end)
					  			
	end)
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"2")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('closed',"0")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('__tobject',"rewardinfo")
	
	
	
	--1
	self.threeobjectdescconciseleftarea:init_net_data()
	
	

	
	self:show_scroll_bar(true)
	

	self:init_attrs()
	


	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)




	self.is_init_data = false
	
end


firstareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_net_data()	
		self.is_init_data = true
	end
end



firstareaArea.init_attrs = function(self)
	
	self:set_attr('fid','2')
	
	self:set_attr('closed','0')
	
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
end
	
	

firstareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)
end

firstareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
end

firstareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)
end


firstareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.rewarditemItem(self.itemParent,'item'..idx)
end




firstareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere  and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


firstareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere  and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end

