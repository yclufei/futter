
gr_module("GmBase")

search2Area = inherit(GmCtrl.ControlBase):name("search2Area")

search2Area.init = function(self,parent,fname,ptitle)

	local top = self

	local fid = fname or "search2Area"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	
	self.jumpleft = self:get_child("jump_left")
	
end


search2Area.set_left = function(self,pleftclass,pfunc)
	if pleftclass then
		self.jumpleft:set_class(pleftclass)
		if pfunc then
			self.jumpleft:set_click(pfunc)
		end
	else
		self.jumpleft:set_class("emptyNavTD")
		self.jumpleft:set_click(function() end)
	end
end


