
gr_module("GmBase")

objectlistData = inherit(GmCtrl.ControlBase):name("objectlistData")

objectlistData.init = function(self,parent,eid,sorkey,desc)

	GmCtrl.ControlBase.init(self,parent,eid)
	
	self.sortIDList = {}
	
	self.orderdesc = desc
	
	self.itemdata = {}

	self.curPageCount = 20
	
	self:set_sortkey(sorkey or 'clientid',desc)
	
end




objectlistData.set_sortkey = function(self,sorkey,desc)
	if sorkey then
		self.sorkey = sorkey or 'clientid'
		self.orderstr = ' order by CAST('..self.sorkey..' AS int) '
	else
		cerror('objectlistData.set_sortkey error sorkey is nil',self._ID)
		print(debug.traceback())
	end
end


objectlistData.get_sort_order = function(self,bl)
	if self.sorkey then
		if self.orderdesc or bl then
			return self.orderstr
		else
			return self.orderstr..' desc '
		end
	else
		cerror('objectlistData.get_sort_order error self.sorkey is nil',self._ID)
		print(debug.traceback())
	end
end

-- 这是测试数据函数
objectlistData.get_net_data = function(self,page)
	local itemdata = {}
	local begin = page * self.curPageCount
	local stop = begin + self.curPageCount - 1
	for i = begin , stop do
		itemdata[i] = {}
		itemdata[i][self.sorkey] = 5000 - i
		itemdata[i]['intro'] = 'itemdata '..itemdata[i][self.sorkey]
	end
	local ret = {}
	ret['success'] = true
	ret['data'] = itemdata
	self:on_net_data(page,ret)
end

-- 这是测试数据函数
objectlistData.on_net_data = function(self,page,netdata)
	if netdata['success'] then	
		local data = netdata['data']		
		for a,b in GIDSortedPairs(data) do
			local len = table.size(self.sortIDList)
			local itemid = b[self.sorkey]
			self.sortIDList[itemid] = itemid	
			self.itemdata[itemid] = b
		end
		return table.size(data)		
	end	
	return 0	
end


objectlistData.clean = function(self)
	self.sortIDList = {} 
end


