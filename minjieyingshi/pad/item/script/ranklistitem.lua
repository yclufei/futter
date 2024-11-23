

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_minjieyingshi")

ranklistitemItem = inherit(GmCtrl.ControlBase):name("ranklistitemItem")

ranklistitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "ranklistitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.oid = self:get_child("oid")
	
	self.refrank = self:get_child("refrank")
	
	self.reftable = self:get_child("reftable")
	
	self.tablekey = self:get_child("tablekey")
	
	self.reftype = self:get_child("reftype")
	
	self.refview = self:get_child("refview")
	
	self.odeby = self:get_child("odeby")
	
	
	
end


ranklistitemItem.set_data = function(self,data)
	self.data = data
	
		if data['oid'] and self.oid and self.oid:is_init() then
			self.oid:set_inner_text(tostring(data['oid']))
		end
	
		if data['refrank'] and self.refrank and self.refrank:is_init() then
			self.refrank:set_inner_text(tostring(data['refrank']))
		end
	
		if data['reftable'] and self.reftable and self.reftable:is_init() then
			self.reftable:set_inner_text(tostring(data['reftable']))
		end
	
		if data['tablekey'] and self.tablekey and self.tablekey:is_init() then
			self.tablekey:set_inner_text(tostring(data['tablekey']))
		end
	
		if data['reftype'] and self.reftype and self.reftype:is_init() then
			self.reftype:set_inner_text(tostring(data['reftype']))
		end
	
		if data['refview'] and self.refview and self.refview:is_init() then
			self.refview:set_inner_text(tostring(data['refview']))
		end
	
		if data['odeby'] and self.odeby and self.odeby:is_init() then
			self.odeby:set_inner_text(tostring(data['odeby']))
		end
	
end


	