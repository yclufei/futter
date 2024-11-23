
gr_module("GmBase")


modoernet = inherit(GmSql.list,GmBase.CallBack):name("modoernet")


modoernet.instance = nil


modoernet.get_instance = function(pagecount)
	if GmBase.modoernet.instance == nil then
		GmBase.modoernet.instance = GmBase.modoernet(pagecount)
		GmBase.modoernet.instance:init_table()
	end
	return GmBase.modoernet.instance
end

modoernet.init_table = function(self)
	local tablefield = {}
	tablefield["pid"] = { ["v"] = 20, }
	tablefield["modelid"] = { ["v"] = 20, }
	tablefield["sid"] = { ["v"] = 20, }
	tablefield["catid"] = { ["v"] = 20, }
	tablefield["dateline"] = { ["v"] = 20, }
	tablefield["uid"] = { ["v"] = 20, }
	tablefield["username"] = { ["v"] = 40, }
	tablefield["subject"] = { ["v"] = 120, }
	tablefield["price"] = { ["v"] = 20, }
	tablefield["grade"] = { ["v"] = 20, }
	tablefield["pageview"] = { ["v"] = 20, }
	tablefield["comments"] = { ["v"] = 20, }
	tablefield["picture"] = { ["v"] = 450, }
	tablefield["thumb"] = { ["v"] = 220, }
	tablefield["description"] = { ["v"] = 220, }
	tablefield["closed_comment"] = { ["v"] = 20, }
	tablefield["status"] = { ["v"] = 20, }
	tablefield["listorder"] = { ["v"] = 20, }
	tablefield["name"] = { ["v"] = 20, }
	tablefield["subname"] = { ["v"] = 20, }
	self:create_table( 'modoer_product', tablefield)
	self:initTableStruct()

end


modoernet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'modoer_product')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'modoer/upload/appapi/'
	
end

modoernet.product_new = function(self,cid)
	local top = self
	local p = {}
	if cid == nil then
		cid = '0'
	end
	local url = string.format(self.base..'product_new.php?cid=%s',tostring(cid))
	--print(url)
	gxo_curl(url,function(data)	
		if data['ERROR'] == '0' then
			---table.print(data)
			local arr = {}
			self.tablename = 'modoer_product'
			for a,b in pairs(data['data']) do
			
				b['picture'] = 'http://120.24.2.101:4356/modoer/upload/'..b['picture']
				b['thumb'] = 'http://120.24.2.101:4356/modoer/upload/'..b['thumb']
							
				
				---makeNetField_test('modoer_product',b)
				
				top:SetDirty(true)
				
				top:AddorUpdateRecord('pid',b)
				
			end
			top:SetDirty(true)
			top:handle_callback('modoernet.product_new',cid,arr)
		end
	end,p)
end
