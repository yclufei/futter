
		

gr_module("gm_ruanjianwaibaojiaoyisuo")

firstareaArea = inherit(GmBase.objectlistArea):name("firstareaArea")

firstareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "firstareaArea"
	GmBase.objectlistArea.init(self,parent,'tid',5,5)

	
	self.linkmove:set_style('display:block')
	self.linkmove:set_click(function(button)
		print('linkmove')
		local newdata = {}
		newdata['fid'] = '2'
		newdata['sortid'] = '1'
		top.hostWindow:exec_action(top ,'rewardlist', newdata)
	end)
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr(self.movecount)
	
	
	self.searchnav = gm_ruanjianwaibaojiaoyisuo.searchnavArea(self)
	self.searchnav:set('class','heightNav')
	self.searchnav:set('parentclass','GmCtrl.ControlBase')
	
	self.topadv = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self:get_child("topadv"))
	self.topadv:set_height(320)
	self.topadv:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3, true)
	self.topadv:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_first_advmulbig")
	self.topadv:SetAttrDirect('fid',"2")
	self.topadv:SetAttrDirect('is_display',"1")

	
	
	
	
	
	self.fonticonlist = GmBase.fonticonlistArea(self)
	self.fonticonlist:set_column(4)
	self.fonticonlist:SetAttrDirect('fid',"2")
	self.fonticonlist:SetAttrDirect('closed',"0")
	self.fonticonlist:init_control('discuz_forum_threadtype',' order by typeid ', GmBase.discuznet.get_instance(), 'threadtypelist', 18, true)
	self.fonticonlist.on_select = function(self,data)
		local newdata = data
		newdata['fid'] = '2'
		self.hostWindow:exec_action(self ,'rewardlist', newdata)
	end
	
	
	
	
	self.rewardadd = self:get_child("rewardadd")
	self.rewardadd:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('rewardadd',nil,function(frame)
					frame.mainarea:set_ref_data(top:GetAttrs())
				end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.threeobjectdescconciseleftarea = gm_ruanjianwaibaojiaoyisuo.threeobjectdescconciseleftareaArea(self)
	self.threeobjectdescconciseleftarea:SetAttrDirect('digest',"1")	
	self.threeobjectdescconciseleftarea:SetAttrDirect('fid',"2")	
	self.threeobjectdescconciseleftarea:SetAttrDirect('closed',"0")
	self.threeobjectdescconciseleftarea:init_control('discuz_forum_thread','', GmBase.discuznet.get_instance(),'forum_thread',3, true)
	self.threeobjectdescconciseleftarea.on_select = function(self,data)
		self.hostWindow:exec_action(self ,'rewardinfo', data)
	end
	

	self.bottomadv = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self:get_child("bottomadv"))
	self.bottomadv:set_height(108)
	self.bottomadv:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	self.bottomadv:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_discover_advmulbig")
	self.bottomadv:SetAttrDirect('fid',"3")
	self.bottomadv:SetAttrDirect('is_display',"1")

	self.middleadv = gm_ruanjianwaibaojiaoyisuo.advmulbigArea(self:get_child("middleadv"))
	self.middleadv:set_height(108)
	self.middleadv:init_control('qscms_ad','', GmBase.qscmsnet.get_instance(),'ad',3)
	self.middleadv:SetAttrDirect('alias',"ruanjianwaibaojiaoyisuo_templete_discover_advmulbig")
	self.middleadv:SetAttrDirect('fid',"3")
	self.middleadv:SetAttrDirect('is_display',"1")
	--


	
	self:show_scroll_bar(true)
	

	self:init_attrs()
	
	local status, msg = xpcall(function ()
	        top:init_control('discuz_forum_thread',self:get_sort_order(), GmBase.discuznet.get_instance(),'forum_thread',10, true)
	    end, __G__TRACKBACK__)
	    
	self.net:add_callback('discuznet.rewardpost',self)

	self.is_init_data = false
	
	
end


firstareaArea.callback = function(self,callbackey,tbname,postparam,data)
	local cap,_ = GmBase.objectlistArea.callback(self,callbackey,tbname,postparam,data)
	if cap == false and callbackey == 'discuznet.rewardpost' then
	
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



firstareaArea.on_hide = function(self,key)

end



firstareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self.topadv:init_net_data()
		self.middleadv:init_net_data()
		self.bottomadv:init_net_data()
		self.threeobjectdescconciseleftarea:init_net_data()
		self:init_net_data()
		self.fonticonlist:init_net_data()
		self.is_init_data = true
	end
end



firstareaArea.init_attrs = function(self)
	self:set_attr('fid','2')
	self:set_attr('closed','0')
	self:set_attr('list_source','firstarea')
end
	
	

firstareaArea.on_scroll_top = function(self,pwidth,pheight,pxx,topY)
	local top = self
	self.is_init_data = false
	self:clean()
	self:updatetick(true)
	self.toploading:set_word("更新数据")
	self.toploading:set_loading(true)
	self:updatetick(true)
	self:init_attrs()
	self:init_net_data()
end



firstareaArea.on_scroll_stop = function(self,pwidth,pheight,pxx,topY)

end


-- 必須要有
firstareaArea.on_scroll_bottom = function(self,pwidth,pheight,pxx,topY)

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
	print('firstareaArea.get_prev_local_data',wherestr,orderstr)
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
	print('firstareaArea.get_next_local_data',wherestr,orderstr)
	return self.mgr:GetPage2(nil,0, count ,wherestr ,orderstr )
end

