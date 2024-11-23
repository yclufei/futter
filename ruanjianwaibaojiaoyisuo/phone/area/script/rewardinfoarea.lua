	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardinfoareaArea = inherit(GmCtrl.ControlBase):name("rewardinfoareaArea")

rewardinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardmgr.get_instance()
	self.mgr:add_ui('rewardinfoareaArea',self)
	
	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	self.scrollcontainer.on_scroll_top = function(self,pwidth,pheight,pxx,topY)
		print('rewardinfoareaArea.on_scroll_top')
		top.mgr:run('rewarddetail',top)
	end
	
	self.price = self:get_child('price')
	
	self.authordiv = self:get_child('authordiv')

	self.firstItem = self.scrollcontainer:get_child('firstItem')
	
	self.tid = self.firstItem:get_child('tid')
	self.fid = self.firstItem:get_child('fid')
	self.pid = self.firstItem:get_child('pid')
	self.dateline = self.firstItem:get_child('dateline')
	
	
	self.firstItem.rewardhead = GmCtrl.ItemHeadPriceCtrl(self.firstItem)	
	self.firstItem.ItemField = GmCtrl.ItemFieldCtrl(self.firstItem)	
	self.firstItem.message = GmCtrl.ItemMessageCtrl(self.firstItem)	
	self.firstItem.footcount = GmCtrl.ItemFootCountCtrl(self.firstItem)
	self.firstItem.itemurs = GmCtrl.itemUrsHeadArea(self.firstItem)
	
	self.itemparent = self.scrollcontainer:get_child('itemparent')
	self.items = {}
	for i = 1,20 do
		self.items[i] = gm_ruanjianwaibaojiaoyisuo.rewardreplyitemItem(self.itemparent,'item'..tostring(i))
	end

	self.btreply = self:get_child('btreply')
	self.btreply.ok = false
	self.btreply:set_click(function(bt)
		if bt.ok then
			top.hostWindow:addNavFrame('rewardreplyadd',nil,function(frame)
				frame:set_data(top.data)
			end)
		end
	end)

				
	for i = 1,20 do
		self.items[i]:set_style('display:none')
	end
	
	self.replydiv = self:get_child('replydiv')
	self.infodetail = self:get_child('infodetail')

	self:show_scroll_bar(true)

end



rewardinfoareaArea.on_operation = function(self,k,v,c)
	local top = self
	if k == 2 then
			self.hostWindow:addNavFrame('rewardmodify',nil,function(frame)
				frame:set_data(top.data)
			end)
	end
end



rewardinfoareaArea.on_hide = function(self,key)
	if key ~= 1 and key ~= 2 and key ~= '1' and key ~= '2' then
		self.scrollcontainer:set_scroll_pos(0,220)
		self.authordiv:set_visible(false)
		for i = 1,20 do
			self.items[i]:set_style('display:none')
			self.items[i]:show_choose(false)
		end
		self:can_bid(false)
		self:layout()
		self:updatetick(true)
		self:set_visible(false)
	end
end


rewardinfoareaArea.on_show = function(self,key)
	self:set_visible(true)
	if key == 1 then
		self.scrollcontainer:set_scroll_pos(0,220)
		self.authordiv:set_visible(false)
		for i = 1,20 do
			self.items[i]:set_style('display:none')
			self.items[i]:show_choose(false)
		end
		self:can_bid(false)
		self:layout()
		self:updatetick(true)
	end
end



rewardinfoareaArea.set_ref_data = function(self,data)
	for a,b in pairs(data) do
		if self.firstItem[a] then
			self.firstItem[a]:set_text(b)
		end
	end
end


rewardinfoareaArea.remove_object = function(self)
	self.mgr:run('rewardremove',self)
