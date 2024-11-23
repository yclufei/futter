	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_chayegongsi")

rewardinfoareaArea = inherit(GmCtrl.ControlBase):name("rewardinfoareaArea")

rewardinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	

	self.rewardhead = GmCtrl.ItemHeadPriceCtrl(self.scrollcontainer)	
	self.message = GmCtrl.ItemMessageCtrl(self.scrollcontainer)	
			


		
				

	self.btreply = self:get_child('btreply')
	self.btreply:set_click(function(bt)
		top.hostWindow:addNavFrame('rewardreplyadd',nil,function(frame)
			frame:set_data(top.data)
		end)
	end)
	
	
	
				
	
	self:show_scroll_bar(true)

end



rewardinfoareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


rewardinfoareaArea.set_data = function(self,data)
	self.data = data
	
	self.rewardhead:set_data(data)
	self.message:set_data(data)
	
	
end
	
	