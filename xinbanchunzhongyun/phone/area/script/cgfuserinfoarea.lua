	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

cgfuserinfoareaArea = inherit(GmCtrl.ControlBase):name("cgfuserinfoareaArea")

cgfuserinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "cgfuserinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
		self.cgfuserdetail = gm_xinbanchunzhongyun.cgfuseritemItem(self.scrollcontainer)
		-- form.lua.xsl form 91
		

	self.page = 0
	
	self:show_scroll_bar(true)

end






cgfuserinfoareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


cgfuserinfoareaArea.set_data = function(self,data)
	self.data = data
	
	if self.cgfuserdetail and self.cgfuserdetail.set_data then
		self.cgfuserdetail:set_data(data)
	end			
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


