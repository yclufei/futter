	

-- D:\GOA\reslibrary\templete\res\area\area.pc.lua.xsl
					
gr_module("gm_chayegongsi")

urscenter2areaArea = inherit(GmCtrl.ControlBase):name("urscenter2areaArea")

urscenter2areaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "urscenter2areaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


urscenter2areaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('urscenter2areaArea callback error ',key,tb)
	end
end



urscenter2areaArea.set_data = function(self,data)
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


