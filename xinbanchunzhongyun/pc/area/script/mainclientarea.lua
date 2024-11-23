	

-- D:\GOA\reslibrary\templete\res\area\area.pc.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

mainclientareaArea = inherit(GmCtrl.ControlBase):name("mainclientareaArea")

mainclientareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainclientareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
	
	-- D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 44 cgfcustomerlistarea
	self.cgfcustomerlistarea = gm_xinbanchunzhongyun.cgfcustomerlistareaArea(self)
	
	
	
	self.cgfcustomerlistarea:init_net_data()
	
	
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


mainclientareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('mainclientareaArea callback error ',key,tb)
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


