
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

discoverareaArea = inherit(GmBase.objectlistArea):name("discoverareaArea")

discoverareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "discoverareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',3,5)

	self:show_scroll_bar(true)

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsforummgr(self.movecount)

	
	
		
	--attr
    
    
  
		
	--ge
		
	--vscrollbar
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 34
			
	self.vscrollbar = gm_ruanjianwaibaojiaoyisuo.vscrollbarArea(self)
	
	self.vscrollbar:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	
	--0
		
	--ge
		
	--advmulbig
	------------ _include.lua.xsl 97

			
	
	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	
	
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_discover_advmulbig")
	
	self.advmulbig:SetAttrDirect('fid',"3")
	
	
	--1
		
	--ge
		
	--threeobjectdescconciseleftarea
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"2")
	
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")
	
	
	
	--1
		
	--ge
	local fid = '91'
	if fid == '' then
		cerror('ERROR: discoverareaArea fid is nil')
	else	
		self:SetAttrDirect('fid','91')
	end	
	
	local closed = '0'
	if closed == '' then
		cerror('ERROR: discoverareaArea fid is nil')
	else	
		self:SetAttrDirect('closed','0')
	end	
	
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	    


	self.is_init_data = false
	
end


discoverareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_net_data()	
		self.is_init_data = true
	end
end




discoverareaArea.set_attr = function(self,key,value)
	self.mgr:SetAttr(key,value)
end


discoverareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)	
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

discoverareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.forumitemItem(self.itemParent,'item'..idx)
end



discoverareaArea.get_prev_local_data = function(self,id,count)
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


discoverareaArea.get_next_local_data = function(self,id,count)
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