end

	
rewardinfoareaArea.callback = function(self,key,tb,param,netdata,sortid,ids)

	if netdata['success'] then
	
		print('---------------------------- rewardinfoareaArea.callback',key,tb,param,netdata,sortid,ids)
		
		if key == 'discuznet.rewardremove' then
			
			print('rewardinfoareaArea.callback',key)
			table.print(param)
			table.print(netdata)
			
		elseif key == 'discuznet.rewarddetail' then
		
			data = netdata['data']
			
			local selectdbdateline = 0
			
			self:_set_data(data)
			
			local hasBid = false
			
			local replayidx = 1
			for k,v in pairs(data['replyitems']) do				
				if v['first'] ~= '1' then
					if self.data.authorid == GmBase.usernet.member_uid then
						self.items[replayidx]:set_visible(true)
						self.items[replayidx]:set_data(v)
						self.items[replayidx]:show_choose(self.btreply.ok)
						
					elseif v.authorid == GmBase.usernet.member_uid then
						hasBid = true
						self.items[replayidx]:set_visible(true)
						self.items[replayidx]:set_data(v)
						self.items[replayidx]:show_choose(false)
					end
					
					local ischooseuid = tonumber( v.dbdateline ) == selectdbdateline
					self.items[replayidx]:set_choosed(ischooseuid)
					if self.data.authorid == GmBase.usernet.member_uid or ( ischooseuid and v.authorid == GmBase.usernet.member_uid ) then
						self.authordiv:set_visible(true)
					else
						self.authordiv:set_visible(false)
					end
					
					replayidx = replayidx + 1
					
				end			
			end
				
			-- authorid
			if self.data.authorid == GmBase.usernet.member_uid then
				for a,b in pairs(self.items) do
					b:show_choose(self.btreply.ok)
				end
			else
				for a,b in pairs(self.items) do
					b:show_choose(false)
				end
			end
			
			if self.data.authorid == GmBase.usernet.member_uid or hasBid then
				self:can_bid(false)
			else
				self:can_bid(self.btreply.ok)
			end
			
			--[[
				
				1 超过15人不能投标
				2 已经解决不能投标
				3 关闭不能投标

				1 只可以查看自己的回复
				2 自己的标能查看所有回复
			 
			]]
		
			self:updatetick()
			
		end
	end
	
end




rewardinfoareaArea._set_data = function(self,data)

	for i = 1,20 do
		self.items[i]:set_style('display:none')
	end
	
	self:can_bid(false)

	if data then
		self.data = data
	end
	
	self.firstItem.itemurs:set_data(self.data)
	
	if self.data.authorid == GmBase.usernet.member_uid then
		self.replydiv:set_visible(false)
	else
		self.replydiv:set_visible(true)
	end
	
	self.firstItem.ItemField:set_data(self.data)	
	self.firstItem.message:set_data(self.data)
	self.firstItem.rewardhead:set_data(self.data)	
	self.firstItem.footcount:set_data(self.data)	
	
	for a,b in pairs(self.data) do
		if self[a] and type(self[a]) == 'table' and b and self[a].set_text and self[a].set_inner_text then
			self[a]:set_text(b)
			self[a]:set_inner_text(b)
		end
	end
	
	if data['price'] then
		local price = tonumber(data['price'])
		
		if price < 0 then
			self.price:set_inner_text('已解决')
			self:can_bid(false)
			self.btreply.ok = false
		else
			self.price:set_inner_text('待解决')
			self:can_bid(true)
			self.btreply.ok = true
		end
		
		self.dateline:set_inner_text(data['dateline'])
	
	else
		print('Error : rewardinfoareaArea._set_data data no price')
	end
	
end

rewardinfoareaArea.can_bid = function(self,bl)
	if bl then
		self.infodetail:set_class('stt_bodytop')
	else
		self.infodetail:set_class('box100p')
	end
	self.replydiv:set_visible(bl)
end



rewardinfoareaArea.set_data = function(self,data)

	self:_set_data(data)
	
	self:layout()
	
	self.mgr:run('rewarddetail',self)
	
end
	
	