

-- D:\GOA\reslibrary\templete\default\phone\item\rewarditem\lua.xsl
gr_module("gm_chayegongsi")

rewarditemItem = inherit(GmCtrl.ControlBase):name("rewarditemItem")

rewarditemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "rewarditemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	

	self.rewardhead = GmCtrl.ItemHeadPriceCtrl(self)

	
end


rewarditemItem.set_data = function(self,data)
	self.data = data
	
	self.rewardhead:set_data(data)
	
	
end


	