
-- 弹出树节点选择框
gr_module("GmBase")

popAddressFrame = inherit(GmCtrl.ControlBase):name("popAddressFrame")

popAddressFrame.init = function (self,parent)

	local top = self
	local win = hostWindow
	
	GmCtrl.ControlBase.init(self,parent,"pop_AddressFrame")
	
	
	self.province 	= self:get_child("province")
	self.province:set_click(function(item)
		top.provincelist:set_visible(true)	
		top.citylist:set_visible(false)	
		top.distlist:set_visible(false)	
		top.communitylist:set_visible(false)	
		top:layout()
		top:updatetick(true)
	end)
		
	self.city 	= self:get_child("city")
	self.city:set_click(function(item)
		print('city click')
		top.provincelist:set_visible(false)	
		top.citylist:set_visible(true)	
		top.distlist:set_visible(false)	
		top.communitylist:set_visible(false)	
		top:layout()
		top:updatetick(true)
	end)
	
	self.dist 	= self:get_child("dist")
	self.dist:set_click(function(item)
		print('dist click')
		top.provincelist:set_visible(false)	
		top.citylist:set_visible(false)	
		top.distlist:set_visible(true)	
		top.communitylist:set_visible(false)	
		top:layout()
		top:updatetick(true)
	end)
	
	self.community 	= self:get_child("community")
	self.community:set_click(function(item)
		print('community click')
		top.provincelist:set_visible(false)	
		top.citylist:set_visible(false)	
		top.distlist:set_visible(false)	
		top.communitylist:set_visible(true)	
		top:layout()
		top:updatetick(true)
	end)
	
	self.itemparent 	= self:get_child("itemparent")
	
	
	self.provincedata = {}	
	self.provincedata[1] = '北京市'
	self.provincedata[2] = '天津市'
	self.provincedata[3] = '河北省'
	self.provincedata[4] = '山西省'
	self.provincedata[5] = '内蒙古自治区'
	self.provincedata[18] = '湖南省'
	self.provincedata[17] = '湖北省'
	self.provincedata[16] = '河南省'
	self.provincedata[15] = '山东省'
	self.provincedata[14] = '江西省'
	self.provincedata[13] = '福建省'
	self.provincedata[12] = '安徽省'
	self.provincedata[11] = '浙江省'
	self.provincedata[10] = '江苏省'
	self.provincedata[9] = '上海市'
	self.provincedata[8] = '黑龙江省'
	self.provincedata[7] = '吉林省'
	self.provincedata[6] = '辽宁省'
	self.provincedata[19] = '广东省'
	self.provincedata[20] = '广西壮族自治区'
	self.provincedata[36] = '其他'
	self.provincedata[35] = '海外'
	self.provincedata[34] = '澳门特别行政区'
	self.provincedata[33] = '香港特别行政区'
	self.provincedata[32] = '台湾省'
	self.provincedata[31] = '新疆维吾尔自治区'
	self.provincedata[30] = '宁夏回族自治区'
	self.provincedata[29] = '青海省'
	self.provincedata[28] = '甘肃省'
	self.provincedata[27] = '陕西省'
	self.provincedata[26] = '西藏自治区'
	self.provincedata[25] = '云南省'
	self.provincedata[24] = '贵州省'
	self.provincedata[23] = '四川省'
	self.provincedata[22] = '重庆市'
	self.provincedata[21] = '海南省'
	
	
	self.provincelist 	= self.itemparent:get_child("provincelist")
	self.provincelist.items = {}
	local c = self.provincelist:get_child_count(true) -- 没有 uinode 也算
	for i = 0 , c do
		print('#',c,i)
		self.provincelist.items[i] = GmCtrl.ItemBase(self.provincelist,i)
		self.provincelist.items[i]:set_click(function(item)
			top:on_province(tonumber(item.id),item.title)
		end)
	end
	
	
	for aidx,bvalue in pairs(self.provincedata) do
		local idx = tonumber(aidx) - 1
		print('#',idx)
		self.provincelist.items[idx].id = aidx
		self.provincelist.items[idx].title = bvalue
		self.provincelist.items[idx]:set_inner_text(bvalue)
	end
	
	self.citylist 	= self.itemparent:get_child("citylist")
	self.citylist.items = {}
	local c = self.citylist:get_child_count(true)
	for i = 0 , c do
		self.citylist.items[i] = GmCtrl.ItemBase(self.citylist,i)
		self.citylist.items[i]:set_click(function(item)
			top:on_city(tonumber(item.id),item.title)		
		end)
	end
	
	self.distlist 	= self.itemparent:get_child("distlist")
	self.distlist.items = {}
	local c = self.distlist:get_child_count(true)
	for i = 0 , c do
		self.distlist.items[i] = GmCtrl.ItemBase(self.distlist,i)
		self.distlist.items[i]:set_click(function(item)
			top:on_dist(tonumber(item.id),item.title)		
		end)
	end
	
	self.communitylist 	= self.itemparent:get_child("communitylist")
	self.communitylist.items = {}
	local c = self.communitylist:get_child_count(true)
	for i = 0 , c do
		self.communitylist.items[i] = GmCtrl.ItemBase(self.communitylist,i)
		self.communitylist.items[i]:set_click(function(item)
			top:on_community(tonumber(item.id),item.title)		
		end)
	end

	
	
	
	self.scrollcontainer 	= self:get_child("scrolllist")
	self.scrollTable 			= self.scrollcontainer:get_child("scrollTable")
	
	self.scrollcontainer:set_scroll_container(true)
	
	self.popmanager = parent

	self.save = self:get_child('save')
	self.save:set_click(function(item)
		table.print(top.data)
		top.ctrlcallback('address',top.data)
		top.popmanager:show_pop('address',false)
	end)

	self.title = self:get_child('title')
	
	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'misc_district'
	
	self.data = {}

	self:set_visible(false)
 
