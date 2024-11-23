	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_chayegongsi")

mysalebillareaArea = inherit(GmCtrl.ControlBase):name("mysalebillareaArea")

mysalebillareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mysalebillareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	

	self.page = 0
	
	self:show_scroll_bar(true)

end






mysalebillareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


mysalebillareaArea.set_data = function(self,data)
	self.data = data
	
	if self.attr and self.attr.set_data then
		self.attr:set_data(data)
	end
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


