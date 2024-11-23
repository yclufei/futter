
gr_module("GmBase")

qscmsnet = inherit(GmSql.list,GmBase.CallBack):name("qscmsnet")

qscmsnet.instance = nil

qscmsnet.get_instance = function(pagecount)
	if GmBase.qscmsnet.instance == nil then
		GmBase.qscmsnet.instance = GmBase.qscmsnet()
		GmBase.qscmsnet.instance:init_table()
	end
	return GmBase.qscmsnet.instance
end

qscmsnet.init_table = function(self)

	local tablefield = {}
	tablefield['id'] = { ["i"] = 10, }
	tablefield['theme'] = { ["v"] = 50, }
	tablefield['alias'] = { ["v"] = 150, }
	tablefield['is_display'] = { ["i"] = 10, }	
	tablefield['category_id'] = { ["i"] = 10, }
	tablefield['type_id'] = { ["v"] = 10, }
	tablefield['title'] = { ["v"] = 24, }
	tablefield['note'] = { ["v"] = 120, }
	tablefield['show_order'] = { ["i"] = 10, }
	tablefield['addtime'] = { ["i"] = 10, }
	tablefield['starttime'] = { ["i"] = 10, }
	tablefield['deadline'] = { ["i"] = 10, }
	tablefield['content'] = { ["v"] = 220, }
	tablefield['url'] = { ["v"] = 250, }
	tablefield['text_color'] = { ["i"] = 4, }
	tablefield['explain'] = { ["i"] = 10, }
	tablefield['uid'] = { ["i"] = 10, }
	
	self:create_table( 'qscms_ad', tablefield)
	
	self:initTableStruct()
end


qscmsnet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'forum')
	GmBase.CallBack.init(self)
	
	self.token = nil
	
	self.base = g_serverRoot..'appserver/qs/'
	
	cwarn('@@ ################   qscmsnet.init ')
	
end

qscmsnet.jobs_list = function(self,callback)
	gxo_curl('http://120.24.2.101/qs/index.php?m=Home&c=AjaxCommon&a=jobs_list',callback)
end
		
--http://120.24.2.101/qs4/index.php?m=appapi&c=ad&a=category&alias=LOVEMUSEUM
qscmsnet.ad_category = function(self,urs,pwd,callback)
	local p = {}
	p['username'] = urs
	p['password'] = pwd
	gxo_curl('http://120.24.2.101/qs/index.php?m=Home&c=Api&a=login',callback,p)
end
	
	
--http://192.168.1.137:8080/qs2/index.php?m=&c=AjaxCommon&a=resume_list
qscmsnet.ad = function(self,postparam)

	local callbackey = 'qscmsnet.ad'
	
	if postparam == nil then
		local tb = {}
		tb.a = 'ad'	
		tb.alias = ''	
		tb.list_source = ''
		return 'qscms_ad',callbackey,tb
	end
	
	local top = self
	local url = g_serverRoot..'qs2/index.php?m=&c=AjaxCommon&a=ad&ctrlsource='..g_mainModule..'_'..postparam.list_source..'&prj='..g_mainModule
	

		
	gxo_curl(url ,function(data)
		if data['success'] then
			self.tablename = 'qscms_ad'
			for a,b in GSortedPairs4(data['data']) do
				top:SetDirty(true)
				if b['content'] then
					b['imgsrc'] = g_serverRoot..'qs2/data/upload/ads/'..b['content']
				end
				top:AddorUpdateRecord('id',b)
			end
			top:SetDirty(true)
			top:handle_callback(callbackey,'qscms_ad',postparam,data)
		end
	end,postparam)
	
	return 'qscms_ad',callbackey
end
		
		
		