end



popAddressFrame.on_province = function(self,pid,title)
	print('popAddressFrame.on_province',pid)
	self:SetAttrDirect('pid',tostring(pid))
	self:SetAttrDirect('level','province')
	self:init_net_data()
	
	self.data = { }
	
	self.data['province'] = { [pid] = title }
	
	self.province.pid = pid
	self.province.title = title
	self.province:set_inner_text(title)
	
	self.city:set_visible(false)	
	self.dist:set_visible(false)	
	self.community:set_visible(false)	

	self:updatetick(true)
end


popAddressFrame.on_city = function(self,pid,title)
	print('popAddressFrame.on_city',pid)
	self:SetAttrDirect('pid',tostring(pid))
	self:SetAttrDirect('level','city')
	self:init_net_data()
	
	self.data['city'] = { [pid] = title }
	
	self.city.pid = pid
	self.city.title = title
	self.city:set_inner_text(' \\ '..title)
	
	self.city:set_style('display:inblock')		
	self.dist:set_visible(false)	
	self.community:set_visible(false)	
	
	self:updatetick(true)
	
end


popAddressFrame.on_dist = function(self,pid,title)
	print('popAddressFrame.on_dist',pid)
	self:SetAttrDirect('pid',tostring(pid))
	self:SetAttrDirect('level','dist')
	self:init_net_data()
	
	self.data['dist'] = { [pid] = title }
	
	self.dist.pid = pid
	self.dist.title = title
	self.dist:set_inner_text(' \\ '..title)

	self.city:set_style('display:inblock')	
	self.dist:set_style('display:inblock')		
	self.community:set_visible(false)	

	self:updatetick(true)
end


popAddressFrame.on_community = function(self,pid,title)
	print('popAddressFrame.on_community',pid)
	self:SetAttrDirect('pid',tostring(pid))
	self:SetAttrDirect('level','community')
	self:init_net_data()
	
	self.data['community'] = { [pid] = title }
	
	self.city:set_style('display:inblock')	
	self.dist:set_style('display:inblock')	
	self.community:set_style('display:inblock')		
	
	self.community.pid = pid
	self.community.title = title
	self.community:set_inner_text(' \\ '..title)
	
	self:updatetick(true)
