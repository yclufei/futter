	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

cgfcustomerinfoareaArea = inherit(GmCtrl.ControlBase):name("cgfcustomerinfoareaArea")

cgfcustomerinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "cgfcustomerinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
		self.cgfcustomerdetail = gm_xinbanchunzhongyun.cgfcustomeritemItem(self.scrollcontainer)
		-- form.lua.xsl form 91
		

	self.page = 0
	
	self:show_scroll_bar(true)

end






cgfcustomerinfoareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


cgfcustomerinfoareaArea.set_data = function(self,data)
	self.data = data
	
	if self.cgfcustomerdetail and self.cgfcustomerdetail.set_data then
		self.cgfcustomerdetail:set_data(data)
	end			
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


