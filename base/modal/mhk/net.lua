
gr_module("GmBase")

mhknet = inherit(GmSql.list,GmBase.CallBack):name("mhknet")

mhknet.instance = nil


mhknet.get_instance = function(pagecount)
	if GmBase.mhknet.instance == nil then
		GmBase.mhknet.instance = GmBase.mhknet(pagecount)
		GmBase.mhknet.instance:init_table()
	end
	return GmBase.mhknet.instance
end

mhknet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'mhk_categary')
	GmBase.CallBack.init(self)
	
	self.base = g_serverRoot..'mhd/appapi/'
		
end



mhknet.init_table = function(self)

	local tablefield = {}
	tablefield["catid"] = { ["v"] = 20, }
	tablefield["catname"] = { ["v"] = 40, }
	tablefield["keywords"] = { ["v"] = 20, }
	tablefield["description"] = { ["v"] = 20, }
	tablefield["parentid"] = { ["v"] = 20, }
	tablefield["catorder"] = { ["v"] = 20, }
	tablefield["cattplname"] = { ["v"] = 20, }
	tablefield["viewtplname"] = { ["v"] = 20, }
	tablefield["imgsrc"] = { ["v"] = 220, }
	self:create_table( 'mhk_categary', tablefield)
	self:initTableStruct()

end



mhknet.categary = function(self,parentid)
	local top = self
	local url = string.format(self.base..'categary.php?parentid=%d',parentid)
	print(url)
	gxo_curl(url,function(data)
--		table.print(data)
		print('mhknet.categary',top.handle_callback)
		if data['ERROR'] == '0' then
			local arr = {}
			for a,b in pairs(data['data']) do
				local item = {}
				item['id'] = b['catid']
				item['imgsrc'] = b['imgsrc']
				item['title'] = b['catname']
				table.insert(arr,item)
				top:SetDirty(true)
				top:AddorUpdateRecord('catid',b)
			end
			top:SetDirty(true)
			top:handle_callback('mhknet.categary',parentid,arr)
		end
	end)		
end
		