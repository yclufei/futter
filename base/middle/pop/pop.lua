
gr_module("GmBase")

Pop = inherit(GmCtrl.ControlBase):name("Pop")

Pop.init = function(self,parent)

	local top = self
	GmCtrl.ControlBase.init(self,parent,"pop")
	
	self.ctrls['dirlist'] = GmBase.PopDirlist(self)
	self.ctrls['filelist'] = GmBase.PopFilelist(self)
	
end


Pop.show_pop = function(self,pname,sh)
	self.ctrls[pname]:set_visible(sh)
	return self.ctrls[pname]
end
