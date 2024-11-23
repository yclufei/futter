	

-- D:\GOA\reslibrary\templete\res\area\area.pc.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardinfoareaArea = inherit(GmCtrl.ControlBase):name("rewardinfoareaArea")

rewardinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.rewardhead = GmCtrl.ItemHeadPriceCtrl(self.scrollcontainer)	
	self.message = self.scrollcontainer:get_child('message')			
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


rewardinfoareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('rewardinfoareaArea callback error ',key,tb)
	end
end



rewardinfoareaArea.set_data = function(self,data)
	self.data = data
	
	if self.rewarddetail and self.rewarddetail.set_data then
		self.rewarddetail:set_data(data)
	end			
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


