
gr_module("GmCtrl")

ItemFootCountCtrl = inherit(GmCtrl.ControlBase):name("ItemFootCountCtrl")

ItemFootCountCtrl.init = function(self,parent,elename)
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "ItemFootCountCtrl")
	
	self.favtimes = self:get_child("favtimes_div")
	self.replies = self:get_child("replies_div")
	self.views = self:get_child("views_div")
	
end

ItemFootCountCtrl.set_data = function(self,data)

	if data['views'] then
		self.views:set_inner_text(tostring(data['views']))
	end

	if data['favtimes'] then
		self.favtimes:set_inner_text(tostring(data['favtimes']))
	end

	if data['replies'] then
		self.replies:set_inner_text(tostring(data['replies']))
	end
	

end
