
gr_module("GmBase")


supesitenet = inherit(GmSql.list,GmBase.CallBack):name("supesitenet")


supesitenet.instance = nil


supesitenet.get_instance = function(pagecount)
	if GmBase.supesitenet.instance == nil then
		GmBase.supesitenet.instance = GmBase.supesitenet(pagecount)
		GmBase.supesitenet.instance:init_table()
	end
	return GmBase.supesitenet.instance
end

supesitenet.init_table = function(self)

	local tablefield = {}
	tablefield["itemid"] = { ["v"] = 20, }
	tablefield["catid"] = { ["v"] = 20, }
	tablefield["uid"] = { ["v"] = 20, }
	tablefield["tid"] = { ["v"] = 20, }
	tablefield["username"] = { ["v"] = 40, }
	tablefield["itemtypeid"] = { ["v"] = 20, }
	tablefield["type"] = { ["v"] = 20, }
	tablefield["subtype"] = { ["v"] = 20, }
	tablefield["subject"] = { ["v"] = 120, }
	tablefield["dateline"] = { ["v"] = 20, }
	tablefield["lastpost"] = { ["v"] = 20, }
	tablefield["viewnum"] = { ["v"] = 20, }
	tablefield["replynum"] = { ["v"] = 20, }
	tablefield["digest"] = { ["v"] = 20, }
	tablefield["top"] = { ["v"] = 20, }
	tablefield["allowreply"] = { ["v"] = 20, }
	tablefield["hash"] = { ["v"] = 20, }
	tablefield["haveattach"] = { ["v"] = 20, }
	tablefield["grade"] = { ["v"] = 20, }
	tablefield["gid"] = { ["v"] = 20, }
	tablefield["gdigest"] = { ["v"] = 20, }
	tablefield["styletitle"] = { ["v"] = 20, }
	tablefield["picid"] = { ["v"] = 20, }
	tablefield["fromtype"] = { ["v"] = 20, }
	tablefield["fromid"] = { ["v"] = 20, }
	tablefield["hot"] = { ["v"] = 20, }
	tablefield["click_1"] = { ["v"] = 20, }
	tablefield["click_2"] = { ["v"] = 20, }
	tablefield["click_3"] = { ["v"] = 20, }
	tablefield["click_4"] = { ["v"] = 20, }
	tablefield["click_5"] = { ["v"] = 20, }
	tablefield["click_6"] = { ["v"] = 20, }
	tablefield["click_7"] = { ["v"] = 20, }
	tablefield["click_8"] = { ["v"] = 20, }
	tablefield["click_9"] = { ["v"] = 20, }
	tablefield["click_10"] = { ["v"] = 20, }
	tablefield["click_11"] = { ["v"] = 20, }
	tablefield["click_12"] = { ["v"] = 20, }
	tablefield["click_13"] = { ["v"] = 20, }
	tablefield["click_14"] = { ["v"] = 20, }
	tablefield["click_15"] = { ["v"] = 20, }
	tablefield["click_16"] = { ["v"] = 20, }
	tablefield["click_17"] = { ["v"] = 20, }
	tablefield["click_18"] = { ["v"] = 20, }
	tablefield["click_19"] = { ["v"] = 20, }
	tablefield["click_20"] = { ["v"] = 20, }
	tablefield["click_21"] = { ["v"] = 20, }
	tablefield["click_22"] = { ["v"] = 20, }
	tablefield["click_23"] = { ["v"] = 20, }
	tablefield["click_24"] = { ["v"] = 20, }
	tablefield["click_25"] = { ["v"] = 20, }
	tablefield["click_26"] = { ["v"] = 20, }
	tablefield["click_27"] = { ["v"] = 20, }
	tablefield["click_28"] = { ["v"] = 20, }
	tablefield["click_29"] = { ["v"] = 20, }
	tablefield["click_30"] = { ["v"] = 20, }
	tablefield["click_31"] = { ["v"] = 20, }
	tablefield["click_32"] = { ["v"] = 20, }
	tablefield["subjectall"] = { ["v"] = 220, }
	tablefield["url"] = { ["v"] = 220, }
	tablefield["nid"] = { ["v"] = 20, }
	tablefield["message"] = { ["v"] = 220, }
	tablefield["relativetags"] = { ["v"] = 20, }
	tablefield["postip"] = { ["v"] = 20, }
	tablefield["relativeitemids"] = { ["v"] = 20, }
	tablefield["customfieldid"] = { ["v"] = 20, }
	tablefield["customfieldtext"] = { ["v"] = 20, }
	tablefield["includetags"] = { ["v"] = 20, }
	tablefield["newsauthor"] = { ["v"] = 20, }
	tablefield["newsfrom"] = { ["v"] = 20, }
	tablefield["newsfromurl"] = { ["v"] = 220, }
	tablefield["newsurl"] = { ["v"] = 220, }
	tablefield["pageorder"] = { ["v"] = 20, }
	tablefield["a_aid"] = { ["v"] = 20, }
	tablefield["a_type"] = { ["v"] = 20, }
	tablefield["a_itemid"] = { ["v"] = 20, }
	tablefield["a_uid"] = { ["v"] = 20, }
	tablefield["a_dateline"] = { ["v"] = 20, }
	tablefield["a_filename"] = { ["v"] = 20, }
	tablefield["a_subject"] = { ["v"] = 20, }
	tablefield["a_attachtype"] = { ["v"] = 20, }
	tablefield["a_isimage"] = { ["v"] = 20, }
	tablefield["a_size"] = { ["v"] = 20, }
	tablefield["a_filepath"] = { ["v"] = 220, }
	tablefield["a_thumbpath"] = { ["v"] = 220, }
	tablefield["a_downloads"] = { ["v"] = 220, }
	tablefield["a_subjectall"] = { ["v"] = 220, }
	self:create_table( 'supesite_news', tablefield)
	
	local tablefield = {}
	tablefield["catid"] = { ["v"] = 20, }
	tablefield["upid"] = { ["v"] = 20, }
	tablefield["name"] = { ["v"] = 20, }
	tablefield["type"] = { ["v"] = 20, }
	tablefield["note"] = { ["v"] = 40, }
	tablefield["subcatid"] = { ["v"] = 20, }
	tablefield["image"] = { ["v"] = 180, }
	tablefield["thumb"] = { ["v"] = 180, }
	
	self:create_table( 'supesite_category', tablefield)
	
	self:initTableStruct()
