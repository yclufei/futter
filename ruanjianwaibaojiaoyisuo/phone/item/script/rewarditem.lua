
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewarditemItem = inherit(GmCtrl.ControlBase):name("rewarditemItem")

rewarditemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "rewarditemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	self.price = self:get_child('price')
	self.dateline = self:get_child('dateline')
	self.tid = self:get_child('testtid')
	

	self.rewardhead = GmCtrl.ItemHeadPriceCtrl(self)
	self.rewardctrl = GmCtrl.ItemFieldCtrl(self)
	self.foot = GmCtrl.ItemFootCountCtrl(self)

	
end


rewarditemItem.set_data = function(self,data)

	self.data = data
	
	local top = self

	if self.data['data'] then
		local itemdata = StringToTable( self.data['data'] )
		for k,v in pairs(itemdata) do
			self.data[k] = v
		end
	end
	
	self:set_childs_inner_text(self.data)
	
	self.rewardctrl:set_data(self.data)
	self.rewardhead:set_data(self.data)
	self.foot:set_data(self.data)
	
	if self.data['price'] then
		price = tonumber(self.data['price'])
		if price < 0 then
			self.price:set_inner_text(' 已解决')
		else
			self.price:set_inner_text(' 待解决')
		end
	end
	
	self.tid:set_inner_html(self.data['tid'])
	self.dateline:set_inner_html(' '..self.data['dateline'])
	
end


	