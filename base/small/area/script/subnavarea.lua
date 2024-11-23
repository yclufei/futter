
gr_module("GmBase")

subnavArea = inherit(GmCtrl.ControlBase):name("subnavArea")

subnavArea.init = function(self,parent,fname,ptitle)

	local top = self

	local fid = fname or "subnav"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.navtitle = self:get_child("navtitle")
	self.jumpleft = self:get_child("jump_left")
	self.jumpright = self:get_child("jump_right")
	
	self:set_title(ptitle)
	
end


subnavArea.set_left_back = function(self)
	local top = self
	self:set_left('navbackbtn centerbg NavTDWidth floatL',function() top.hostWindow:delTopNavFrame() end)
end

subnavArea.set_title = function(self,ptitle)
	if ptitle and string.len(ptitle) > 0 then
		self.navtitle:set_inner_text(ptitle)
	end
end


subnavArea.set_middle_control = function(self,c)
	if c then
		c:set_parent(self.navtitle)
	end
end


subnavArea.set_left = function(self,pleftclass,pfunc)

	if pleftclass then
		self.jumpleft:set_class(pleftclass.." NavTDWidth")
		if pfunc then
			self.jumpleft:set_mousedown(pfunc)
		end
	else
		self.jumpleft:set_class("emptyNavTD NavTDWidth padding14 heightNav")
		self.jumpleft:set_mousedown(function() end)
	end

end


subnavArea.set_right = function(self,prightclass,pfunc)
	if prightclass then
		self.jumpright:set_class(prightclass.." NavTDWidth")
		if pfunc then
			self.jumpright:set_mousedown(pfunc)		
		end
	else
		self.jumpright:set_class("emptyNavTD padding14 NavTDWidth heightNav")
		self.jumpright:set_mousedown(function() end)
	end
end


