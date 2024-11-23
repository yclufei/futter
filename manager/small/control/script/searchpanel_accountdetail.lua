
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

AccountDetailSearchPanel = inherit(GmCtrl.ControlBase):name("AccountDetailSearchPanel")

AccountDetailSearchPanel.init = function (self,parent,itemid)
--	print("AccountDetailSearchPanel.init")
	local top = self
	local fid = itemid or "searchpanel_accountdetail"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end	
			
	self.btsearchget = self:get_child("btsearchget")
	self.btsearchget:set_click(function()
																	local tb = self:get_childs_inner_text()
																	self.frame:hideSearchArea()
																end)
	
	self.btsearchcancel = self:get_child("btsearchcancel")
	self.btsearchcancel:set_click(function()
																	self.frame:hideSearchArea()
																end)

end

AccountDetailSearchPanel.set_frame = function(self,frame)
	self.frame = frame	
end

AccountDetailSearchPanel.set_data = function(self,data)
	--print("AccountDetailSearchPanel.set_data = function(self,data)")
	--table.print(data)
end
