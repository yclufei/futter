
gr_module("GmCtrl")

ursCountCtrl = inherit(GmCtrl.ControlBase):name("ursCountCtrl")

ursCountCtrl.init = function (self,parent,elename)

	local top = self	
	
	GmCtrl.ControlBase.init(self,parent,elename or "ursCountCtrl")

	self.posts = self:get_child('posts')
	
end



ursCountCtrl.set_data = function(self,data)

	if data then
		self.data = data
	end
	
	self:set_childs_inner_text(self.data)
	
end

