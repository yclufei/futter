
gr_module("GmBase")

Pop = inherit(GmCtrl.ControlBase):name("Pop")

Pop.init = function(self,parent)

	local top = self
	GmCtrl.ControlBase.init(self,parent,"poparent")
	
	self.ctrls['select'] = GmBase.popSelectFrame(self)
	self.ctrls['address'] = GmBase.popAddressFrame(self)
	self.ctrls['dirlist'] = GmBase.PopDirlist(self)
	self.ctrls['filelist'] = GmBase.PopFilelist(self)
	self.ctrls['treelist'] = GmBase.poptreelistFrame(self)
	self.ctrls['input'] = GmBase.popInputFrame(self)
	self.ctrls['image'] = GmBase.popImageFrame(self)
	self.ctrls['textarea'] = GmBase.popTextareaFrame(self)
	self.ctrls['objectlist'] = GmBase.popObjectListFrame(self)
	
	self:set_mousedown(function(self)
		self:set_visible(false)
		if self.cur then
			self.cur:set_visible(false)
		end
		self:updatetick(true)
	end)
	
	self:set_visible(false)
	
end



Pop.show_pop = function(self,pname,sh)
	
	-- print('%%%%%%%%%%%%%%%%%%%% Pop.show_pop',pname,sh)
	
	if self.cur then
		self.cur:set_visible(false)
	end
	
	self:set_visible(sh)

	if self.ctrls[pname] then
		self.cur = self.ctrls[pname]
		self.cur:set_visible(sh)
	end
		
	self:layout()
	self:updatetickMsg(true)
	return self.cur
end

