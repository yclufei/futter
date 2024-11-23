
gr_module("GmCtrl")

ItemHeadPriceCtrl = inherit(GmCtrl.ControlBase):name("ItemHeadPriceCtrl")

ItemHeadPriceCtrl.init = function(self,parent,elename)
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "ItemHeadPriceCtrl")
	
  
	self.subject = self:get_child("subject_div")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.subject:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'rewardinfo', top.data, true)
	end)
	
	self.sortid = self:get_child("sortid_div")
	self.sortid.set_inner_text = function(ctrl,sortid)
		local mgr = gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.get_instance()
		mgr:SetAttr('typeid',tostring(sortid))
		local a,b,c = mgr:GetRecordsByAttribute()
		if a and tonumber(b) == 1 then
			GmBase.Node.set_inner_text(ctrl,c[0]['name'])
		else
			GmBase.Node.set_inner_text(ctrl,tostring(sortid))
		end
	end
	
	self.price = self:get_child("price_div")
	
end

ItemHeadPriceCtrl.set_data = function(self,data)
	self.data = data
	
	for a,b in pairs(data) do
		if data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end

end
