	
-- area.pad.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

circleareaArea = inherit(GmBase.objectlistArea):name("circleareaArea")

circleareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "circleareaArea"
	GmBase.objectlistArea.init(self,parent,'refrank',3,5)

	self:show_scroll_bar(true)
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsranklistmgr(self.movecount)
	
	
	
    
    
    
    
  
	------------ _include.lua.xsl 97

			
	
	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	
	
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_circle_advmulbig")
	
	self.advmulbig:SetAttrDirect('fid',"3")
	
	
	--1
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.icobar = gm_ruanjianwaibaojiaoyisuo.icobarArea(self)
	
	self.icobar:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	
	
	--0
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciserightarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciserightareaArea(self)
	
	self.threeobjectdescconciserightarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciserightarea:SetAttrDirect('fid',"2")
	
	self.threeobjectdescconciserightarea:SetAttrDirect('digest',"1")
	
	
	
	--1
	local fid = '3'
	if fid == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('fid','3')
	end	
	
	local reftype = 'member'
	if reftype == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('reftype','member')
	end	
	
	local refview = 'credit'
	if refview == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('refview','credit')
	end	
	
	local __update = 'true'
	if __update == '' then
		cerror('ERROR: firstareaArea fid is nil')
	else	
		self:SetAttrDirect('__update','true')
	end	
	
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10)
	    end, __G__TRACKBACK__)
	    
	    


	self.is_init_data = false
	
end


circleareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_net_data()	
		self.is_init_data = true
	end
end




circleareaArea.set_attr = function(self,key,value)
	self.mgr:SetAttr(key,value)
end
	

circleareaArea.alloc_item_ctrl = function(self,idx)
	return gm_ruanjianwaibaojiaoyisuo.memberitemItem(self.itemParent,'item'..idx)
end




circleareaArea.get_prev_local_data = function(self,id,count)
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end


circleareaArea.get_next_local_data = function(self,id,count)
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end



