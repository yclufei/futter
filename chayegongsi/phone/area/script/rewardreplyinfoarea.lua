	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_chayegongsi")

rewardreplyinfoareaArea = inherit(GmCtrl.ControlBase):name("rewardreplyinfoareaArea")

rewardreplyinfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardreplyinfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
		self.rewardreplydetail = gm_chayegongsi.rewardreplyitemItem(self.scrollcontainer)
		-- form.lua.xsl form 91
		
		-- form.lua.xsl form 38
	self.message = self:get_child('message')
	self.message:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.useip = self:get_child('useip')
	self.useip:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.port = self:get_child('port')
	self.port:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.anonymous = self:get_child('anonymous')
	self.anonymous:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.usesig = self:get_child('usesig')
	self.usesig:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.htmlon = self:get_child('htmlon')
	self.htmlon:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.bbcodeoff = self:get_child('bbcodeoff')
	self.bbcodeoff:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.smileyoff = self:get_child('smileyoff')
	self.smileyoff:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.parseurloff = self:get_child('parseurloff')
	self.parseurloff:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.attachment = self:get_child('attachment')
	self.attachment:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.digest = self:get_child('digest')
	self.digest:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.rate = self:get_child('rate')
	self.rate:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.closed = self:get_child('closed')
	self.closed:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.ratetimes = self:get_child('ratetimes')
	self.ratetimes:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.status = self:get_child('status')
	self.status:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.replycredit = self:get_child('replycredit')
	self.replycredit:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.special = self:get_child('special')
	self.special:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.uid = self:get_child('uid')
	self.uid:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	

	self.page = 0
	
	self:show_scroll_bar(true)

end






rewardreplyinfoareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


rewardreplyinfoareaArea.set_data = function(self,data)
	self.data = data
	
	if self.rewardreplydetail and self.rewardreplydetail.set_data then
		self.rewardreplydetail:set_data(data)
	end			
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


