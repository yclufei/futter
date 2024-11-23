
gr_module("GmBase")

simplelistitemArea = inherit(GmCtrl.ControlBase):name("simplelistitemArea")

simplelistitemArea.init = function(self,parent,fname)

	local top = self

	local fid = fname or "simplelistitemarea"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.content = self:get_child("title")
	self.content:set_click(function() 
		top.parent.hostWindow:on_command(top.data)
	end)
end

simplelistitemArea.set_data = function(self,data)
	self:set_childs_inner_text(data)
	self.data = data
end