end

supesitenet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'supesite_news')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'SupeSite/upload/'
	
	self.tables = {}
	self.tables['news'] = 'supesite_news'
	self.tables['category'] = 'supesite_category'
	
end

supesitenet.is_empty_table = function(self,funcname)
	local tbname = self.tables[funcname]
	if self.tables[funcname] ~= nil then
		return self:is_empty('modoer_product')
	end
end


supesitenet.news = function(self,typestr)
	local top = self
	local p = {}
	local url = string.format(self.base..'api_news.php?type=%s',typestr)
	gxo_curl(url,function(data)
		if data['ERROR'] == '0' then
			top.tablename = top.tables['news']
			local arr = {}
			for a,b in pairs(data['data']) do
				local item = {}
				item['id'] = b['itemid']
				item['imgsrc'] = b['a_filepath']
				table.insert(arr,item)
				makeNetField_test('supesite_news',b)
				top:SetDirty(true)
				top:AddorUpdateRecord('itemid',b)
			end
			top:SetDirty(true)
			top:handle_callback('supesitenet.news',arr,typestr)
		end
	end,p)
	return 'supesitenet.news'
end


supesitenet.category = function(self,typestr)
	local top = self
	local p = {}
	local url = string.format(self.base..'api_category.php?type=%s',typestr)
	gxo_curl(url,function(data)
--		table.print(data)
		if data['ERROR'] == '0' then
			top.tablename = top.tables['category']
			for a,b in pairs(data['data']) do
				b['thumb'] = self.base..'attachments/'..b['thumb']
				b['image'] = self.base..'attachments/'..b['image']
				top:SetDirty(true)
				top:AddorUpdateRecord('catid',b)
			end
			top:SetDirty(true)
			top:handle_callback('supesitenet.category',data['data'],typestr)
		end
	end,p)
	return 'supesitenet.category'
end
