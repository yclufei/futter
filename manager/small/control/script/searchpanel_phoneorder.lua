
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

PhoneOrderSearchPanel = inherit(GmCtrl.ControlBase):name("PhoneOrderSearchPanel")

PhoneOrderSearchPanel.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "searchpanel_phoneorder"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	
	self.btsearchget = self:get_child("btsearchget")
	self.btsearchget:set_click(function()
--																	print("self.btsearchcancel:set_click",self.frame.hideSearchArea)
																	local tb = self:get_childs_inner_text()
																	--table.print(tb)
																	self.frame:hideSearchArea()
																end)
	
	self.btsearchcancel = self:get_child("btsearchcancel")
	self.btsearchcancel:set_click(function()
--																	print("self.btsearchcancel:set_click",self.frame.hideSearchArea)
																	self.frame:hideSearchArea()
																end)
	
end

PhoneOrderSearchPanel.set_frame = function(self,frame)
	self.frame = frame	
end

PhoneOrderSearchPanel.set_data = function(self,data)
	--print("PhoneOrderSearchPanel.set_data = function(self,data)")
	--table.print(data)
end
