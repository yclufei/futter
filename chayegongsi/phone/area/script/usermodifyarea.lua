	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_chayegongsi")

usermodifyareaArea = inherit(GmCtrl.ControlBase):name("usermodifyareaArea")

usermodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "usermodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
		-- form.lua.xsl form 87 chayegongsi/classdata/userpost.xml
		
		-- form.lua.xsl form 38
	self.avatar = self:get_child('avatar')
	self.avatar:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.mobilenum = self:get_child('mobilenum')
	self.mobilenum:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.username = self:get_child('username')
	self.username:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.password = self:get_child('password')
	self.password:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
		
	self.modify = self:get_child('modify')
	self.modify:set_click(function(link)			
		-- todo
		top.mgr:run('',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)

end






usermodifyareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


usermodifyareaArea.set_data = function(self,data)
	self.data = data
	
	if self.userpost and self.userpost.set_data then
		self.userpost:set_data(data)
	end			
		
	if self.br and self.br.set_data then
		self.br:set_data(data)
	end
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


