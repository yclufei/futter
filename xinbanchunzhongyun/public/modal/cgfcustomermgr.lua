
		

-- D:\GOA\reslibrary\templete\res\modal\modalmgr.xsl 58
gr_module("gm_xinbanchunzhongyun")


mcgfcustomermgr = inherit(GmSql.list,GmBase.CallBack):name("mcgfcustomermgr")



mcgfcustomermgr.init = function (self,pagecount)

	local top = self
	
	
	GmSql.list.init(self,gInfo["path"]..'/'..g_local_db_name,'czy_customer')
	GmBase.CallBack.init(self)
	
	self.baseurl = ''

	self.idPair = {}
	self.idPair['prev'] = '0'
	self.idPair['next'] = '0'
	
	self.pageCount = pagecount or 10
	self.totalPage = 0
	
	self:reset_maxminid('czy_customer','id')
	
	
	self.action = {}
	self.op  = {}
	
	
	
	-----------------------------
	self.action['cgfcustomeritem'] = {} 	
	-------
	self.op['cgfcustomeritem'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfcustomeritem()
		for a,b in pairs(top.action['cgfcustomeritem']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfcustomeritem(newpostparam)
		
	end	
		
  self.action['cgfcustomeritem']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfcustomeritem']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['cgfcustomeritem']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['cgfcustomeritem']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomeritem']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomeritem']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomeritem']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomeritem']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomeritem']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomeritem']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['cgfcustomeritem']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfcustomerlist'] = {} 	
	-------
	self.op['cgfcustomerlist'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfcustomerlist()
		for a,b in pairs(top.action['cgfcustomerlist']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfcustomerlist(newpostparam)
		
	end	
		
  self.action['cgfcustomerlist']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfcustomerlist']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['cgfcustomerlist']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['cgfcustomerlist']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerlist']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerlist']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerlist']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerlist']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerlist']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerlist']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['cgfcustomerlist']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfcustomerpost'] = {} 	
	-------
	self.op['cgfcustomerpost'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfcustomerpost()
		for a,b in pairs(top.action['cgfcustomerpost']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfcustomerpost(newpostparam)
		
	end	
		
  self.action['cgfcustomerpost']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfcustomerpost']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['cgfcustomerpost']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['cgfcustomerpost']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerpost']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerpost']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerpost']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerpost']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerpost']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerpost']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['cgfcustomerpost']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfcustomerdetail'] = {} 	
	-------
	self.op['cgfcustomerdetail'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfcustomerdetail()
		for a,b in pairs(top.action['cgfcustomerdetail']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfcustomerdetail(newpostparam)
		
	end	
		
  self.action['cgfcustomerdetail']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfcustomerdetail']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['cgfcustomerdetail']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['cgfcustomerdetail']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerdetail']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomerdetail']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomerdetail']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomerdetail']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomerdetail']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomerdetail']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['cgfcustomerdetail']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
	-----------------------------
	self.action['cgfcustomermodify'] = {} 	
	-------
	self.op['cgfcustomermodify'] = function(postparam,ui)
	
		local net = GmBase.czynet.get_instance()		
		local newpostparam = {}
		local tbname,callbackey,newpostparam = net:cgfcustomermodify()
		for a,b in pairs(top.action['cgfcustomermodify']) do
			if postparam[a] ~= nil then
				newpostparam[a] = postparam[a]
			end
		end
		net:add_callback(callbackey,ui)	
		local tb,callbackey = net:cgfcustomermodify(newpostparam)
		
	end	
		
  self.action['cgfcustomermodify']['id'] = { ['title'] = 'id' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['name'] = { ['title'] = 'name' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['code'] = { ['title'] = 'code' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['telephone'] = { ['title'] = 'telephone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['fax'] = { ['title'] = 'fax' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['province'] = { ['title'] = 'province' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['country'] = { ['title'] = '国家,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['city'] = { ['title'] = 'city' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '30' }	
  self.action['cgfcustomermodify']['area'] = { ['title'] = 'area' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '128' }	
  self.action['cgfcustomermodify']['address'] = { ['title'] = 'address' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['village'] = { ['title'] = '乡镇,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['digging_uid'] = { ['title'] = '开发人,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['salesman_uid'] = { ['title'] = 'salesman_uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['service_uid'] = { ['title'] = '客服人员,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['region'] = { ['title'] = 'region' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['category'] = { ['title'] = 'category' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['pinpai'] = { ['title'] = 'pinpai' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['brand_id'] = { ['title'] = 'brand_id' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['delivery'] = { ['title'] = 'delivery' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['linkman'] = { ['title'] = 'linkman' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['phone'] = { ['title'] = 'phone' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['email'] = { ['title'] = 'email' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['qq'] = { ['title'] = 'qq' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['wechat'] = { ['title'] = '微信,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '50' }	
  self.action['cgfcustomermodify']['website'] = { ['title'] = 'website' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['discount'] = { ['title'] = '经销商折扣,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['note'] = { ['title'] = 'note' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['uid'] = { ['title'] = 'uid' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['hittimes'] = { ['title'] = '点击量,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['addtime'] = { ['title'] = 'addtime' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['disable'] = { ['title'] = '1=>禁用,0=>正常,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomermodify']['pay_type'] = { ['title'] = '付款类型,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['type'] = { ['title'] = 'type' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }	
  self.action['cgfcustomermodify']['weixin_closed'] = { ['title'] = 'weixin_closed' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '1' }	
  self.action['cgfcustomermodify']['weixin_password'] = { ['title'] = 'weixin_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['added_by'] = { ['title'] = '添加人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['modified_by'] = { ['title'] = '修改人,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['andriod_password'] = { ['title'] = 'andriod_password' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '32' }	
  self.action['cgfcustomermodify']['k_id'] = { ['title'] = '配对到的kshow软件中的经销商id,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['arrears_warning'] = { ['title'] = '欠款预警值,' , ['t'] = 'n' , ['min'] = 'NaN' , ['max'] = '11' }	
  self.action['cgfcustomermodify']['pref_pro'] = { ['title'] = '偏好产品,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['resource'] = { ['title'] = '客户来源,' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '64' }	
  self.action['cgfcustomermodify']['rebates'] = { ['title'] = '返点比%' , ['t'] = 's' , ['min'] = 'NaN' , ['max'] = '20' }
  self.action['cgfcustomermodify']['list_source'] = { ['title'] = '' ,['t'] = 's' , ['max'] = 50 }
	
  
 
  	
  
	self.session = {}
	
end   





mcgfcustomermgr.check_fields_validate = function(self,key,postparam)
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


 
mcgfcustomermgr.get_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key]
end

mcgfcustomermgr.has_session = function(self,key)
	if key == nil then
		key = 'default'
	end
	return self.session[key] ~= nil
end
 
 
mcgfcustomermgr.add_session = function(self,key,ses)
	self.session[key] = ses
end


mcgfcustomermgr.add_ui = function(self,key,ui)
	self.uis[key] = ui
end




-- todo
mcgfcustomermgr.run = function(self,key,ui)
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


mcgfcustomermgr.get_net_page = function(self,netmethon,attrs)
	local top = self	
	local discuz = GmBase.net.get_instance()
	local methon = netmethon
	if methon ~= nil and discuz[methon] then
		print('mcgfcustomermgr.get_net_page ',methon)
		local tbname,callbackey,tb = discuz[netmethon](discuz)
		for k,v in pairs(attrs) do
			tb[k] = attrs[k]
		end
		discuz[netmethon](discuz,tb)
	else
		print('mcgfcustomermgr.get_net_page error ',methon)
	end		
end




mcgfcustomermgr.get_prev_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfcustomerlist']) do
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


mcgfcustomermgr.get_next_page = function(self,ui,callback)
	if ui.page ~= nil and type(ui.page) == 'number' then
		local uiattrs = ui:GetAttrs()
		local attrs = {}
		for a,b in pairs(self.action['cgfcustomerlist']) do
			if type(uiattrs[a]) ~= nil then
				attrs[a] = uiattrs[a]
			end
		end
		attrs.page = ui.page + 1
		self:get_net_page(ui.netmethon,attrs)
	end
end

------------------------------------------------------------------------------------



mcgfcustomermgr.init_table = function(self)
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


	