	
-- area.pc.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

circleareaArea = inherit(GmBase.objectlistArea):name("circleareaArea")

circleareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "circleareaArea"
	GmBase.objectlistArea.init(self,parent,'refrank',3,5,true)
	
	self.cache_refdata = {}
	
	
	
	self.linkmove:set_style('display:block')
	self.linkmove:set_click(function(button)
		print('linkmove')
	end)
	
	
	
	self:show_scroll_bar(true)
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsranklistmgr(self.movecount)
	
	self.ref_mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)
	
	
	
    
    
    
  
	------------ _include.lua.xsl 97

			
	
	self.advmulbig = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self)
	
	 
	self.advmulbig:set_height(140)
	
	self.advmulbig:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	
	self.advmulbig:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_circle_advmulbig")
	
	self.advmulbig:SetAttrDirect('fid',"3")
	
	
	--1
	self.advmulbig:init_net_data()
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciserightarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciserightareaArea(self)
	
	self.threeobjectdescconciserightarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3)
	
	self.threeobjectdescconciserightarea:SetAttrDirect('fid',"2")
	
	self.threeobjectdescconciserightarea:SetAttrDirect('digest',"1")
		
	self.threeobjectdescconciserightarea.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'foruminfo', data)
	end
	
	
	
	--1
	self.threeobjectdescconciserightarea:init_net_data()
	
	

	self:init_attrs()
	
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_ranklist',self:get_sort_order(), GmBase.discuznet.get_instance(),'ranklist',3)
	    end, __G__TRACKBACK__)


	self.is_init_data = false
	
end


circleareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_net_data()	
	end
end


circleareaArea.get_ref_data = function(self,data)
	local key = data['oid']
	if key then
		if self.cache_refdata[key] == nil then
			self.ref_mgr:SetDirty()
			self.ref_mgr:SetAttr('member_uid',key)
			local a,b,c = self.ref_mgr:GetRecordsByAttribute2()
			if a and b == 1 then
				self.cache_refdata[key] = c[0]
			end
		else
			print('nokey',key)
		end
		return self.cache_refdata[key]
	end
	return nil
end




circleareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)
end

circleareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)
end

circleareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)
end



circleareaArea.init_attrs = function(self)
	
	self:set_attr('reftype','member')
	
	self:set_attr('refview','credit')
	
	self:set_attr('__update','true')
	
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
end
	
	

circleareaArea.alloc_item_ctrl = function(self,idx)

	local top = self
	local item = gm_ruanjianwaibaojiaoyisuo.useritemItem(self.itemParent,'item'..idx)
	item.set_data = function(ctrl,data)
		local newdata = top:get_ref_data(data)
		gm_ruanjianwaibaojiaoyisuo.useritemItem.set_data(ctrl,newdata)
	end
	return item
	
end




circleareaArea.get_prev_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) > '..tostring(id or 0)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	local data = self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
--	table.print(data)
	return data
end


circleareaArea.get_next_local_data = function(self,id,count)
	self:init_attrs()
	local wherestr = ' where CAST('..self.sorkey..' AS int) < '..tostring(id or 9999999)
	local tmpwhere = self.mgr:GetWhereChildSql()	
	if tmpwhere and string.len(tmpwhere) > 0 then
		wherestr = wherestr..' and '..tmpwhere
	end
	local orderstr = ' order by CAST('..self.sorkey..' AS int) desc '
	local data =  self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
--	table.print(data)
	return data
end





