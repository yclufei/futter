

gr_module("gm_chayegongsi")

useritemItem = inherit(GmCtrl.ControlBase):name("useritemItem")

useritemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "useritemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)


	self.itemctrl = GmCtrl.ItemHeadPriceCtrl(self)
	
	
end


useritemItem.set_data = function(self,data)
	self.data = data
	
	self.itemctrl:set_data(data)
end


	