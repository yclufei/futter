
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_chayegongsi")


mproductmgr = inherit(GmSql.list,GmBase.CallBack):name("mproductmgr")



mproductmgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'discuz_forum_thread')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('discuz_forum_thread','tid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['productpost'] = {} 	
	-------
	self.op['productpost'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:productpost()
		for a,b in pairs(top.action['productpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:productpost(newpostparam)
		
	end	
		
  self.action['productpost']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productpost']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['productpost']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productpost']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productpost']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productpost']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['rate'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['ratetimes'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['productpost']['tags'] = { ['title'] = '标签' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['allownoticeauthor'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['wysiwyg'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['addfeed'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['uploadalbum'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productpost']['adddynamic'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['productpost']['mod'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['action'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['rewardprice'] = { ['title'] = '悬赏金额' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['posttime'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productpost']['fmtuploadtype'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['productpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['productitem'] = {} 	
	-------
	self.op['productitem'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:productitem()
		for a,b in pairs(top.action['productitem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:productitem(newpostparam)
		
	end	
		
  self.action['productitem']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productitem']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['productitem']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productitem']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productitem']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productitem']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productitem']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productitem']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['productitem']['tags'] = { ['title'] = '标签' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['productitem']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['productitem']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productitem']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productitem']['rewardprice'] = { ['title'] = '悬赏金额' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['productitem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['productlist'] = {} 	
	-------
	self.op['productlist'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:productlist()
		for a,b in pairs(top.action['productlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:productlist(newpostparam)
		
	end	
		
  self.action['productlist']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productlist']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['productlist']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productlist']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productlist']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productlist']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productlist']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productlist']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productlist']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productlist']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productlist']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productlist']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['productlist']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['productlist']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['productlist']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productlist']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productlist']['rewardprice'] = { ['title'] = '悬赏金额' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['productlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['productdetail'] = {} 	
	-------
	self.op['productdetail'] = function(postparam,ui)
	
		local net = GmBase.discuznet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:productdetail()
		for a,b in pairs(top.action['productdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:productdetail(newpostparam)
		
	end	
		
  self.action['productdetail']['selectsortid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['sortid'] = { ['title'] = '分类' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['subject'] = { ['title'] = '标题' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productdetail']['message'] = { ['title'] = '内容' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '255' }	
  self.action['productdetail']['pid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['fid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['tid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['avatar'] = { ['title'] = '用户头像' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productdetail']['pic'] = { ['title'] = '图片' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productdetail']['thumbpath'] = { ['title'] = '缩略图' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '256' }	
  self.action['productdetail']['summary'] = { ['title'] = '简介' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productdetail']['first'] = { ['title'] = '第一层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['author'] = { ['title'] = '用户' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productdetail']['authorid'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['dateline'] = { ['title'] = '' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['useip'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '120' }	
  self.action['productdetail']['port'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '6' }	
  self.action['productdetail']['invisible'] = { ['title'] = '可视' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['anonymous'] = { ['title'] = '匿名' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['usesig'] = { ['title'] = 'sig' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['htmlon'] = { ['title'] = 'html' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['bbcodeoff'] = { ['title'] = 'BBC' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['smileyoff'] = { ['title'] = '简介' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['parseurloff'] = { ['title'] = '解释URL' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['attachment'] = { ['title'] = '附件' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['rate'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['ratetimes'] = { ['title'] = '' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['status'] = { ['title'] = '状态' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['productdetail']['tags'] = { ['title'] = '标签' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['comment'] = { ['title'] = '评论' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['productdetail']['replycredit'] = { ['title'] = '回复' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '10' }	
  self.action['productdetail']['position'] = { ['title'] = '楼层' , ['t'] = 'x' , ['min'] = 'NaN' , ['max'] = '8' }	
  self.action['productdetail']['special'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '2' }	
  self.action['productdetail']['uid'] = { ['title'] = '' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['productdetail']['rewardprice'] = { ['title'] = '悬赏金额' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['productdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mproductmgr.check_fields_validate = function(self,key,postparam)
	local checkfunc = {}
	checkfunc['t'] = function(fm,value)
		return true
	end
	checkfunc['min'] = function(fm,value)
		if string.len(value) < tonumber(fm) then
			return false
		end
		return true
	end
	checkfunc['max'] = function(fm,value)
		if string.len(value) > tonumber(fm) then
			return false
		end
		return true
	end
	local format = self.action[key]
	for fkey,fvalue in pairs(postparam) do
		if format[fkey] ~= nil then
			for fmkey,fmvalue in pairs(format[fkey]) do
				if checkfunc[fmkey] ~= nil then
					if checkfunc[fmkey](fmvalue,fvalue) == false then
						return false,tostring(format[fkey]['title']).." "..tostring(fmkey).." "..tostring(fmvalue).." error"
					end
				end
			end
		end
	end
	return true,""
end 


 
mproductmgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mproductmgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mproductmgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mproductmgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mproductmgr.run = function(self,key,ui)
	if self.action[key] ~= nil and self.op[key] ~= nil then
		local tb = {}
		for k,v in pairs(self.action[key]) do
			if ui[k] ~= nil and ui[k].get_text then
				tb[k] = ui[k]:get_text()
			else
				print('run error',key,k)
			end
		end
		local success,msg = self:check_fields_validate(key,tb)
		if success then
			self.op[key](tb,ui)
		else
			ui.hostWindow:showMsg(msg)
		end		
	else
		print('run error self.action',key)
	end
end


------------------------------------------------------------------------------------


mproductmgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mproductmgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mproductmgr.get_net_page error ',methon)
	end		
end




mproductmgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['productlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page - 1		

		if attrs.page < 1 then
			attrs.page = 1
		end

		self:get_net_page(ui.netmethon,attrs)
	end
end


mproductmgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['productlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mproductmgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['selectsortid'] = { ["i"] = 20, }
    
	--number
	tablefield['sortid'] = { ["i"] = 20, }
    
	--string
	tablefield['subject'] = { ["v"] = 120, }
    
	--string
	tablefield['message'] = { ["v"] = 255, }
    
	-- other
	tablefield['pid'] = { ["v"] = 20, }
		
	-- other
	tablefield['fid'] = { ["v"] = 20, }
		
	-- other
	tablefield['tid'] = { ["v"] = 20, }
		
	--string
	tablefield['avatar'] = { ["v"] = 256, }
    
	--string
	tablefield['pic'] = { ["v"] = 256, }
    
	--string
	tablefield['thumbpath'] = { ["v"] = 256, }
    
	--string
	tablefield['summary'] = { ["v"] = 120, }
    
	-- other
	tablefield['first'] = { ["v"] = 2, }
		
	-- other
	tablefield['author'] = { ["v"] = 120, }
		
	-- other
	tablefield['authorid'] = { ["v"] = 2, }
		
	--string
	tablefield['dateline'] = { ["v"] = 20, }
    
	-- other
	tablefield['useip'] = { ["v"] = 120, }
		
	-- other
	tablefield['port'] = { ["v"] = 6, }
		
	--number
	tablefield['invisible'] = { ["i"] = 2, }
    
	--number
	tablefield['anonymous'] = { ["i"] = 2, }
    
	-- other
	tablefield['usesig'] = { ["v"] = 2, }
		
	-- other
	tablefield['htmlon'] = { ["v"] = 2, }
		
	-- other
	tablefield['bbcodeoff'] = { ["v"] = 2, }
		
	-- other
	tablefield['smileyoff'] = { ["v"] = 2, }
		
	-- other
	tablefield['parseurloff'] = { ["v"] = 2, }
		
	-- other
	tablefield['attachment'] = { ["v"] = 2, }
		
	-- other
	tablefield['rate'] = { ["v"] = 2, }
		
	-- other
	tablefield['ratetimes'] = { ["v"] = 2, }
		
	-- other
	tablefield['status'] = { ["v"] = 10, }
		
	-- other
	tablefield['tags'] = { ["v"] = 2, }
		
	-- other
	tablefield['comment'] = { ["v"] = 1, }
		
	-- other
	tablefield['replycredit'] = { ["v"] = 10, }
		
	-- other
	tablefield['position'] = { ["v"] = 8, }
		
	--number
	tablefield['allownoticeauthor'] = { ["i"] = 2, }
    
	--number
	tablefield['wysiwyg'] = { ["i"] = 2, }
    
	--number
	tablefield['special'] = { ["i"] = 2, }
    
	--number
	tablefield['addfeed'] = { ["i"] = 2, }
    
	--number
	tablefield['uploadalbum'] = { ["i"] = 2, }
    
	--string
	tablefield['adddynamic'] = { ["v"] = 6, }
    
	--string
	tablefield['mod'] = { ["v"] = 20, }
    
	--string
	tablefield['action'] = { ["v"] = 20, }
    
	--number
	tablefield['uid'] = { ["i"] = 20, }
    
	--number
	tablefield['rewardprice'] = { ["i"] = 20, }
    
	--number
	tablefield['posttime'] = { ["i"] = 20, }
    
	--string
	tablefield['fmtuploadtype'] = { ["v"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	