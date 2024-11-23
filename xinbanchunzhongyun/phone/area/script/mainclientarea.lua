	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl 14
					
gr_module("gm_xinbanchunzhongyun")

mainclientareaArea = inherit(GmCtrl.ControlBase):name("mainclientareaArea")

mainclientareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainclientareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	
	-- D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 44 cgfcustomerlistarea
	self.cgfcustomerlistarea = gm_xinbanchunzhongyun.cgfcustomerlistareaArea(self)
	
	
	
	self.cgfcustomerlistarea:init_net_data()
	
	
	

	self.page = 0
	
	self:show_scroll_bar(true)

end


mainclientareaArea.on_show = function(self,key)

	
	if self.cgfcustomerlistarea and self.cgfcustomerlistarea.on_show then
		self.cgfcustomerlistarea:on_show(key)
	end
	
	
end







mainclientareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


mainclientareaArea.set_data = function(self,data)
	self.data = data
	
	if self.attr and self.attr.set_data then
		self.attr:set_data(data)
	end
		
	if self.includeControl and self.includeControl.set_data then
		self.includeControl:set_data(data)
	end
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


