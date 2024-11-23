	

-- D:\GOA\reslibrary\templete\res\area\area.pc.lua.xsl
					
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
			
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


cgfuserinfoareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('cgfuserinfoareaArea callback error ',key,tb)
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


