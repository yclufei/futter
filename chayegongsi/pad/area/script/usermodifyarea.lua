	

-- D:\GOA\reslibrary\templete\res\area\area.pad.lua.xsl
					
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
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


usermodifyareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('usermodifyareaArea callback error ',key,tb)
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


