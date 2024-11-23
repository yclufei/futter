
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mcustomermgr = inherit(GmSql.list,GmBase.CallBack):name("mcustomermgr")



mcustomermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'customer')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('customer','tid')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['customeritem'] = {} 	
	-------
	self.op['customeritem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:customeritem()
		for a,b in pairs(top.action['customeritem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:customeritem(newpostparam)
		
	end	
		
  self.action['customeritem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['customeritem']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['customeritem']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['customeritem']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customeritem']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customeritem']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customeritem']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customeritem']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customeritem']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customeritem']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['customeritem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['customerpost'] = {} 	
	-------
	self.op['customerpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:customerpost()
		for a,b in pairs(top.action['customerpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:customerpost(newpostparam)
		
	end	
		
  self.action['customerpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['customerpost']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['customerpost']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['customerpost']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerpost']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerpost']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerpost']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerpost']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerpost']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerpost']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['customerpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['customermodify'] = {} 	
	-------
	self.op['customermodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:customermodify()
		for a,b in pairs(top.action['customermodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:customermodify(newpostparam)
		
	end	
		
  self.action['customermodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['customermodify']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['customermodify']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['customermodify']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customermodify']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customermodify']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customermodify']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customermodify']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customermodify']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customermodify']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['customermodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['customerdetail'] = {} 	
	-------
	self.op['customerdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:customerdetail()
		for a,b in pairs(top.action['customerdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:customerdetail(newpostparam)
		
	end	
		
  self.action['customerdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['customerdetail']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['customerdetail']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['customerdetail']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerdetail']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerdetail']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerdetail']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerdetail']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerdetail']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerdetail']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['customerdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['customerlist'] = {} 	
	-------
	self.op['customerlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:customerlist()
		for a,b in pairs(top.action['customerlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:customerlist(newpostparam)
		
	end	
		
  self.action['customerlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['customerlist']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['customerlist']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['customerlist']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerlist']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['customerlist']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['customerlist']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['customerlist']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['customerlist']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['customerlist']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['customerlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mcustomermgr.check_fields_validate = function(self,key,postparam)
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


 
mcustomermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mcustomermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mcustomermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mcustomermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mcustomermgr.run = function(self,key,ui)
	if self.action[key] ~= nil and self.op[key] ~= nil then
		local tb = {}
		for k,v in pairs(self.action[key]) do
			if ui[k] ~= nil and type(ui[k]) == 'table' and ui[k].get_text then
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


mcustomermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mcustomermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mcustomermgr.get_net_page error ',methon)
	end		
end




mcustomermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['customerlist']) do
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


mcustomermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['customerlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mcustomermgr.init_table = function(self)
	local tablefield = {}
	
	--number
	tablefield['id'] = { ["i"] = 11, }
    
	--string
	tablefield['name'] = { ["v"] = 32, }
    
	--string
	tablefield['code'] = { ["v"] = 20, }
    
	--string
	tablefield['telephone'] = { ["v"] = 64, }
    
	--string
	tablefield['fax'] = { ["v"] = 32, }
    
	--string
	tablefield['province'] = { ["v"] = 20, }
    
	--string
	tablefield['country'] = { ["v"] = 64, }
    
	--string
	tablefield['city'] = { ["v"] = 30, }
    
	--string
	tablefield['area'] = { ["v"] = 128, }
    
	--string
	tablefield['address'] = { ["v"] = 64, }
    
	--string
	tablefield['village'] = { ["v"] = 64, }
    
	--number
	tablefield['digging_uid'] = { ["i"] = 11, }
    
	--number
	tablefield['salesman_uid'] = { ["i"] = 11, }
    
	--number
	tablefield['service_uid'] = { ["i"] = 11, }
    
	--string
	tablefield['region'] = { ["v"] = 20, }
    
	--string
	tablefield['category'] = { ["v"] = 64, }
    
	--string
	tablefield['pinpai'] = { ["v"] = 64, }
    
	--string
	tablefield['brand_id'] = { ["v"] = 64, }
    
	--string
	tablefield['delivery'] = { ["v"] = 20, }
    
	--string
	tablefield['linkman'] = { ["v"] = 20, }
    
	--string
	tablefield['phone'] = { ["v"] = 32, }
    
	--string
	tablefield['email'] = { ["v"] = 32, }
    
	--string
	tablefield['qq'] = { ["v"] = 20, }
    
	--string
	tablefield['wechat'] = { ["v"] = 50, }
    
	--string
	tablefield['website'] = { ["v"] = 64, }
    
	--string
	tablefield['discount'] = { ["v"] = 20, }
    
	--string
	tablefield['note'] = { ["v"] = 20, }
    
	--number
	tablefield['uid'] = { ["i"] = 32, }
    
	--number
	tablefield['hittimes'] = { ["i"] = 32, }
    
	--string
	tablefield['addtime'] = { ["v"] = 20, }
    
	--number
	tablefield['disable'] = { ["i"] = 1, }
    
	--string
	tablefield['pay_type'] = { ["v"] = 20, }
    
	--string
	tablefield['type'] = { ["v"] = 20, }
    
	--number
	tablefield['weixin_closed'] = { ["i"] = 1, }
    
	--string
	tablefield['weixin_password'] = { ["v"] = 32, }
    
	--string
	tablefield['added_by'] = { ["v"] = 32, }
    
	--string
	tablefield['modified_by'] = { ["v"] = 32, }
    
	--string
	tablefield['andriod_password'] = { ["v"] = 32, }
    
	--number
	tablefield['k_id'] = { ["i"] = 11, }
    
	--number
	tablefield['arrears_warning'] = { ["i"] = 11, }
    
	--string
	tablefield['pref_pro'] = { ["v"] = 64, }
    
	--string
	tablefield['resource'] = { ["v"] = 64, }
    
	--string
	tablefield['rebates'] = { ["v"] = 20, }
    
	self:create_table( self.tablename, tablefield)
	self:initTableStruct()
end


	