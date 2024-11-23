	

-- D:\GOA\reslibrary\templete\res\area\area.pad.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

cgfscriptinfoareaArea = inherit(GmCtrl.ControlBase):name("cgfscriptinfoareaArea")

cgfscriptinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "cgfscriptinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
		self.cgfscriptdetail = gm_xinbanchunzhongyun.cgfscriptitemItem(self.scrollcontainer)
		-- form.lua.xsl form 91
			
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


cgfscriptinfoareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('cgfscriptinfoareaArea callback error ',key,tb)
	end
end



cgfscriptinfoareaArea.set_data = function(self,data)
	self.data = data
	
	if self.cgfscriptdetail and self.cgfscriptdetail.set_data then
		self.cgfscriptdetail:set_data(data)
	end			
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


