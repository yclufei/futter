

-- D:\GOA\reslibrary\templete\res\item\item.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

memberitemItem = inherit(GmCtrl.ControlBase):name("memberitemItem")

memberitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "memberitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.oid = self:get_child("oid")
	
	self.refrank = self:get_child("refrank")
	
	self.reftable = self:get_child("reftable")
	
	self.tablekey = self:get_child("tablekey")
	
	self.reftype = self:get_child("reftype")
	
	self.refview = self:get_child("refview")
	
	self.odeby = self:get_child("odeby")
	
	
	
end


memberitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	