end




popAddressFrame.set_title = function(self,titleValue)
	print('popAddressFrame.set_title',titleValue)
	self.title:set_inner_text(titleValue)	
end



popAddressFrame.clear = function(self,title)
	self.data = nil
	self.ctrlcallback = nil
end



popAddressFrame.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)
	if self.net.classname..'.'..self.netmethon == callbackey then		

		print('popAddressFrame.callback',callbackey,tbname,postparam,data,sortkey,ids)
		table.print(postparam)
		table.print(data)
		
		local pdata = data['data']
		
		if postparam['level'] == "province" then
		
			for k,v in pairs(self.citylist.items) do
				v:set_visible(false)
			end
			
			if table.size(pdata) > 0 then
				self.provincelist:set_visible(false)
				local idx = 0
				for k,v in pairs(pdata) do
					self.citylist.items[idx].id = v['id']
					self.citylist.items[idx].title = v['name']
					self.citylist.items[idx]:set_inner_text(v['name'])
					self.citylist.items[idx]:set_visible(true)
					idx = idx + 1
				end
				self.citylist:set_visible(true)			
			end
			
			
		elseif postparam['level'] == "city" then
		
			for k,v in pairs(self.distlist.items) do
				v:set_visible(false)
			end
			
			if table.size(pdata) > 0 then
				self.citylist:set_visible(false)
				local idx = 0
				for k,v in pairs(pdata) do
					self.distlist.items[idx].id = v['id']
					self.distlist.items[idx].title = v['name']
					self.distlist.items[idx]:set_inner_text(v['name'])
					self.distlist.items[idx]:set_visible(true)
					idx = idx + 1
				end
				self.distlist:set_visible(true)
			end
			
		elseif postparam['level'] == "dist" then
		
			for k,v in pairs(self.communitylist.items) do
				v:set_visible(false)
			end
			
			if table.size(pdata) > 0 then
				self.distlist:set_visible(false)
				local idx = 0
				for k,v in pairs(pdata) do
					self.communitylist.items[idx].id = v['id']
					self.communitylist.items[idx].title = v['name']
					self.communitylist.items[idx]:set_inner_text(v['name'])
					self.communitylist.items[idx]:set_visible(true)
					idx = idx + 1
				end
				self.communitylist:set_visible(true)
			end
			
		elseif postparam['level'] == "community" then
		
		end
		self:updatetick(true)
		
		return true
	end
	return false
end



popAddressFrame.set_data = function(self,pdata,callback)
	self:clear()
	self.data = pdata
	self.ctrlcallback = callback
	
	for a,b in pairs(pdata['province']) do 
		self.province.pid = a
		self.province.title = b
		self.province:set_inner_text(b) 
	end
	
	for a,b in pairs(pdata['city']) do 
		self.city.pid = a
		self.city.title = b
		self.city:set_inner_text(b)
	end
	
	for a,b in pairs(pdata['dist']) do
		self.dist.pid = a
		self.dist.title = b
		self.dist:set_inner_text(b) 
	end
	
	for a,b in pairs(pdata['community']) do 
		self.community.pid = a
		self.community.title = b
		self.community:set_inner_text(b) 
	end
	
end



popAddressFrame.init_net_data = function(self)
	if self.net ~= nil and self.netmethon ~= nil and self.net[self.netmethon] ~= nil then
			local tbname,key,postparam = self.net[self.netmethon](self.net)
			local attrs = self:GetAttrs()
			for k,v in pairs(attrs) do
				postparam[k] = v
			end
			self.net:add_callback(self.net.classname..'.'..self.netmethon,self)
			self.net[self.netmethon](self.net,postparam)
	else
		cerror('ControlBase.init_net_data error',self._ID,self.parent._ID,self.net,self.netmethon)
	end
end
	
