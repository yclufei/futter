	

-- D:\GOA\reslibrary\templete\res\area\area.pad.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

productmodifyareaArea = inherit(GmCtrl.ControlBase):name("productmodifyareaArea")

productmodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "productmodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


productmodifyareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('productmodifyareaArea callback error ',key,tb)
	end
end



productmodifyareaArea.set_data = function(self,data)
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

