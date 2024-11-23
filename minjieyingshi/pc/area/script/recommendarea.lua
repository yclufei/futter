	

-- D:\GOA\reslibrary\templete\res\area\area.pc.lua.xsl
					
gr_module("gm_minjieyingshi")

recommendareaArea = inherit(GmCtrl.ControlBase):name("recommendareaArea")

recommendareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "recommendareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
	self.closed = nil
		
	self.fid = nil
		
	self.modal = nil
			
	
	
		
	
	self.sorkey = 'tid'

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


recommendareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('recommendareaArea callback error ',key,tb)
	end
end



recommendareaArea.set_data = function(self,data)
	self.data = data
	
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end



recommendareaArea.set_closed = function(self,value)
	self.closed = value
end
		
recommendareaArea.set_fid = function(self,value)
	self.fid = value
end
		
recommendareaArea.set_modal = function(self,value)
	self.modal = value
end
		